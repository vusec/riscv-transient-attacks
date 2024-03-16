addi s0, sp, 4
addi s0, sp, 384
slli t1, t1, 17
slli t1, t1, 17
slli t1, t1, 17
slli t1, t1, 17
addi ra, ra, 12
addi s0, sp, 384
addi ra, ra, 12
addi s0, sp, 384
addi a3, sp, 256

li s0, 6
mul t1, t1, s10
div t1, t1, s10
mul t1, t1, s10
div t1, t1, s10

li s1, 1337
blt t1, s0, lol
    mv t1, t1
    slli tp, tp, 14
    addi s0, sp, 384
    addi ra, ra, 12
    mv tp, tp
    slli tp, tp, 14
    addi s0, sp, 384
    addi ra, ra, 12
    mv tp, tp
    slli t1, t1, 17
    slli t1, t1, 17
    addi ra, ra, 12
    addi s0, sp, 384

.align 4
lol:
    addi s0, sp, 384
    addi ra, ra, 12
    mv tp, tp
    div s0, s0, a4
    addi s0, sp, 64
    mul a3, a3, a4
    addi s0, sp, 64
    xori s0, s0,  4
    andi s0, sp, 64
    addi s0, sp, 64
    xor s0, s1,  a4
