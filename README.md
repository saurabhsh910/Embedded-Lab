# Kernel module for a raspberry pi
Developed a real-time kernel module for raspberry pi with a scheduler and used the highest locker priority to provide synchronization.

# LAB 0

The goal of this lab is to set up the environment for the class and ensure that you can compile, load and debug code for the Raspberry Pi. You will learn about the Raspberry Pi boot sequence, runtime and how to cross compile and develop with a standard GNU GCC toolchain.

# LAB 1

The goal of this lab is to gain experience interacting with Memory Mapped IO (MMIO) by interfacing with embedded peripheral devices, as well as gaining experience working with timer interrupts. During the first part of this lab, you will implement the supporting software required for the UART peripheral for the Raspberry Pi, as well as configure the built-in timer. You will use this timer to measure performance and see the results of optimizing ARM assembly code. In the second part of the lab, you will implement a driver for the I2C peripheral, and the ADS1015 Analog-to- Digital converter that is off-chip on your breakout board. During this lab you will implement the supporting software required for UART and I2C peripherals for the Raspberry Pi. Finally, you will use this driver to implement a simple clap (impulse) detector that flashes the green LED on the Raspberry Pi every time a clap is heard using a simple cyclic executive architecture. Make sure to read through the lab handout and tips carefully before beginning.

# LAB 2

The goal of this lab is to build the first part of your kernel that provides user space isolation, interrupts, and the ability to host a simple audio application. In the last lab, you implemented a cyclic-executive style (single infinite loop) program that ran entirely in supervisory mode. In this lab, you will create a kernel capable of running arbitrary programs in user space. Your new kernel will be able to handle requests from user processes via system calls. Finally to test your kernel, you’ll write a frequency detection program using a few custom defined system calls that is similar in spirit to a guitar tuner.

# LAB 3

In this lab, you will develop a real-time kernel capable of admission control, task scheduling and synchronization. The lab is divided into three main parts: (1) context switching and task management, (2) fixed priority rate-monotonic scheduling with admission control and (3) real-time synchronization using the highest locker variant of the priority ceiling protocol.

# LAB 4

The objective of this lab is to install Linux on your Pi and learn how to develop loadable kernel modules (LKMs) that allow user-space applications to interact with hardware devices. The LKM’s you will build in this lab will allow you to interface with the encoders and motor on your I/O board. Using these kernel modules, you will build a user space application to control the position and speed of the wheel using a PID controller and visualize it using the screen.
