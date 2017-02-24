/** @file   mutex_type.h
 *
 * @brief  Mutex type definition for 18-349.
 *
 * @date   11/01/2016
 * @author Philip Lee <plee2@andrew.cmu.edu>
 * @author Saurabh Sharma <saurabh2@andrew.cmu.edu>
 * @author Tong Bian <tbian@andrew.cmu.edu>
 */

#ifndef _KERNEL_MUTEX_T_H_
#define _KERNEL_MUTEX_T_H_

/** @brief Mutex struct */
typedef struct mutex {
  /** @brief Max Priority of mutex */
  uint8_t priority;
  /** @brief Owner of mutex */
  uint8_t owner;
} mutex_t;


#endif /* _349LIBK_MUTEX_T_H_ */
