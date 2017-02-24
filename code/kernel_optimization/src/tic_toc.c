/**
 * @file   tic_toc.c
 *
 * @brief  Implementation of tic-toc routines for interacting with ARM timer
 *
 * @date   ???
 * @author ??? <???@andrew.cmu.edu>
 */

#include <tic_toc.h>
#include <BCM2836.h>
#include <printk.h>

/** @brief stop timer */
#define STOP_T 0x80
/** @brief clear timer */
#define CLEAR_T 0x0
/** @brief timer value max */
#define MAX_T 0xFFFFFFFF
/** @brief timer divider to get 1 second */
#define DIVIDER_T 249
/** @brief start timer */
#define START_T 0x82

/** @brief the physical address for the start of ARM Timer */
#define BASE_PHYSICAL 0x3F000000 // 0x7E000000

/** @brief physical address of timer load register */
#define TIMER_LOAD_REG (volatile uint32_t *)(BASE_PHYSICAL+0x00B400)
/** @brief physical address of timer value register */
#define TIMER_VALUE_REG (volatile uint32_t *)(BASE_PHYSICAL+0x00B404)
/** @brief physical address of timer control register */
#define TIMER_CONTROL_REG (volatile uint32_t *)(BASE_PHYSICAL+0x00B408)
/** @brief physical address of timer IRQ clear register */
#define TIMER_IRQ_CLEAR (volatile uint32_t *)(BASE_PHYSICAL+0x00B40C)
/** @brief physical address of timer reload register */
#define TIMER_RELOAD_REG (volatile uint32_t *)(BASE_PHYSICAL +0x00B418)
/** @brief physical address of timer predivider */
#define TIMER_PREDIVIDER_REG (volatile uint32_t *)(BASE_PHYSICAL +0x00B41C)

/** @brief timer load register set */
static volatile uint32_t* timer_load = (volatile uint32_t*) TIMER_LOAD_REG;
/** @brief timer value register set */
static volatile uint32_t* timer_value = (volatile uint32_t*) TIMER_VALUE_REG;
/** @brief timer control register set */
static volatile uint32_t* timer_control = (volatile uint32_t*) TIMER_CONTROL_REG;
/** @brief timer control register set */
static volatile uint32_t* timer_irq_clear = (volatile uint32_t*) TIMER_IRQ_CLEAR;
/** @brief timer reload register set */
static volatile uint32_t* timer_reload = (volatile uint32_t*) TIMER_RELOAD_REG;
/** @brief timer predivider register set */
static volatile uint32_t* timer_predivider = (volatile uint32_t*) TIMER_PREDIVIDER_REG;

/**
 * @brief Configures the arm timer to start running from the starting point with the given frequency.
 *        The Timer should run in 32 bit mode, with a prescaler of 1
 */
void tic(void) {
  *timer_control = *timer_control | STOP_T;
  *timer_irq_clear = CLEAR_T;

  // Load timer with 0xFFFFFFFF
  *timer_load = MAX_T;
  *timer_reload = MAX_T;

  // Count down with at least millisecond granularity
  *timer_predivider = DIVIDER_T;

  *timer_control = START_T; // Start timer

  return;
}

/**
 * @brief Called to check the value of the timer.
 *
 * @return timer's decrementing value
 */
uint32_t toc(void) {
  // Toc returns number of milliseconds that have elapsed since tic
  uint32_t elapsed = MAX_T - *timer_value;
  return elapsed;
}
