/**
 * @file   syscalls.c
 *
 * @brief  Implementation of syscalls needed for newlib and 349 custom syscalls
 *
 * @date   10/14/2016
 * @author Philip Lee <plee2@andrew.cmu.edu>
 * @author Saurabh Sharma <saurabh2@andrew.cmu.edu>
 * @author Tong Bian <tbian@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <printk.h>
#include <timer.h>
#include <arm.h>
#include <psr.h>
#include <syscalls.h> 

/** @brief End of Transmission ASCII value */
#define EOT 4
/** @brief Backspace ASCII value */
#define BACKSPACE 8
/** @brief Delete ASCII value */
#define DELETE 127
/** @brief Newline ASCII value */
#define NEWLINE 10
/** @brief Return ASCII value */
#define RETURN 13
/** @brief STDOUT value */
#define STDOUT 1
/** @brief STDIN value */
#define STDIN 0
/** @brief IDLE val */
#define IDLE_PRIO 31
/** @brief Ticks per second for timer */
#define TICKS 500
/** @brief If mutex has no owner, priority == 99 */
#define NO_OWNER 99

extern uint8_t uart_get_byte(void);
extern void uart_put_byte(uint8_t);

/** @brief number of created threads */ 
static volatile int thread_num; 
/** @brief created status array */ 
static volatile uint32_t created;
/** @brief Runnable pool */
volatile uint32_t runnable_pool = 0;
/** @brief Waiting pool */
volatile uint32_t waiting_pool = 0;
/** @brief TCB */
volatile struct TCBBlock tcb[32] = {{0}};
/** @brief global variable to point to tcb of current thread */
volatile struct TCBBlock* curr_tcb;
/** @brief total Utility of all the created threads */ 
static volatile float sum_U; 
/** @brief Keep track of wait for wait until next period */
volatile int wait_check;
/** @brief Global timer that counts up every interrupt (1milli) */
volatile uint32_t timer_count;
/** @brief Mutex pool count for each priority*/
volatile struct mutex* mutex_pool[32] = {0};
/** @brief Global variable to keep track of where our heap ends */
char *heap_end = 0;
/** @brief Global variable for adc channel */
volatile int adc_channel = 2;
/** @brief Values for U for up to 32 threads */
static float U_val[32] = {1.0, 0.828, 0.779, 0.756, 0.743, 0.734, 0.729, 0.724, 
  0.721, 0.718, 0.715, 0.714, 0.712, 0.711, 0.709, 0.708, 0.707, 0.707, 0.706, 
  0.705, 0.705, 0.704, 0.704, 0.703, 0.703, 0.702, 0.702, 0.702, 0.701, 0.701, 
  0.701, 0.701};

/** @brief Initialize the thread library
 *
 *  A user program must call this initializer before attempting to create any
 *  threads or start the scheduler.
 *
 *  @param idle_fn Pointer to a thread function to run when no other threads are
 *  runnable.
 *  @param idle_stack_start Pointer to the first valid location of idle thread's
 *  stack.
 *
 *  @return 0 on success or -1 on failure
 */
int thread_init(thread_fn idle_fn, uint32_t *idle_stack_start){
  /*create a idle thread with priority 31, and set C, T to 
   zero, return -1 if thread with priority has been created */

  timer_count = 0;
  runnable_pool = 0;
  waiting_pool = 0;
  wait_check = 0;
  /*set bit number 31*/  
  created |= (1 << IDLE_PRIO); 
  /*initialize sum_C and sum_T */ 
  sum_U = 0; 
  thread_num = 0; 

  tcb[IDLE_PRIO].spsr_svc = 0;
  tcb[IDLE_PRIO].sp = (uint32_t) idle_stack_start; 
  tcb[IDLE_PRIO].spsr_irq = PSR_MODE_USR;
  tcb[IDLE_PRIO].lr_irq = (uint32_t) idle_fn;
  tcb[IDLE_PRIO].C = 0; 
  tcb[IDLE_PRIO].T = 0; 
  tcb[IDLE_PRIO].priority = IDLE_PRIO; 
  tcb[IDLE_PRIO].status = RUNNABLE; 

  curr_tcb = &tcb[IDLE_PRIO];
  return 0;
}

/** @brief Create a new thread running the given function
 *
 *  @param fn Pointer to the function to run in the new thread.
 *  @param stack_start Pointer to the first valid location of this thread's
 *  stack.
 *  @param prio Priority of this thread. Lower number are higher priority.
 *  @param C Real time execution time (ms).
 *  @param T Real time task period (ms).
 *
 *  @return 0 on success or -1 on failure
 */
int thread_create(thread_fn fn, uint32_t *stack_start, unsigned int prio, 
  unsigned int C, unsigned int T){
  /* check if priority is between 0-30*/ 
  if ((prio < 0)  || (prio >= IDLE_PRIO)) {
    printk("Error: Creating thread with invalid priority.\n");
    return -1; 
  } else if ( ((created >> prio) & 1) == 1 ) {
    /* check whether this task control block is already 
    occupied */ 
    printk("Error: Creating thread with existing priority.\n");
    return -2; 
  } else {
    /* setting the tcbblock variables */ 
    float A = (float) C;
    float B = (float) T;
    
    float U = A/B; 
    float total_U = sum_U + U; 

    if ( total_U > U_val[thread_num] ){
      printk("Error: Total U: %u, U_val:%u\n", (uint32_t)(total_U*1000), 
        (uint32_t)(U_val[thread_num+1]*1000));
      /** out of utility bound */ 
      printk("Error: Trying to create thread out of utility bound.\n");
      return -3; 
    }

    tcb[prio].sp = (uint32_t) stack_start; 
    tcb[prio].spsr_irq = PSR_MODE_USR;
    tcb[prio].lr_irq = (uint32_t) fn;

    tcb[prio].C = C; 
    tcb[prio].T = T; 
    tcb[prio].priority = prio; 
    tcb[prio].priority_old = prio;
    tcb[prio].status = RUNNABLE; 

    tcb[prio].next_period = T;
    tcb[prio].wake = 0;
    tcb[prio].computed = 0;

    thread_num ++; 
    sum_U += U; 
    created |= (1 << prio); 
    runnable_pool |= 1 << prio; // Set 31st bit to 1
  } 

  return 0;
}

/** @brief Allow the kernel to start running the added task set.
 *
 *  This function should enable IRQs and thus enable your scheduler. The kernel
 *  will test that a task set with this new task is scheduleable before running
 *  and may return an error if this is not the case.
 *
 *  @return 0 on success or -1 on failure
 */
int scheduler_start(void){
  /* enable IRQ, use enable_interrupts in */ 
  enable_interrupts(); 
  timer_start(TICKS);
  /* nothing is in runnable pool ? */ 

  while(1){
    continue;
  };

  return 0;
}

/** @brief Efficiently waits to run until the next period */
void wait_until_next_period(void){
  // Change current task to waiting status
  curr_tcb->status = WAITING;
  wait_check = 1;
  enable_interrupts(); 
  while(1){
    if(wait_check == 0){
      break;
    }
  }
  return;
}

/** @brief Initialize the mutex
 *
 *  A user program must call this initializer before attempting to lock or
 *  unlock the mutex. You can assume that this initializer will only be called
 *  once by any test programs.
 *
 *  @param mutex The mutex to act on.
 *  @param max_prio The maximum priority of a thread which could use
 *
 *  @return 0 on success or -1 on failure
 */
int mutex_init(mutex_t *mutex, unsigned int max_prio){
  mutex-> priority = (uint8_t) max_prio;
  mutex->owner = NO_OWNER;
  return 0;
}

/** @brief Lock the mutex
 *
 *  This function will not return (may block) until the current thread has
 *  exclusive rights to the mutex. You can assume the mutex has been
 *  initialized.
 *
 *  @param mutex The mutex to act on.
 */
void mutex_lock(mutex_t *mutex){
  if(mutex->owner != NO_OWNER){
    enable_interrupts();
    while(mutex->owner != NO_OWNER){
      continue;
    }
    disable_interrupts();
  }

  mutex->owner = curr_tcb->priority_old;
  curr_tcb->priority = mutex->priority;

  int i;
  for(i = 0; i < IDLE_PRIO+1; i++){
    if(mutex_pool[i] == 0){
      mutex_pool[i] = mutex;
      break;
    } 
  }

  return;
}

/** @brief Unlock the mutex
 *
 *  @param mutex The mutex to act on.
 */
void mutex_unlock(mutex_t *mutex){
  curr_tcb->priority = curr_tcb->priority_old;
  mutex->owner = NO_OWNER;
  int i;
  for(i = 0; i < IDLE_PRIO+1; i++){
    if(mutex_pool[i] == mutex){
      mutex_pool[i] = 0;
      break;
    } 
  }
  return;
}

/** @brief Get the current time in milliseconds */
unsigned int get_time(void){
  return (unsigned int)timer_count;
}

/**
 * @brief Print out the exit status of the user program and hang with interrupts
 *        disabled (this is different behavior than the Linux man pages!)
 *
 * @param status Exit status to return to the kernel
 */
void syscall_exit(int status) {
  printk("exit: %d\n", status);
  disable_interrupts();
  while(1);
  return;
}

/**
 * @brief See linux man page for write
 *
 * @param file  file descriptor to write to. We only support STDOUT.
 * @param ptr   pointer to buffer to write to
 * @param len   max length to write
 * @return -1 on error, otherwise the number of bytes written
 */
int syscall_write(int file, char *ptr, int len) {
  if(file == STDOUT){
    int i;
    for(i=0;i<len;i++){
      uart_put_byte(ptr[i]);
    }
    return i;
  }
  return -1;
}

/**
 * Reads until all len bytes are read or newline/return is found.
 * Detects backspace and EOL characters and handles them appropriately.
 *
 * The idea is to mimic normal terminal reading input, that is,
 * if the user hits backspace it should erase the previously read character.
 */
/**
 * @brief See linux man page for read.
 *
 * @param file  file descriptor to read from. We only support STDIN.
 * @param ptr   pointer to buffer to read from
 * @param len   max length to rea
dread * @return -1 on error, otherwise number of bytes read
 */
int syscall_read(int file, char *ptr, int len) {
  if(file == STDIN){
    int i = 0;
    uint8_t input = 0;

    while(i<len){
      input = uart_get_byte();

      if(input == EOT){
        // ptr[i] = '\0';
        // i++;
        break;
      }
      else if(input == BACKSPACE || input == DELETE ){
        printk("\b \b");
        i--;
        ptr[i] = '\0';
      }
      else if(input == NEWLINE || input == RETURN){
        printk("\n");
        ptr[i] = '\n';
        i++;
        //ptr[i] = '\0';
        break;
      }
      else{
        printk("%c", input);
        ptr[i] = (char)input;
        i++;
      }
    }

    i++;
    return i;
  }
  printk("Read Syscall with bad fd: %d\n", file);
  return -1;
}

/** @brief Define this in kernel.c */
extern void (*sample_fn)(uint16_t);
/**
 * @brief Starts sampling the ADC periodically, calling the given callback
 *        with the ADC sample value.
 *
 * @param freq      frequency at which to sample
 * @param channel   channel to sample
 * @param callback  function to be called everytime a sample is read from adc.
 *
 * @return 0 on success or -1 on failure
 */
int syscall_sample_adc_start(int freq, uint8_t channel, 
  void (*callback)(uint16_t)) {
  return -1; // Lab 3 degraded
  // Set global variable to set function for c irq handler to call
  adc_channel = channel;
  sample_fn = callback;
  timer_start(freq);
  return 0;
}

/**
 * @brief Stops periodic sampling of the ADC.
 *
 * @return 0 on success or -1 on failure
 */
int syscall_sample_adc_stop() {
  return -1; // Lab 3 degraded
  timer_stop();
  // Failure scenario?
  return 0;
}

/*****************************************************************************/
/* TA system call implementations:                                           */
/*****************************************************************************/

void *syscall_sbrk(int incr) {
  extern char __heap_low; // Defined by the linker
  extern char __heap_top; // Defined by the linker
  char *prev_heap_end;

  if (heap_end == 0) {
    // Initialize heap_end if this is the first time sbrk was called
    heap_end = &__heap_low;
  }

  prev_heap_end = heap_end;
  if (heap_end + incr > &__heap_top) {
    // Heap and stack collision, return error
    return (void *) -1;
  }

  // update heap_end and return old heap_end
  heap_end += incr;
  return (void *) prev_heap_end;
}

int syscall_close(int file) {
  return -1;
}

int syscall_fstat(int file, void *st) {
  return 0;
}

int syscall_isatty(int file) {
  return 1;
}

int syscall_lseek(int file, int ptr, int dir) {
  return 0;
}
