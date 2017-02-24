/**
 * @file   supervisor.S
 *
 * @brief  Assembly implementation to setup interrupts and enter/exit user mode
 *
 * @date 10/14/2016
 * @author Philip Lee <plee2@andrew.cmu.edu>
 * @author Saurabh Sharma <saurabh2@andrew.cmu.edu>
 * @author Tong Bian <tbian@andrew.cmu.edu>
 */

#include <psr.h>

.section ".text"

/**
 * vector table that is loaded by install_vector_table to address 0x0
 */ 
interrupt_vector_table:
  // ARM core does the following on interrupt:
  // 1) save cpsr into spsr
  // 2) set mode bits in current cpsr
  // 3) disable further interrupts of lower/same priority
  // 4) store return address in lr
  // 5) set pc to correct vector table entry below
  ldr pc, _reset_asm_handler                 // priority: 1st
  ldr pc, _undefined_instruction_asm_handler // priority: 6th
  ldr pc, _swi_asm_handler                   // priority: 6th
  ldr pc, _prefetch_abort_asm_handler        // priority: 5th
  ldr pc, _data_abort_asm_handler            // priority: 2nd
  ldr pc, _reset_asm_handler                 // priority: undefined
  ldr pc, _irq_asm_handler                   // priority: 4th
  ldr pc, _fiq_asm_handler                   // priority: 3rd

/**
 * SOFT vector table that is loaded by install_vector_table ABOVE
 * interrupt_vector_table
 */
// to make sure the addresses are aligned this must follow the
// actual vector table above!
_reset_asm_handler:                 .word reset_asm_handler
_undefined_instruction_asm_handler: .word undefined_instruction_asm_handler
_swi_asm_handler:                   .word swi_asm_handler
_prefetch_abort_asm_handler:        .word prefetch_abort_asm_handler
_data_abort_asm_handler:            .word data_abort_asm_handler
_irq_asm_handler:                   .word irq_asm_handler
_fiq_asm_handler:                   .word fiq_asm_handler

/**
 * called to install the vector table at address 0x0
 */
.global install_interrupt_table
install_interrupt_table:
  // Get the address of the interrupt vector table assembly label in a register.
  ldr r1, =interrupt_vector_table

  // Store all 8 ldr instructions starting at 0x0 upward. 
  // {0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, 0x18}
  // Fill in the remaining, 7 soft vector table labels.
  mov r0, #0x0
  ldmia r1!,{r2, r3, r4, r5, r6, r7, r8, r9}
  stmia r0!,{r2, r3, r4, r5, r6, r7, r8, r9}
  ldmia r1!,{r2, r3, r4, r5, r6, r7, r8}
  stmia r0!,{r2, r3, r4, r5, r6, r7, r8}

  movs pc, lr

/************************************************************/
/* Assembly handlers for interrupts in the vector table     */
/************************************************************/

swi_asm_handler:
  cpsid i, #PSR_MODE_SYS // Switch to system mode
  stmfd sp!, {r0-r12, lr} // Save context onto user stack
  cps #PSR_MODE_SVC // Switch back to supervisor mode
  mrs r1, spsr // Copy spsr into r0
  mov r0, lr // Save swi lr
  cpsid i, #PSR_MODE_SYS // Switch to system mode
  stmfd sp!, {r0, r1} // Save spsr onto user stack
  add r1, sp, #8 // Point to start of arguements
  cpsid i, #PSR_MODE_SVC // Switch back to supervisor mode

  ldr r0, [lr, #-4]   // extract the SWI number 
  BIC r0, r0, #0xff000000   // get SWI # by bit-masking 

  bl swi_c_handler  // goto handler (see prev lecture)

  cpsid i, #PSR_MODE_SYS // Switch to system mode
  ldmfd sp!, {r1, r2} // Copy spsr and lr
  cpsid i, #PSR_MODE_SVC // Switch back to supervisor mode
  msr spsr, r2 // Restore spsr
  mov lr, r1 // Restore swi lr
  cpsid i, #PSR_MODE_SYS // Switch to system mode
  add sp, sp, #4 // Ignore r0 since thats return value
  ldmfd sp!, {r1-r12, lr} // Restore context from uesr stack
  cpsid i, #PSR_MODE_SVC // Switch back to supervisor mode
  
  movs pc, lr

irq_asm_handler:
  ldr sp, =__irq_stack_top // Set sp_irq to irq stack top
  sub lr, lr, #4  // Subtract 4 from lr_irq to shift to next instruction 
                  // for user program
  stmfd sp!, {r0-r12, lr} // Store r0-r12
  mrs r1, spsr // Put spsr_irq into r1
  stmfd sp!, {r1} // Save spsr_irq onto irq stack

  and r1, r1, #PSR_MODE_USR
  cmp r1, #PSR_MODE_USR // Compare spsr to user mode
  beq user1 // If coming from user mode, branch to use1, else continue 
            // for svc mode

  cpsid i, #PSR_MODE_SVC // Switch to supervisor mode
  mrs r1, spsr
  mov r2, sp //Get sp, lr, and spsr of svc mode
  mov r3, lr
  cpsid i, #PSR_MODE_IRQ // Switch back to irq mode
  stmfd sp!, {r1-r3} // Save spsr, sp, lr onto irq stack
  b done1
user1:
  // Entering from USER mode
  cpsid i, #PSR_MODE_SYS // Switch to system mode
  mov r2, sp// Get sp, and lr
  mov r3, lr
  cpsid i, #PSR_MODE_IRQ // Switch back to irq mode

  mov r1, #0 // 0 in place of spsr
  stmfd sp!, {r1-r3} // Save 0 (in place of spsr_svc, sp, lr onto irq stack
done1:
  // Hold sp for irq_c_handler
  mov r0, sp

  // Branch and link to the irq c handler (defined in kernel/src/kernel.c).
  bl irq_c_handler

  // Restore spsr and compare to determine returning from
  ldr r1, [r0, #12]
  msr spsr, r1
  and r1, r1, #PSR_MODE_USR
  cmp r1, #PSR_MODE_USR
  beq user2 // If user mode, jump to user2

  // Otherwise supervisor mode restore
  cpsid i, #PSR_MODE_SVC // Switch to supervisor mode
  // RESTORE SPSR, SP, LR of svc mode
  ldr r1, [r0]
  msr spsr, r1
  ldr sp, [r0, #4]
  ldr lr, [r0, #8]
  cpsid i, #PSR_MODE_IRQ // Switch back to irq mode
  b done2
user2: // User mode restore
  cpsid i, #PSR_MODE_SYS // Switch to system mode
  // RESTORE SP, LR of user mode
  ldr sp, [r0, #4]
  ldr lr, [r0, #8]
  cpsid i, #PSR_MODE_IRQ // Switch back to irq mode
done2:
  // Restore r0-r12, lr_irq
  add r0, r0, #16
  ldmia r0, {r0-r12, lr}

  movs pc, lr
  
reset_asm_handler:
  b _start // just reset the kernel


/************************************************************
 * If you fall into one of these handlers something bad is
 * happening. bkpt will drop back into gdb so you can debug.
 ************************************************************/
undefined_instruction_asm_handler:
  bkpt

prefetch_abort_asm_handler:
  bkpt

data_abort_asm_handler:
  bkpt

fiq_asm_handler:
  bkpt


/************************************************************/
/* Initializes cpsr for user mode and jumps to user program */
/************************************************************/
.global enter_user_mode
enter_user_mode:
  // 1. Saving the current supervisor context on the kernel's stack.
  sub  sp, sp, #4   // leave room on stack for SPSR
  stmfd sp!, {r0-r12, lr} // store user's gp registers
  mrs r2, cpsr    // get SPSR into gp registers 
  str r2, [sp, #14*4]   // store SPSR above gp registers

  // 2. Changing the processor mode to user mode in the CPSR with IRQ disabled
  ldr r1, =(PSR_MODE_USR | PSR_IRQ)
  msr cpsr,r1

  // 3. Setting the user mode stack pointer to the linker defined 
  // label user stack top.
  ldr r13, =__user_stack_top
  // 4. Jumping to where user code is loaded
  // which is defined by the user program linker label.  
  b __user_program