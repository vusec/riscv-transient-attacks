#include "memcfg.h"

.text
text:
    li s0, UDATA
    ld a7, 80(s0)

    li t1, 1
    li t0, 2

    li t2, 0
    li t3, 12
    li t5, 20

    # .rep 1400
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
    bge t2, t5, asd
j main

asd:
  li t2, 0
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
    # mul t0, t0, t1
    # mul t0, t0, t1
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
#include "data.h"
