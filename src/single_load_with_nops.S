.text
li t0, 0x80001000
ld t0, 0(t0)

#flush the pipeline
.rep 16
nop
.endr

#padding
.rep 64
.dword 0x0
.endr

.align 8
end:
