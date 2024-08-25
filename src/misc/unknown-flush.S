lb tp, 64(ra)
auipc sp, 0 # 0x80008004
jalr ra, sp, 108
xor ra, ra, ra
xor ra, ra, ra
addiw t0, s0, 1
sll a6, s0, ra
slli ra, sp, 63
snez s0, s0
lhu zero, 285(ra)
xor zero, zero, zero
lhu zero, 285(ra)
auipc s0, 32768 # 0x80010030
subw zero, gp, ra
lhu zero, 285(ra)
lhu zero, 285(ra)
lhu zero, 285(ra)
auipc sp, 0 # 0x80008044
lbu zero, 285(sp)
jalr ra, sp, 248
lhu zero, 285(ra)
lhu zero, 285(ra)
lhu zero, 285(ra)
lhu zero, 285(ra)
auipc sp, 0 # 0x80008060
bgt s7, tp, asd
xor t4, zero, tp
lhu zero, 285(ra)
and a6, ra, ra
lbu ra, 64(s2)
slliw zero, sp, 8
slliw zero, sp, 8
slliw zero, sp, 8
slliw zero, sp, 8
slliw zero, sp, 8
slliw zero, sp, 8
slliw zero, sp, 8
ret

.rep 200
unimp
.endr

asd:
unimp
