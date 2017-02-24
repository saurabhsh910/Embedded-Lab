/**
 * @file   syscalls.h
 *
 * @brief  Syscall handlers, used by kernel's SWI handler.
 *
 * @date   11/01/2016
 * @author Philip Lee <plee2@andrew.cmu.edu>
 * @author Saurabh Sharma <saurabh2@andrew.cmu.edu>
 * @author Tong Bian <tbian@andrew.cmu.edu>
 */

#ifndef _SYSCALLS_H_
#define _SYSCALLS_H_

#include <kstdint.h>
#include <mutex_type.h>

/** @brief the enumerator of task status */
typedef enum { RUNNABLE, WAITING, RUNNING } tstatus;

/** @brief Signature of a thread function
 *
 *  Each thread should run a function that never exits. Instead, you can assume
 *  that any test functions will spin wait (if we want to overrun the execution
 *  time) or use wait_until_next_period().
 */
typedef void (*thread_fn) (void);


/** @brief struct for item in TCB*/ 
struct TCBBlock {
  /** @brief LR for service mode */ 
  uint32_t spsr_svc;
  /** @brief Stack pointer for task */ 
  uint32_t sp;
  /** @brief LR for task */ 
  uint32_t lr;
  /** @brief SPSR of irq mode/CPSR of user mode */ 
  uint32_t spsr_irq; 
  /** @brief Holds r0-r12 for process */ 
  uint32_t registers[13];
  /** @brief Program counter for task (link register in irq mode) B*/ 
  uint32_t lr_irq; 
  /** @brief Computation time for task */ 
  uint32_t C; 
  /** @brief Period for task */ 
  uint32_t T; 
  /** @brief  Priority for task */ 
  uint8_t priority;
  /** @brief  Saved priority for task */ 
  uint8_t priority_old;
  /** @brief Task status (runnable, waiting, running)*/ 
  tstatus status; 
  /** @brief  Timestamp for start of next period */ 
  uint32_t next_period; 
  /** @brief Timestamp to wake up at */ 
  uint32_t wake; 
  /** @brief How much CPU time used this period */ 
  uint32_t computed;
};

extern volatile struct TCBBlock tcb[32];
extern volatile struct TCBBlock* curr_tcb;
extern volatile int wait_check;
extern volatile int adc_channel;
extern volatile uint32_t runnable_pool;
extern volatile uint32_t waiting_pool;
extern volatile uint32_t timer_count;
extern volatile struct mutex* mutex_pool[32];

/**
 * @brief See linux man page for sbrk
 *
 * @param incr  amount to increment data segment size by.
 * @return -1 if error, or the previous end address of the heap
 */
void *syscall_sbrk(int incr);

/**
 * @brief See linux man page for write
 *
 * @param file  file descriptor to write to. We only support STDOUT.
 * @param ptr   pointer to buffer to write to
 * @param len   max length to write
 * @return -1 on error, otherwise the number of bytes written
 */
int syscall_write(int file, char *ptr, int len);

/**
 * @brief See linux man page for close.
 * Since we only read/write to stdin/stdout, close doesn't really do anything.
 *
 * @param file  file descriptor to close.
 * @return -1 on error, 0 on success.
 */
int syscall_close(int file);

/**
 * @brief See linux man page for fstat.
 * Since we don't have a file system, this doesn't actually do anything.
 *
 * @param file file descriptor to examine
 * @param st   pointer to stat structure
 * @return -1 on error, 0 on success
 */
int syscall_fstat(int file, void *st);

/**
 * @brief See linux man page for isatty.
 * Our implementation always returns TRUE since we only use stdin and stdout
 *
 * @param file  file descriptor to check.
 * @return boolean (1 or 0) indicating whether the fd is a tty
 */
int syscall_isatty(int file);

/**
 * @brief See linux man page for lseek.
 * Not implemented in our kernel since we don't have a filesystem.
 *
 * @param file  file descriptor
 * @param offset  offset
 * @param whence  see man page for appropriate values
 * @return -1 on error, 0 on success
 */
int syscall_lseek(int file, int offset, int whence);

/**
 * @brief See linux man page for read.
 *
 * @param file  file descriptor to read from. We only support STDIN.
 * @param ptr   pointer to buffer to read from
 * @param len   max length to read
 * @return -1 on error, otherwise number of bytes read
 */
int syscall_read(int file, char *ptr, int len);

/**
 * @brief Print out the exit status of the user program and hang with interrupts
 *        disabled (this is different behavior than the Linux man pages!)
 *
 * @param status Exit status to return to the kernel
 */
void syscall_exit(int status);

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
  void (*callback)(uint16_t));

/**
 * @brief Stops periodic sampling of the ADC.
 *
 * @return 0 on success or -1 on failure
 */
int syscall_sample_adc_stop();

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
int thread_init(thread_fn idle_fn, uint32_t *idle_stack_start); 

/** @brief Allow the kernel to start running the added task set.
 *
 *  This function should enable IRQs and thus enable your scheduler. The kernel
 *  will test that a task set with this new task is scheduleable before running
 *  and may return an error if this is not the case.
 *
 *  @return 0 on success or -1 on failure
 */
int scheduler_start(void); 

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
int thread_create(thread_fn fn, uint32_t *stack_start, 
  unsigned int prio, unsigned int C, unsigned int T); 


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
int mutex_init(mutex_t *mutex, unsigned int max_prio);

/** @brief Lock the mutex
 *
 *  This function will not return (may block) until the current thread has
 *  exclusive rights to the mutex. You can assume the mutex has been
 *  initialized.
 *
 *  @param mutex The mutex to act on.
 */
void mutex_lock(mutex_t *mutex);

/** @brief Unlock the mutex
 *
 *  @param mutex The mutex to act on.
 */
void mutex_unlock(mutex_t *mutex);

/** @brief Get the current time in milliseconds */
unsigned int get_time(void);

/** @brief Efficiently waits to run until the next period */
void wait_until_next_period(void);


#endif /* _SYSCALLS_H_ */
