init:
    lla s0, thedata

    li t1, 1
    li t0, 2

    li t2, 0
    li t3, 10

    # .rep 2400
    # nop
    # .endr

.align 4
loop:
    addi  t2, t2, 1

    # Slow down branch.
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    # Mispredicted branch.
    beqz t0, speculative
    # Trained branch.
    bge  t2, t3, skip
        nop
        nop
        j loop

    .align 4
    skip:
        nop
        nop
        j loop

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

# ------------- Data loaded speculatively.
.align 16
thedata:
.dword 0xcacacafedeadbeef

