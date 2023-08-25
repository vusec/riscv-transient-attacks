.text
auipc a0, 0
ld t0, 0(a0)
unimp

#padding
.rep 64
.dword 0x0
.endr

.align 4
end:
