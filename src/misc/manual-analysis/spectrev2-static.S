.text
setup:
  lla s1, jmp_target

taint_load:
  ld t0, 0(s2)
  addi s2, s2, 0x100

attack:
  # mv s0, s2

  # Slow down jump with mul/div by a non-power-of-two.
  mv t1, s1
  li t2, 6
  mul t1, t1, t2
  div t1, t1, t2
  mul t1, t1, t2
  div t1, t1, t2
  mul t1, t1, t2
  div t1, t1, t2
  mul t1, t1, t2
  div t1, t1, t2
  mul t1, t1, t2
  div t1, t1, t2
  mul t1, t1, t2
  div t1, t1, t2
  mul t1, t1, t2
  div t1, t1, t2
  mv ra, t1
  # Indirect jump.
  .align 4
  # ret
  jalr ra, t1
  unimp

.align 8
jmp_target:
  ld t0, 0x80(s0)
  # unimp
  ret
