li a7, 0x80009000
ld a5, 0(a7)

lwu t5, 32(t1)
lwu t5, 32(t1)
lwu t5, 32(t1)
lwu t5, 32(t1)
lwu s0, 0(t1)
bleu t5, tp, asd
lbu t5, 32(a6)
slt s0, a3, sp
lb a6, 32(tp)
nop
addi t5, t5, 2
lb sp, 16(s0)
jalr t5, zero, 12
srai a6, s0, 59
nop
asd:
ld      zero,8(a7)
unimp


.data
data:
.dword 0xcacacafedeadbeef
.dword 0xcacacafedeadbeef
.dword 0xcacacafedeadbeef
.dword 0xcacacafedeadbeef
.dword 0xcacacafedeadbeef
.dword 0xcacacafedeadbeef
.dword 0xcacacafedeadbeef
