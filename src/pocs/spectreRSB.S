#------------------------------------------------------------------------------
# SpectreRSB minimal example.
#
# A function modifies its return address, causing the CPU to mispredict on ret.
#------------------------------------------------------------------------------

#include "memcfg.h"

.text
context_1:
  li s0, UDATA
  addi s1, s0, 0x80
  li a0, 8
  nop

  # Call the victim.
  call context_switch

spec_code:
  # Speculative: load array[a0]. a0 contains the secret loaded by the victim.
  add t0, s1, a0
  ld t0, 0(t0)
  ret

.align 4
context_switch:
  # Load secret.
  lb a0, 0(s0)
  andi a0, a0, 0xff
  # Return to context_2.
  lla ra, context_2
  # Slow down ret.
  li t0, 6
  mul ra, ra, t0
  div ra, ra, t0
  mul ra, ra, t0
  div ra, ra, t0
  ret # <-- mispredicted (spec target: context_1, actual target: context_2).

.align 8
context_2:
  # Modify secret.
  addi a0, a0, 1
  sb a0, 0(s0)
  # Illegal Instruction: end test case.
  unimp

