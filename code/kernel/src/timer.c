/**
 * @file   timer.c
 *
 * @brief  Implementation of routines for interacting with ARM timer
 *
 * @date   10/5/2016
 * @author Philip Lee <plee2@andrew.cmu.edu>
 */

#include <timer.h>
#include <kstdint.h>
#include <printk.h>
#include <BCM2836.h>

/** @brief physical address of IRQ basic pending register */
#define IRQ_BASIC_PENDING_REG (volatile uint32_t*)(MMIO_BASE_PHYSICAL+0xB200)
/** @brief physical address of IRQ basic pending register */
#define IRQ_BASIC_ENABLE_REG (volatile uint32_t*)(MMIO_BASE_PHYSICAL+0xB218)
/** @brief physical address of IRQ basic pending register */
#define IRQ_BASIC_DISABLE_REG (volatile uint32_t*)(MMIO_BASE_PHYSICAL+0xB224)

/** @brief physical address of timer load register */
#define TIMER_LOAD_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL+0x00B400)
/** @brief physical address of timer value register */
#define TIMER_VALUE_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL+0x00B404)
/** @brief physical address of timer control register */
#define TIMER_CONTROL_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL+0x00B408)
/** @brief physical address of timer IRQ clear register */
#define TIMER_IRQ_CLEAR (volatile uint32_t *)(MMIO_BASE_PHYSICAL+0x00B40C)
/** @brief physical address of timer IRQ masked register */
#define TIMER_IRQ_MASKED_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL+0x00B414)
/** @brief physical address of timer reload register */
#define TIMER_RELOAD_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL +0x00B418)
/** @brief physical address of timer predivider */
#define TIMER_PREDIVIDER_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL +0x00B41C)
/** @brief Toggle basic ARM Timer interrupts */
#define TOGGLE 1
/** @brief ARM Timer pending interrupt */
#define PENDING 1
/** @brief ARM Timer clear interrupt */
#define CLEAR 1
/** @brief ARM Timer 1sec value for 100Mhz*/
#define TIMER_MAX 1000000 //625 for 1600hz?
/** @brief ARM timer predivider for 1Mhz */
#define FREQ_1MHZ 249

/** @brief ARM control stop timer */
#define TIMER_STOP 0x10322

/** @brief ARM control start timer */
#define TIMER_START 0xA2

/** @brief irq basic pending */
static volatile uint32_t* basic_pending = (volatile uint32_t*) IRQ_BASIC_PENDING_REG;
/** @brief irq basic pending */
static volatile uint32_t* basic_enable = (volatile uint32_t*) IRQ_BASIC_ENABLE_REG;
/** @brief irq basic pending */
static volatile uint32_t* basic_disable = (volatile uint32_t*) IRQ_BASIC_DISABLE_REG;

/** @brief timer load register set */
static volatile uint32_t* timer_load = (volatile uint32_t*) TIMER_LOAD_REG;
/** @brief timer value register set */
// static volatile uint32_t* timer_value = (volatile uint32_t*) TIMER_VALUE_REG;
/** @brief timer control register set */
static volatile uint32_t* timer_control = (volatile uint32_t*) TIMER_CONTROL_REG;
/** @brief timer control register set */
static volatile uint32_t* timer_irq_clear = (volatile uint32_t*) TIMER_IRQ_CLEAR;
/** @brief timer control register set */
// static volatile uint32_t* timer_irq_masked = (volatile uint32_t*) TIMER_IRQ_MASKED_REG;
/** @brief timer reload register set */
static volatile uint32_t* timer_reload = (volatile uint32_t*) TIMER_RELOAD_REG;
/** @brief timer predivider register set */
static volatile uint32_t* timer_predivider = (volatile uint32_t*) TIMER_PREDIVIDER_REG;



/**
 * @brief Disables timer IRQs
 */
void timer_stop(void) {
  // Disable ARM Timer interrupts
  *basic_disable = *basic_disable | TOGGLE;
  return;
}


int timer_is_pending(void) {
  // Check if timer interrupt pending
  return (*basic_pending & PENDING);
}


void timer_clear_pending(void) {
  *timer_irq_clear = CLEAR;
  return;
}

/**
 * @brief Configures the arm timer to start running with the given frequency. The Timer
 *        should run in 32 bit mode, with a prescaler of 1, and with interrupts enabled.
 *
 * @param freq  frequency at which to run the timer
 */
void timer_start(int freq) {
  *timer_irq_clear = CLEAR; // Clear irq register

  // Load timer with 1 million ticks divided by how many times
  *timer_load = (uint32_t)(TIMER_MAX/freq);
  *timer_reload = (uint32_t)(TIMER_MAX/freq);

  // Calculate predivider to get desired frequency done by 250Mhz / desired Mhz -1
  *timer_predivider = FREQ_1MHZ;

  *timer_control = TIMER_START; //0xA2

  // Enable timer interrupts
  *basic_enable = TOGGLE;

  return;
}
