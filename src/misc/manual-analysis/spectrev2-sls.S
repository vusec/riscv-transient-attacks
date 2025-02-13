#------------------------------------------------------------------------------
# Spectrev2.
#
# The victim takes an index as an argument, and jumps to the corresponding entry
# in a jump table. The attacker first trains the victim by making it jump to
# a leak gadget. Then, it will ask the victim to jump to `legit_target`.
# As a result, the victim speculatively jumps to `leak_gadget` instead.
#------------------------------------------------------------------------------
#include "memcfg.h"

.equ TRAINING_ROUNDS, 1
.equ LEGIT_FUNC_IDX, 0x0
.equ LEAK_FUNC_IDX, 0x10
.equ OOB_IDX, 0x20

.text
setup:
    # Setup the jump table.
    li s0, UDATA
    addi s1, s0, 0x40

    lla t0, legit_target
    sd t0, LEGIT_FUNC_IDX(s0)
    lla t1, leak_target
    sd t1, LEAK_FUNC_IDX(s0)

    fence

attacker:
  # Training: call leak function with in-bounds index.
  # .rept TRAINING_ROUNDS
  # li  a0, LEAK_FUNC_IDX
  # mv a1, s1
  # call victim
  # .endr

  # Attack: call legit function with out-of-bounds index. The victim
  # will speculatively jump to the leak function instead of the legit one.
  li  a0, LEGIT_FUNC_IDX
  mv a1, s1
  addi a1, a1, OOB_IDX
  call victim

  # Illegal instruction: end of the test case.
  unimp


# Victim function: use a0 as an index in a jump table and perform an indirect
# call to the corresponding function.
# Args:
# a0 -> index of teh function to call
# a1 -> address to leak
.align 4
victim:
  # Save ret address.
  mv  s2, ra

  # Calculate jump target.
  add t0, s0, a0
  ld  t1, 0(t0)

  mv t5, s0

  # Slow down jump with mul/div by a non-power-of-two.
  li t2, 6
  mul t1, t1, t2
  div t1, t1, t2
  mul t1, t1, t2
  div t1, t1, t2
  # Indirect jump.
  .align 4
  jalr ra, t1

  # Load from a1 (changed by callee)
  lw t0, 0(t5)

  # Restore ret address.
  mv  ra, s2
  ret

# Legit target: do nothing.
.align 4
legit_target:
  mv t5, s1
  ret

# Leak target: access `a1`.
.align 4
leak_target:
  lw t0, 0(a1)
  ret

