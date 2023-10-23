.text
auipc a0, 0
ld t0, 0(a0)

addi a0, a0, 5

add a1, a2, a3

unimp

#padding
.rep 64
.dword 0x0
.endr

.align 4
end:
