addi s0, sp, 4
addi s0, sp, 384
auipc s7, 0
slli t1, t1, 17
slli t1, t1, 17
slli t1, t1, 17
addi ra, ra, 12
addi s0, sp, 384
addi ra, ra, 12
addi s0, sp, 384
addi a3, sp, 256

li t0, 0x80001000
ld t0, 0(t0)

mv t1, t1
slli tp, tp, 14
addi s0, sp, 384
addi ra, ra, 12
mv tp, tp
addi s0, sp, 384
addi ra, ra, 12
mv tp, tp
div s0, s0, a4
addi s0, sp, 64
mul a3, a3, a4
addi s0, sp, 64
xori s0, s0,  4
addi s0, sp, 64
xor s0, s1,  a4
