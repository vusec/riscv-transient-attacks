#------------------------------------------------------------------------------
# Spectrev1 with training.
#
# The victim performs an attacker-dependent load if an attacker-controlled
# branch is _taken_.
# Since static prediction is "not-taken", the attacker needs to train the
# predictor before performing the attack.
#------------------------------------------------------------------------------
#include "memcfg.h"

.equ N_TRAINING_ROUNDS,  6
.equ NON_POWER_OF_2, 6
.equ ARR_SIZE, 0x10
.equ OOB_IDX, 0x20

#
# Attacker: call the victim function several times with `a0` in-bounds, and
# one time with `a0` out of bounds. As a result, on the last call, the victim
# speculatively loads memory out of bounds (containing 0xdeadbeef).
#
.text
attacker:
  li  a0, 0

  # Training: call the victim with a0 = 0.
  .rept N_TRAINING_ROUNDS
  .align 4
  call victim
  .endr

  # Speculation: call the victim with out-of-bounds index.
  li  a0, OOB_IDX
  .align 4
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

  # Bounds check: jump if `a0` is less than 0x20.
  li t2, ARR_SIZE
  ble a0, t2, spec
    # Branch not taken: return.
    ret
  .align 4
  spec:
    # Branch taken: dereference the address.
    lw t0, 0(t0)
    addi t0, t0, 0x1
    ret

#include "data.h"
