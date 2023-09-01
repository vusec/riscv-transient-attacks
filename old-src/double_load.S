.text
li s0, 0x80001000
ld t0, 0(s0)
addi s0, s0, 0x100
add t0, t0, s0
ld t0, 0(t0)
unimp

#padding
.rep 64
.dword 0x0
.endr

.align 4
end:
