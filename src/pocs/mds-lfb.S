#include "memcfg.h"

#define N_VICTIM_LOADS 7
#define N_MUL    0
#define N_LOADS  4

.text
init:
    li t0, 0xdeadbeef # secret
    li t1, UDATA      # victim address
    li t2, 0xA0009000 # invalid address
    li t4, 0x3

    sw  t0, 0(t1)
    fence

victim:
    # Victim loads.
    .rep N_VICTIM_LOADS
    lw t6, 0(t1)
    addi t1, t1, 0x100
    .endr

attacker:
    # Slow down address resolution.
    .rep N_MUL
    mul t2, t2, t4
    div t2, t2, t4
    .endr

    .rep N_LOADS
    # lw  t5, 0(t1)
    # Load invalid address -> in-flight value should be forwarded.
    lw  t5, 0(t2)
    .endr
    unimp


# #include "data.h"

