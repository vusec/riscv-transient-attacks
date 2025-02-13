#include "memcfg.h"

#define N_STORES 7
#define N_MUL    0
#define N_LOADS  4

.text
init:
    li t0, 0xdeadbeef # secret
    li t1, 0x80009100 # victim address
    li t2, 0xA0009100 # invalid address
    li t4, 0x3
    fence

victim:
    # Store secret.
    .rep N_STORES
    sw t0, 0(t1)
    # addi t1, t1, 0x10
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


#include "data.h"
