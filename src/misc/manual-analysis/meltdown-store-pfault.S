auipc s5, 402894 # 0x67fcd000
nop
ori s8, sp, 0
nop
addi tp, t0, -1621
auipc sp, 0 # 0x80008014
addi ra, a6, 8
sd zero, 32(zero)
beq zero, sp, asd
srl sp, zero, s8
nop
srl sp, zero, s8
nop
nop
mv zero, s1
nop
nop
lb zero, 0(a6)
nop
addi zero, zero, -1830
add tp, t5, t0
nop
lbu s6, 2029(tp)
nop
ret

.rep 1200
unimp
.endr

asd:
unimp
