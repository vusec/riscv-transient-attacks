#------------------------------------------------------------------------------
# SpectreRSB minimal example.
#
# A function modifies its return address, causing the CPU to mispredict on ret.
#------------------------------------------------------------------------------

.text
context_1:
#ifdef NO_DATA
  li s0, 0x80001000
  li s1, 0x80001080
#else
  lla s0, arr
  lla s1, arr2
#endif
  li a0, 8
  nop

  # HACK: We need to execute the spec code at least once or the detector will
  # wipe it out.
  call spec_code

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


#ifndef NO_DATA
.data
arr:
  # cache line 0 and 1 (read architecturally)
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000

arr2:
  # cache line 2 and 3 (read speculatively)
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef
 .dword 0x00000000deadbeef

#else
  #padding
  .rep 64
  .dword 0x0
  .endr
#endif

