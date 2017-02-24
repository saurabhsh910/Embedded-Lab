/**
 * @file   kernel.c
 *
 * @brief  entry point to the raspberry pi kernel
 *
 * @date   9/24/2016
 * @author Philip Lee <plee2@andrew.cmu.edu>
 * @author Saurabh Sharma <saurabh2@andrew.cmu.edu>
 * @author Tong Bian <tbian@andrew.cmu.edu>
 */

#include <printk.h>
#include <uart.h>
#include <kstdint.h>
#include <ads1015.h>
#include <i2c.h>
#include <arm.h>
#include <timer.h>
#include <supervisor.h>
#include <syscalls.h>
#include <screen.h>


/** @brief Max uint16_t */
#define INT16_MAX 0xFFFF
/** @brief Light channel number */
#define LIGHT_CHANNEL 3
/** @brief Sound channel number */
#define SOUND_CHANNEL 2
/** @brief Threshold value for clap sound */
#define CLAP_THRESHOLD 20000
/** @brief Number of samples to take for audio */
#define SAMPLES 200
/** @brief ASCII VALUE for 1 */
#define SOUND_SENSOR 49
/** @brief ASCII VALUE FOR 0 */
#define LIGHT_SENSOR 48
/** @brief Entries in TCB that need to be stored */
#define TCB_ENTRIES 18
/** @brief Priority of idle thread */
#define IDLE_PRIO 31
/** @brief Columns on oled screen */
#define COLUMNS 126

extern volatile int wait_check;
extern volatile uint32_t timer_count;
extern volatile uint32_t runnable_pool;
extern volatile uint32_t waiting_pool;
extern volatile struct mutex* mutex_pool[32];

/** @brief Current column on oled screen */
static int column_count = 0;


/**
 * @brief The kernel entry point
 */
void kernel_main(void) {
  uart_init();
  adc_init();
  install_interrupt_table();
  oled_init();
  oled_buf_clr();
  enter_user_mode();
  return;
}

/**
* @brief Scheduler
*
* Find next runnable task in pool.
* 
* @return Pointer to new context to resume
*/
void scheduler(void* data){
  if(curr_tcb->priority_old != IDLE_PRIO){
    // Increment current process's cpu time
    curr_tcb->computed+=1;

    // Check if running task is waiting status (called waiting syscall)
    // If so, put into waiting pool and set "wake"
    if(curr_tcb->status == WAITING){
      waiting_pool |= ((uint32_t)1 << curr_tcb->priority_old);
      curr_tcb->wake = curr_tcb->next_period;
      curr_tcb->computed = 0;
    }

    // Check if running task is past C
    // If so, put into waiting pool and set "wake"
    else if(curr_tcb->computed >= curr_tcb->C){
      waiting_pool |= ((uint32_t)1 << curr_tcb->priority_old);
      curr_tcb->status = WAITING;
      curr_tcb->wake = curr_tcb->next_period;
      curr_tcb->computed = 0;
    }

    else{ // Set current task to runnable
      // printk("Before Runnable pool: %u\n", runnable_pool);
      runnable_pool |= 1 << curr_tcb->priority_old; // Set 31st bit to 1
      curr_tcb->status = RUNNABLE;
      // printk("After Runnable pool: %u\n", runnable_pool);
    }
  }

  // Move any waiting pool tasks into running pool if period is up
  int i;
  for(i = 0; i < IDLE_PRIO;i++){
    if((waiting_pool >> i) & 1){
      if(tcb[i].next_period == timer_count){ // Clear waiting and set runnable
        // printk("Moving %u from waiting to running.\n", i);
        waiting_pool &= ~((uint32_t)1 << i);
        runnable_pool |= ((uint32_t)1 << i);
        tcb[i].next_period += tcb[i].T;
        tcb[i].status = RUNNABLE;
      }
    }
  }

  // Save data into curr_tcb
  if(curr_tcb->priority_old != IDLE_PRIO){
    uint32_t * data_ptr = (uint32_t *) data;
    uint32_t * tcb_ptr = (uint32_t *) curr_tcb;
    int j;
    for(j = 0; j < TCB_ENTRIES; j++){
      tcb_ptr[j] = data_ptr[j];
    }
  }

  int next = IDLE_PRIO;
  // Look for highest priority runnable or mutex
  for(i = 0; i < IDLE_PRIO+1; i++){
    if((runnable_pool >> i) & 1){
      next = i;
      break; 
    }
  }

  for(i = 0; i < IDLE_PRIO+1; i++){
    if(mutex_pool[i] != 0){
      if(mutex_pool[i]-> priority < next){
        next = mutex_pool[i]->owner;
      }
    }
  }

  // Get new to be running process info and set to running
  tcb[next].status = RUNNING;
  // Clear new process bit in runnable pool
  if(next != IDLE_PRIO){
    runnable_pool &= ~(((uint32_t)1) << tcb[next].priority_old); 
  }
  curr_tcb = &tcb[next];
  return;
}

/**
 * @brief handle the updating of screen every time interval
 * this will be called every interval
 * make the screen black by using oled_buf_draw and append
 * columns to the current buffer if not multiple of 128
 * time intervals
 */
void update_screen() {
  // If not idle thread
  if( curr_tcb->priority != 31){

    if(column_count == COLUMNS){
      column_count = 0;
      oled_buf_clr();
    }
    
    oled_buf_pixel_set((int)curr_tcb->priority, column_count);  
    column_count++;
    if(column_count % 16 == 0){
      oled_buf_draw(); 
    }
  }
  return; 
}

 
void (*sample_fn)(uint16_t);
/**
* @brief Handler called when an IRQ occurs
*/
void* irq_c_handler(void* data) {
  if(timer_is_pending()){
    wait_check = 0;
    timer_count++;
    // Clear ARM timer interrupt
    timer_clear_pending();
    scheduler(data);
    update_screen(); 
  }
  return (void *) curr_tcb;
}


/**
 * @brief Handles the given swi_num
 *
 * @param swi_num the swi number passed in from swi_asm_handler
 * @param args pointer to arguments array, set up by the swi_asm_handler
 *
 * @return the return result of the syscall
 */
void *swi_c_handler(int swi_num, int *args) {
  void* result = NULL; 
  switch(swi_num) { 
    case 0x00: 
    result=syscall_sbrk(args[0]); 
    break;  
    case 0x01:
    result=(void*)syscall_write(args[0], (char*) args[1], args[2]);
    break; 
    case 0x02: 
    result= (void*) syscall_close(args[0]);
    break; 
    case 0x03: 
    result= (void*) syscall_fstat(args[0], (void*) args[1] );
    break; 
    case 0x04: 
    result= (void*) syscall_isatty(args[0]);
    break; 
    case 0x05: 
    result= (void*) syscall_lseek(args[0], args[1], args[2] );
    break;
    case 0x06: 
    result= (void*) syscall_read(args[0], (char*) args[1], args[2] );
    break; 
    case 0x07: 
    syscall_exit(args[0]);
    break; 
    case 0x08: 
    result= (void*) syscall_sample_adc_start(args[0], (uint8_t) args[1], 
      (void*)args[2]);
    break; 
    case 0x09: 
    result= (void*) syscall_sample_adc_stop();
    break; 
    case 0xa: 
    result= (void*) thread_init ((thread_fn) args [0], (uint32_t *) args[1]); 
    break; 
    case 0xb:
    result = (void*) thread_create ((thread_fn) args[0], (uint32_t*) args[1], 
      (unsigned int) args [2], (unsigned int) args [3], 
      (unsigned int) args [14]); 
    break; 
    case 0xc:
    result =(void*) mutex_init((mutex_t*)args[0], (unsigned int)args[1]);
    break;
    case 0xd:
    mutex_lock((mutex_t*)args[0]);
    break;
    case 0xe:
    mutex_unlock((mutex_t*)args[0]);
    break;
    case 0xf:
    wait_until_next_period();
    break;
    case 0x10:
    result = (void*) get_time();
    break;
    case 0x11: 
    result = (void*) scheduler_start ();
    break; 
  } 
  
  return result;
}