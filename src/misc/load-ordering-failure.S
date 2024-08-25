li x1,  0x80009000
li x2,  0x80009000
li x3,  0x80009000
li x4,  0x80009000
li x5,  0x80009000
li x6,  0x80009000
li x7,  0x80009000
li x8,  0x80009000
li x9,  0x80009000
li x10, 0x80009000
li x11, 0x80009000
li x12, 0x80009000
li x13, 0x80009000
li x14, 0x80009000
li x15, 0x80009000
li x16, 0x80009000
li x17, 0x80009000
li x18, 0x80009000
li x19, 0x80009000
li x20, 0x80009000
li x21, 0x80009000
li x22, 0x80009000
li x23, 0x80009000
li x24, 0x80009000
li x25, 0x80009000
li x26, 0x80009000
li x27, 0x80009000
li x28, 0x80009000
li x29, 0x80009000
li x30, 0x80009000
li x31, 0x80009000

li s8, 0
li t3, 0xA0009000
sd t3, 1024(s0)
fence

lhu t5, 212(t5)
lbu t5, 212(s10)
sllw s11, t5, s8
auipc sp, 21478 # 0x800c
sb sp, 1024(s0)
add s0, s1, t0
lw t5, 1024(a6)
lw t5, 1024(t0) # <---- memory ordering fault
lw t5, 1024(t0)
sllw t2, t5, s8
lh a6, 1024(t2) # <---- taint
sllw s11, t5, s7
addi a4, s11, -2032
sw zero, 0(a4)
sb t5, 41(t0)
sw t5, 1168(s11)
slliw a0, sp, 16
addi a4, s11, -2032
sw zero, 0(a4)

unimp
