#------------------------------------------------------------------------------
# Spectrev1 with static prediction.
#
# Victim reads memory out-of-bounds abusing static branch prediction, which by
# default predicts previously unseen branches as not-taken.
#------------------------------------------------------------------------------
#include "memcfg.h"

.equ ARR_SIZE, 0x10
.equ OOB_IDX, 0x20
.equ NON_POWER_OF_2, 6

#
# Attacker: call the victim with out-of-bounds index.
#
.text
attacker:

  # Speculation: call the victim with out-of-bounds index.
  li  a0, OOB_IDX
  call victim

  .align 4
  end:
    # Illegal instruction: end of the test case.
    unimp

#
# Victim function: access arr[a0] if a0 is less than 0x20.
#
.align 4
victim:
  # Calculate address of arr[a0].
  li t0, UDATA
  add t0, t0, a0

  # Slow down branch with mul/div by a non-power-of-two.
  li t1, NON_POWER_OF_2
  mul a0, a0, t1
  div a0, a0, t1
  mul a0, a0, t1
  div a0, a0, t1
  mul a0, a0, t1
  div a0, a0, t1
  mul a0, a0, t1
  div a0, a0, t1

  # Bounds check: skip if `a0` is greater than 0x20.
  li t2, ARR_SIZE
  bge a0, t2, func_end # <-- statically predicted not-taken
    # Branch not taken: dereference the address.
    lw t0, 0(t0)
    addi t0, t0, 0x1
  .align 4
  func_end:
    # Branch taken: just return.
    ret

#include "data.h"

