#define SP           0x80009900

#define N_MISPRED 16
#define N_SATURATION 30

init:
    # Wait for BIM initialization.
    .rep 128
    fence
    .endr

    # Init stack pointer.
    li sp, SP

    # Load the secret in the D-Cache.
    lla s0, legit_data
    ld t0, 0(s0)

    # Set the predictor to a known state.
    lla s0, legit_data
    li a0, 0 # cur_idx
    li a1, 0 # recursion depth for func1
    li a2, 0 # recursion depth for func2
    call func1
    fence

.align 4
main:
    # Start recursive call chain to saturate RAS.
    lla s0, secret_data
    li a0, 0 # cur_idx
    li a1, N_MISPRED # recursion depth for func1
    li a2, N_SATURATION+N_MISPRED  # recursion depth for func2
    call func1

    # End test case.
    unimp

# Padding.
.rep 32
unimp
.endr

.align 4
func1:
    # Perform N_MISPRED recursive calls to itself, whose returns will be mispredicted.
    addi  a0, a0, 1
    bge   a0, a1, call_func2
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
    # Perform N_SATURATION recursive calls to anothe function to saturate the RAS
    # and poison it with another value.
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
    li t1, 1
    li t0, 2
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    # Mispredicted branch.
    beqz t0, speculative_gadget
ret

# Padding.
.rep 32
unimp
.endr

.align 4
func2:
    # Perform N_SATURATION recursive calls to saturate the RAS.
    addi  a0, a0, 1
    bge   a0, a2, ret_to_func1
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

# Padding.
.rep 32
unimp
.endr


# ----------- Speculative load.
speculative_gadget:
ld t0, 0(s0)
ret

# Padding.
.rep 128
unimp
.endr


# ------------- Data.
# .data
secret_data:
.dword 0xcacacafedeadbeef

# padding:
.dword 0

legit_data:
.dword 0xcacacafedeadbeef
