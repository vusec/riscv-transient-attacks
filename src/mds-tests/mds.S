# Requires MDS initialization (see phantom-trails/BOOM/boom-wrapper/init).

#define INVALID     0xA000110

init:
    li t3, INVALID # invalid address (used by attacker)

attacker:
    # This load will fail
    lw  t5, 0(t3)       # Load 0xA0001000
    addi t3, t3, 0x20
    lw  t5, 0(t3)       # Load 0xA0001010 <----- Speculatively gets stored data
    addi t3, t3, 0x20
    lw  t5, 0(t3)       # Load 0xA0000120
    addi t3, t3, 0x20
    lw  t5, 0(t3)       # Load 0xA0000130
    addi t3, t3, 0x20
    lw  t5, 0(t3)       # Load 0xA0000140

    # End simulation.
    unimp
