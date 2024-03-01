init:
#ifdef NO_DATA
  li s0, 0x80006000
#else
  lla s0, thedata
#endif

    li t1, 1
    li t0, 2

    li t2, 0
    li t3, 40

    # .rep 1400
    # nop
    # .endr

.align 4
main:
    auipc ra, 0

    # Slow down branch.
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    # Mispredicted branch.
    beqz t0, speculative
ret
# j main

# Padding.
.rep 60
nop
.endr


# ----------- Speculative load.
speculative:
ld t0, 0(s0)

# ------------- Data loaded speculatively.
#ifndef NO_DATA
.data
thedata:
.dword 0xcacacafedeadbeef
#else
  #padding
  .rep 64
  .dword 0x0
  .endr
#endif
