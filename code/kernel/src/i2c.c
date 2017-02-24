/**
 * @file   i2c.c
 *
 * @brief  I2C driver
 *
 * @date   10/03/2016
 * @author Philip Lee <plee2@andrew.cmu.edu>
 * @author Saurabh Sharma <saurabh2@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <BCM2836.h>
#include <gpio.h>
#include <printk.h>

/** @brief I2C Clock speeds */
#define I2C_CLK_100KHZ 0x5dc
/** @brief I2C data pin */
#define I2C1_SDA 2
/** @brief I2C clock pin */
#define I2C1_SCL 3

/** @brief Enables I2C */
#define I2C_ENB 0x8000
/** @brief Clears Done and ERR ACK flags */
#define CLEAR_FLAGS 0x102
/** @brief Clear FIFO */
#define CLEAR_FIFO 0x30
/** @brief Enable write type */
#define ENB_WRITE 0xFFFFFFFE
/** @brief Enable read type */
#define ENB_READ 0x1
/** @brief Enable transfer */
#define ENB_TRANSFER 0x80
/** @brief Check whether FIFO is full */
#define TXD 0x10
/** @brief Check whether transfer is done */
#define DONE_XFER 0x2

/** @brief physical address of CONTROL_REG register */
#define I2C_CONTROL_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL +0x804000 + 0x0)
/** @brief physical address of STATUS_REG register */
#define I2C_STATUS_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL +0x804000 + 0x4)
/** @brief physical address of DLEN_REG register */
#define I2C_DLEN_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL +0x804000 + 0x8)
/** @brief physical address of ADDRESS_REG register */
#define I2C_ADDRESS_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL +0x804000 + 0xc)
/** @brief physical address of FIFO register */
#define I2C_FIFO_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL +0x804000 + 0x10)
/** @brief physical address of CLKDIVIDER_REG register */
#define I2C_CLKDIVIDER_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL +0x804000 + 0x14)
/** @brief physical address of DELAY_REG register */
#define I2C_DELAY_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL +0x804000 + 0x18)
/** @brief physical address of CLKT_REG register */
#define I2C_CLKT_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL +0x804000 + 0x1C)


/** @brief physical address of CONTROL_REG register */
static volatile uint32_t* i2c_control_reg = (volatile uint32_t*) I2C_CONTROL_REG;
/** @brief physical address of STATUS_REG register */
static volatile uint32_t* i2c_status_reg = (volatile uint32_t*) I2C_STATUS_REG;
/** @brief physical address of DLEN_REG register */
static volatile uint32_t* i2c_dlen_reg = (volatile uint32_t*) I2C_DLEN_REG;
/** @brief physical address of ADDRESS_REG register */
static volatile uint32_t* i2c_address_reg = (volatile uint32_t*) I2C_ADDRESS_REG;
/** @brief physical address of FIFO register */
static volatile uint32_t* i2c_fifo_reg = (volatile uint32_t*) I2C_FIFO_REG;
/** @brief physical address of CLKDIVIDER_REG register */
static volatile uint32_t* i2c_clkdivider_reg = (volatile uint32_t*) I2C_CLKDIVIDER_REG;


/**
 * @brief initializes the I2C module
 * 
 * @param clk bus clock speed
 */ 
void i2c_master_init(uint16_t clk)
{
  // Configure GPIO pullups
  gpio_set_pull(I2C1_SDA, GPIO_PULL_UP);
  gpio_set_pull(I2C1_SCL, GPIO_PULL_UP);
  // Set GPIO pins to correct function on pg 102 of BCM2835 peripherals
  gpio_config(I2C1_SDA, GPIO_FUN_ALT0);
  gpio_config(I2C1_SCL, GPIO_FUN_ALT0);

  // enable I2C (bsc controller is enabled)
  *i2c_control_reg = *i2c_control_reg | I2C_ENB;

  // Set clock speed
  //*i2c_clkdivider_reg = clk;
  *i2c_clkdivider_reg = I2C_CLK_100KHZ;

  // Clear flags
  *i2c_status_reg = *i2c_status_reg | CLEAR_FLAGS;

  // Clear FIFO
  *i2c_control_reg = *i2c_control_reg | CLEAR_FIFO;
}

/**
 * @brief writes to I2C device
 * 
 * @param buf pointer to output data buffer
 * @param len length of output data buffer in bytes
 * @param addr slave device address
 */
uint8_t i2c_master_write(uint8_t *buf, uint16_t len, uint8_t addr) {  
  // Set to write transfer (read bit = 0)
  *i2c_control_reg = *i2c_control_reg & ENB_WRITE;  
  // Set 7 bit slave address
  *i2c_address_reg = addr;
  // Clear flags
  *i2c_status_reg = *i2c_status_reg | CLEAR_FLAGS;
  // Write length to dlen reg
  *i2c_dlen_reg = len;
  // Clear FIFO
  *i2c_control_reg = *i2c_control_reg | CLEAR_FIFO;

  uint16_t i; // Loop counter
  for(i = 0; i< len; i++){
    // Wait till FIFO is not full (TXD)
    while(!(*i2c_status_reg & TXD));
    // Write value of output buffer to FIFO
    *i2c_fifo_reg = buf[i];
  }
  // Start transfer
  *i2c_control_reg = *i2c_control_reg | ENB_TRANSFER;
  // Check for done transfer
  while(!(*i2c_status_reg & DONE_XFER));
  return 0; 
}
  
/**
 * @brief reads from I2C device
 * 
 * @param buf pointer to input data buffer
 * @param len number of bytes to read
 * @param addr slave device address
 */
uint8_t i2c_master_read(uint8_t *buf, uint16_t len, uint8_t addr) {
  // Set to Read transfer (read bit 1)
  *i2c_control_reg = *i2c_control_reg | ENB_READ;
  // Set slave addr to address register
  *i2c_address_reg = addr;
  // Clear flags
  *i2c_status_reg = *i2c_status_reg | CLEAR_FLAGS;
  // Write length to dlen reg
  *i2c_dlen_reg = len;
  // Clear FIFO
  *i2c_control_reg = *i2c_control_reg | CLEAR_FIFO;

  // Start transfer
  *i2c_control_reg = *i2c_control_reg | ENB_TRANSFER;
  
  // Check for done transfer
  while(!(*i2c_status_reg & DONE_XFER));

  uint16_t i;
  for(i=0; i<len; i++){
    // Read fifo
    buf[i] = *i2c_fifo_reg;
  }

  return 0;
}

