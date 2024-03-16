#include "memcfg.h"

.text
text:
    li s0, UDATA

    li t1, 1
    li t0, 2

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
#include "data.h"
