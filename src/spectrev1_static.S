#------------------------------------------------------------------------------
# Spectrev1 with static prediction.
#
# Victim reads memory out-of-bounds abusing static branch prediction, which by
# default predicts previously unseen branches as not-taken.
#------------------------------------------------------------------------------
.equ ARR_SIZE, 0x20
.equ OOB_IDX, 0x100
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
#ifdef NO_DATA
  li t0, 0x80006000
#else
  lla t0, arr
#endif
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

#ifndef NO_DATA
.data
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
