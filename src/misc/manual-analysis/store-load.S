li t0, 0x80009000
li t1, 0xdeadbeef
sd t1, 0(t0)
fence
ld t2, 0(t0)
unimp