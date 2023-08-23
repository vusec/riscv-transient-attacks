#------------------------------------------------------------------------------
# SpectreV4 minimal example.
#
# If two consecutive stores are aliasing to the same adress, a following load
# can pick the value of the first load instead of the second.
#------------------------------------------------------------------------------

.text
setup:
  lla s0, public
  lla s1, secret
  lla s2, probe

  # Load secret in a register.
  ld t0, 0(s1)
  fence

attack:
  # First store: store the secret.
  sd t0, 0(s0)
  # Slow down the _address_ of the second store.
  li t1, 6
  mv t2, s0
  mul t2, t2, t1
  div t2, t2, t1
  mul t2, t2, t1
  div t2, t2, t1
  # Second store: store constant val instead of the secret at the same address.
  li t1, 8
  sd t1, 0(t2)

  # First load: speculatively gets the secret from the first store.
  ld t0, 0(s0)
  # Use the secret as index.
  andi t0, t0, 0xFF
  add  t0, t0, s2
  # Second load: leaks the secret.
  ld t1, 0(t0)

  # Illegal instruction: end of test case.
  unimp

.data
public:
  # cache line 0 and 1 (stored architecturally)
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000
  .dword 0x000000000000000

secret:
  # cache line 2 and 3 (loaded architecturally)
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0
  .dword 0x0000000cafec0c0

probe:
  # cache line 4 and 5
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  # cache line 6 and 7
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
  .dword 0x0000000deadbeef
