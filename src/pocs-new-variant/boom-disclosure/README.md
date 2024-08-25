# LoopPredictor Spectre variant

This folder contains a minimum reproducer (`poc.S`) for the LoopPredictor Spectre
variant found by our fuzzer. We also provide the compiled `.elf` and its
objdump (`.asm`).

You can find a detailed explanation of the PoC in the source code comments.
Basically, due to the behavior of the LoopPredictor, BOOM will
speculate to a gadget that loads the secret `0xcacacafedeadbeef` in the register
file even if that gadget is never executed architecturally.

Unlike Spectre-v1, this means that an attacker is able to force misprediction
of an _uncontrolled branch_ without needing to train it, given that they
control a backward branch right after it.

## Walkthough

We modified chipyard's `emulator.cc` to print the state of the RoB and
the content of the Physical Register File on each cycle. We also print
the content of the BIM and the LoopPredictor signals whenever they change.

The results are shown in `poc.log`. We ran the MediumBoomConfig simulator
with "fast load" (`+loadmem` argument) for 2610 cycles. The log shows
the following behavior:

1. The first ~2400 cycles are initialization, in particular
    * Wait for the BIM to be fully initialized
    * Run the victim code a couple of times on non-malicious inputs
2. On cycle 2263 an entry is inserted in column 0, index 0 of the LoopPredictor with tag `0x7`.
3. On cycle 2424 the return at address `0x80000384` starts mispredicting, the LoopPredictor
   starts increasing the entry's confidence (reported as `conf` in the `LOOP DIFF`)
4. On cycle 2591 the LoopPredictor confidence reaches `0x7`
5. On the next iteration at cycle 2604 we see for the first time the LD at
   address `0x80000488` (secret load) entering the RoB
6. Finally on cycle 2609 we see load's `busy` bit set to 0 and the secret
   (with the appropriate endianness, so `0xefbeaddefecacaca`) in entry 0x17 of the Register File.


## Exploitability

While this PoC shows a synthetic example (`auipc ra` + `ret`) that
guarantees consecutive mispredictions, the same result can be achieved
by attacking a recursive function with controlled recursion depth
(see `poc-with-recursive-ret.S`) and a `do ... while()` loop with a controlled
exit condition (see `poc-with-loop.S`).
