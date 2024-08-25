#include "../vulns/memcfg.h"

.rep 128
fence
.endr

.text
text:
    lla s0, data

    li t1, 1
    li t0, 2

    # .rep 1400
    # nop
    # .endr

.align 4
main:
    auipc ra, 0

    # Slow down branch.
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    mul t0, t0, t1
    # Mispredicted branch.
    beqz t0, speculative
# ret
j main

# Padding.
.rep 60
nop
.endr


# ----------- Speculative load.
speculative:
ld t0, 0(s0)

# Padding.
.rep 128
nop
.endr

// this is the data section for user data
.section .data , "adw"
data:
  .dword 0xcacacafedeadbeef
  .dword 0xcacacafedeadbeef
  .dword 0xcacacafedeadbeef
  .dword 0xcacacafedeadbeef
  .dword 0xcacacafedeadbeef
  .dword 0xcacacafedeadbeef
  .dword 0xcacacafedeadbeef
  .dword 0xcacacafedeadbeef

