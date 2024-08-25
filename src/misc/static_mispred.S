.text
start:
# Load random data.
li t0, 0x80000100
ld t0, 0(t0)

# Slow down.
li t1, 6
mul t0, t0, t1
div t0, t0, t1
mul t0, t0, t1
div t0, t0, t1

# Branch is architecturally taken, but statically predicted non-taken.
beqz t0, end
    # New data is loaded speculatively.
    li t0, 0x80001000
    ld t0, 0(t0)
.align 4
end:
j start

#padding
.rep 64
.dword 0x0
.endr

.align 8
end_dummy:
