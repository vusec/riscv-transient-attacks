lb      ra,0(a6)
srli    zero,zero,0x8
srli    zero,s0,0x8
srli    zero,zero,0x8
sd      ra,-304(ra)
xor     s11,tp,s0
lhu     sp,172(tp) # 0xac
subw    a2,a7,s0
jr      172(ra)
