#------------------------------------------------------------------------------
# Spectrev2.
#
# The victim takes an index as an argument, and jumps to the corresponding entry
# in a jump table. The attacker first trains the victim by making it jump to
# a leak gadget. Then, it will ask the victim to jump to `legit_target`.
# As a result, the victim speculatively jumps to `leak_gadget` instead.
#------------------------------------------------------------------------------

.equ TRAINING_ROUNDS, 1
.equ LEGIT_FUNC_IDX, 0x0
.equ LEAK_FUNC_IDX, 0x10
.equ OOB_IDX, 0x100

.text
setup:
    # Setup the jump table.
#ifdef NO_DATA
    li s0, 0x80006000
    li s1, 0x80006040
#else
    lla s0, jump_table
    lla s1, arr
#endif

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


#ifndef NO_DATA
.data
jump_table:
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000

arr:
  # cache line 0 and 1 (read architecturally)
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe
  .dword 0x00000000cacacafe

  # cache line 2 and 3 (padding)
  .dword 0xfffffffffffffff0
  .dword 0xfffffffffffffff1
  .dword 0xfffffffffffffff2
  .dword 0xfffffffffffffff3
  .dword 0xfffffffffffffff4
  .dword 0xfffffffffffffff5
  .dword 0xfffffffffffffff6
  .dword 0xfffffffffffffff7
  .dword 0xfffffffffffffff8
  .dword 0xfffffffffffffff9
  .dword 0xfffffffffffffffa
  .dword 0xfffffffffffffffb
  .dword 0xfffffffffffffffc
  .dword 0xfffffffffffffffd
  .dword 0xfffffffffffffffe
  .dword 0xffffffffffffffff

  # cache line 4 and 5 (read speculatively)
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

