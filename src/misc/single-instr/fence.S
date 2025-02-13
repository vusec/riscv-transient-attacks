.text
auipc a0, 0
ld t0, 0(a0)
nop
nop
fence
unimp

#padding
.rep 64
.dword 0x0
.endr

.align 8
end:
