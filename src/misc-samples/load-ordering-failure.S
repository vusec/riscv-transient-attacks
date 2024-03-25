lhu tp, 212(tp)
lbu tp, 212(s10)
sllw s11, tp, s8
auipc sp, 21478 # 0x800c
sb sp, 1024(s0)
add s0, s1, t0
lw tp, 1024(a6)
lw tp, 1024(t0) # <---- memory ordering fault
lw tp, 1024(t0)
sllw t2, tp, s8
lh a6, 1024(t2) # <---- taint
sllw s11, tp, s7
addi a4, s11, -2032
sw zero, 0(a4)
sb tp, 41(t0)
sw tp, 1168(s11)
slliw a0, sp, 16
addi a4, s11, -2032
sw zero, 0(a4)
