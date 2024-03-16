#------------------------------------------------------------------------------
# SpectreV4 minimal example.
#------------------------------------------------------------------------------
#include "memcfg.h"

.text
setup:
  li s0, UDATA
  li s1, UDATA

attack:
  # Mul s0 by 1.
  li t1, 1
  mul s0, s0, t1
  mul s0, s0, t1
  mul s0, s0, t1
  mul s0, s0, t1
  mul s0, s0, t1
  mul s0, s0, t1
  # Store new value in [s0].
  sd t1, 0(s0)

  # Load from s1, reodered before the store.
  ld t0, 0(s1)

  # Illegal instruction: end of test case.
  unimp

# #include "data.h"
