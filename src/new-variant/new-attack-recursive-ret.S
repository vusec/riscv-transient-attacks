init:
    lla s0, thedata

    li t1, 1
    li t0, 2

    li t2, 0
    li t3, 8
    li t4, 40

    .rep 2400
    nop
    .endr

.align 4
main:
    # Init stack pointer.
    li sp, 0x80030000
    # Start recursive call chain to saturate RAS.
    call func1

    j end

# Padding.
.rep 20
nop
.endr

.align 4
func1:
    # Perform t3 recursive calls to itself, then a bunch of others to another
    # target.
    addi  t2, t2, 1
    bge   t2, t3, call_func2
        # Push ret address the stack.
        addi sp, sp, 8
        sd ra, 0(sp)
        # Recursive call.
        .align 4
        call func1
        # Pop ret address from the stack
        ld ra, 0(sp)
        addi sp, sp, -8
        j after

    .align 4
    call_func2:
        # Push ret address the stack.
        addi sp, sp, 8
        sd ra, 0(sp)
        # Start other recursive call.
        .align 4
        call func2
        # Pop ret address from the stack
        ld ra, 0(sp)
        addi sp, sp, -8

    after:
    # Slow down branch.
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    # Mispredicted branch.
    beqz t0, speculative
ret

.align 4
func2:
    # Perform t4-t2 recursive calls to itself, then return.
    addi  t2, t2, 1
    bge   t2, t4, ret_to_func1
        # Push ret address the stack.
        addi sp, sp, 8
        sd ra, 0(sp)
        # Recursive call.
        .align 4
        call func2
        # Pop ret address from the stack
        ld ra, 0(sp)
        addi sp, sp, -8

        fence
        ret

    .align 4
    ret_to_func1:
        fence
        ret

.align 4
end:
unimp

# Padding.
.rep 60
nop
.endr


# ----------- Speculative load.
speculative:
ld t0, 0(s0)

# ------------- Data loaded speculatively.
.align 16
thedata:
.dword 0xcacacafedeadbeef

padding:
.dword 0
