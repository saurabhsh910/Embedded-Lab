/**
 * @file   uart.c
 *
 * @brief  lower level hardware interactions for uart on pi
 *
 * @date   9/24/2016
 * @author Philip Lee <plee2@andrew.cmu.edu>
 */

#include <BCM2836.h>
#include <kstdint.h>
#include <gpio.h>

/** @brief GPIO UART RX pin */
#define RX_PIN 15
/** @brief GPIO UART TX pin */
#define TX_PIN 14

/** @brief Sets baud rate to desired 115200 */
#define BAUD_RATE 270

/** @brief Disable interrupts in IER */
#define IER_DISABLE_INTERRUPTS 0

/** @brief Set IIR to 198 to enable and clear fifo */
#define IIR_SET 198

/** @brief Enable UART in control reg */
#define ENABLE_UART 3 

/** @brief Enable UART */
#define ENABLE 1
/** @brief Disable UART */
#define DISABLE 0

/** @brief Clear FIFO */
#define IIR_CLEAR 0x6;

/** @brief Clear send FIFO */
#define CLEAR_SEND 0x2
/** @brief Send FIFO done */
#define SEND_DONE 0x40

/** @brief Receive FIFO done */
#define RECEIVE_DONE 0x1

/** @brief physical address of AUX_MU_BAUD register */
#define AUX_MU_BAUD_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215068)
/** @brief physical address of AUXENB register for MMIO */
#define AUXENB_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215004)
/** @brief physical address of AUX_MU_IO_REG register */
#define AUX_MU_IO_REG_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215040)
/** @brief physical address of AUX_MU_IER_REG register */
#define AUX_MU_IER_REG_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215044)
/** @brief physical address of AUX_MU_IIR_REG register */
#define AUX_MU_IIR_REG_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215048)
/** @brief physical address of AUX_MU_LCR_REG register */
#define AUX_MU_LCR_REG_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x21504C)
/** @brief physical address of AUX_MU_LSR_REG register */
#define AUX_MU_LSR_REG_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215054)
/** @brief physical address of AUX_MU_CNTL_REG register */
#define AUX_MU_CNTL_REG_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215060)

/** @brief aux_mu_baud register set */
static volatile uint32_t* aux_mu_baud = (volatile uint32_t*) AUX_MU_BAUD_REG;
/** @brief auxenb register set */
static volatile uint32_t* auxenb = (volatile uint32_t*) AUXENB_REG;
/** @brief aux_mu_ier_reg register set */
static volatile uint32_t* aux_mu_ier_reg = (volatile uint32_t*) AUX_MU_IER_REG_REG;
/** @brief aux_mu_iier_reg register set */
static volatile uint32_t* aux_mu_iir_reg = (volatile uint32_t*) AUX_MU_IIR_REG_REG;
/** @brief aux_mu_lcr register set */
static volatile uint32_t* aux_mu_lcr_reg = (volatile uint32_t*) AUX_MU_LCR_REG_REG;
/** @brief aux_mu_io_reg register set */
static volatile uint32_t* aux_mu_io_reg = (volatile uint32_t*) AUX_MU_IO_REG_REG;
/** @brief AUX_MU_CNTL_REG register set */
static volatile uint32_t* aux_mu_cntl_reg = (volatile uint32_t*) AUX_MU_CNTL_REG_REG;
/** @brief AUX_MU_LSR_REG register set */
static volatile uint32_t* aux_mu_lsr_reg = (volatile uint32_t*) AUX_MU_LSR_REG_REG;


/**
 * @brief initializes UART to 115200 baud in 8-bit mode
 */
void uart_init(void) {
  // Configure GPIO pullups
  gpio_set_pull(RX_PIN, GPIO_PULL_DISABLE);
  gpio_set_pull(TX_PIN, GPIO_PULL_DISABLE);
  // Set GPIO pins to correct function on pg 102 of BCM2835 peripherals
  gpio_config(RX_PIN, GPIO_FUN_ALT5);
  gpio_config(TX_PIN, GPIO_FUN_ALT5);
  
  // Enable MMIO peripherals of UART (pg 9)
  *auxenb = ENABLE;
  // Set baud rate (pg 19)
  *aux_mu_baud = BAUD_RATE; //270.267
  // Set to 0 for no interrupts
  *aux_mu_ier_reg = IER_DISABLE_INTERRUPTS;
  // Only care about FIFO bits [2:1]
  *aux_mu_iir_reg = IIR_SET ;

  // Set to 1 to enable 8 bit mode (Dont touch DLAB access in AUX_MU_LC_REG)
  *aux_mu_lcr_reg = ENABLE_UART; // Set to 1 for mini-uart, 3 for 16550 uart?
  *aux_mu_cntl_reg = ENABLE_UART;
  *aux_mu_lcr_reg = ENABLE;
}

/**
 * @brief closes UART
 */
void uart_close(void) {
  *auxenb = DISABLE;
}

/**
 * @brief sends a byte over UART
 *
 * @param byte the byte to send
 */
void uart_put_byte(uint8_t byte) {

  // Clear transmit FIFO
	*aux_mu_iir_reg = *aux_mu_iir_reg | CLEAR_SEND;
  
  while(1){
    if((*aux_mu_lsr_reg & SEND_DONE) == SEND_DONE) {
      break;
    }
  }

  // Put byte into transmit FIFO
  *aux_mu_io_reg =  byte;
}

/**
 * @brief reads a byte over UART
 *
 * @return the byte received
 */
uint8_t uart_get_byte(void) {

  // Wait for receive FIFO to have stuff
  while(1){
    if( (*aux_mu_lsr_reg & RECEIVE_DONE) == RECEIVE_DONE){
      break;
    }
  }
  // Get byte from recieve FIFO
  uint8_t incoming = (uint8_t) *aux_mu_io_reg;

  return incoming;
}
