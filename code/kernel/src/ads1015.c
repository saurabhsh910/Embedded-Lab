/**
 * @file   ads1015.c
 *
 * @brief  I2C driver for ads1015
 *
 * @date   10/03/2016
 * @author Philip Lee <plee2@andrew.cmu.edu>
 * @author Saurabh Sharma <saurabh2@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <i2c.h>
#include <printk.h>

/** @brief I2C Clock speeds */
#define I2C_CLK_100KHZ 0x5dc
/** @brief Addr of ADC */
#define SLAVE_ADDR 0x49
/** @brief Addr of Conversion_reg */
#define CONVERSION_REG 0x0
/** @brief Addr of Config_reg */
#define CONFIG_REG 0x1
/** @brief Addr of LSB of Config register */
#define LSB 0x83
/** @brief Addr of MSB of Config register in case of Sound sensor*/
#define SOUND_MSB 0x64
/** @brief Addr of MSB of Config register in case of Light sensor*/
#define LIGHT_MSB 0x70

void adc_init(void) 
{
  // Initialize i2c with default clk speed
  i2c_master_init(I2C_CLK_100KHZ);
}

uint16_t adc_read(uint8_t channel) 
{
  uint8_t buffer[3]; // Size 3 for up to 3 messages to send/receive

  buffer[0] = CONFIG_REG;  // Point to config register

  // Read adc values from  channel given
  switch (channel) {
    case 3: // Light
      buffer[1] = LIGHT_MSB; // Write ‭0 111 000 0 to MSB to begin single conversion, AIN3, +-6.144V gain, continuous
      break;
    case 2: // Sound
      buffer[1] = SOUND_MSB; // Write ‭0 110 010 0 to MSB to begin single conversion, AIN2, gain, continuous
  }

  buffer[2] = LSB; // Write 100 0 0 0 11 to LSB to default data rate, disable comparator
  i2c_master_write(buffer, 3, SLAVE_ADDR);

  buffer[0] = CONVERSION_REG; // Point to conversion register
  i2c_master_write(buffer, 1, SLAVE_ADDR);

  // Read the converted digital values from conversion register
  i2c_master_read(buffer, 2, SLAVE_ADDR);
  uint16_t digital_value = ((uint16_t)buffer[0] << 8) + buffer[1];

  // Return value read through I2C from ADC
  return digital_value; 

return 0;
}