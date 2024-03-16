.text
text:
#ifdef NO_DATA
  li s0, 0x80009000
#else
  li s0, 0x80009000

  # lla s0, data
#endif

    li t1, 1
    li t0, 2
    li t2, 0
    li t3, 8

    # .rep 2400
    # nop
    # .endr

.align 4
main:
    # Call func1 in a loop
    addi  t2, t2, 1
    .align 4
    call func1
    nop
    nop
j main

# Padding.
.rep 20
nop
.endr

.align 4
func1:

    # Slow down branch.
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    # Mispredicted branch.
    beqz t0, speculative
    # Trained branch: not taken for t3 times, then taken.
    bge  t2, t3, skip
        nop
        nop
        nop
        nop

    .align 4
    skip:
        nop
        nop
        nop
        nop
    ret

.align 4
end:
unimp

# Padding.
.rep 60
nop
.endr


# ----------- Speculative load.
speculative:
ld t0, 0(s0)
ret

# ------------- Data loaded speculatively.
#ifndef NO_DATA
.data
data:
.dword 0xcacacafedeadbee0
.dword 0xcacacafedeadbee1
.dword 0xcacacafedeadbee2
.dword 0xcacacafedeadbee3
.dword 0xcacacafedeadbee4
#else
  #padding
  .rep 64
  .dword 0x0
  .endr
#endif
