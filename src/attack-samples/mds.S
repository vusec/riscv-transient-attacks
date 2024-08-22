#include "memcfg.h"

#define N_STORES 7
#define N_MUL    0
#define N_LOADS  4

init:
    li t0, 0xdeadbeef # secret 1
    li t6, 0xcacacafe # secret 2
    li t1, 0x80009100 # victim address 1
    li t2, 0x80009110 # victim address 2
    li t3, 0xA0000100 # invalid address (used by attacker)
    li t4, 0x4
    fence

victim:
    sw t0, 0(t1)        # store 0xdeadbeef to address 0x80009100
    sw t6, 0(t2)        # store 0xcacacafe to address 0x80009110
    mul t6, t6, t6      # Padding
    mul t6, t6, t6
    mul t6, t6, t6
    mul t6, t6, t6
    mul t6, t6, t6


attacker:
    # This load will fail
    lw  t5, 0(t3)       # Load 0xA0000100  <----- Speculatively gets 0xdeadbeef
    addi t3, t3, 0x10
    lw  t5, 0(t3)       # Load 0xA0000110  <----- Speculatively gets 0xcacacafe
    addi t3, t3, 0x10
    lw  t5, 0(t3)       # Load 0xA0000120
    addi t3, t3, 0x10
    lw  t5, 0(t3)       # Load 0xA0000130
    addi t3, t3, 0x10
    lw  t5, 0(t3)       # Load 0xA0000140

    # End simulation.
    unimp
