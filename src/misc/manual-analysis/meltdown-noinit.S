    // access to user mode page to show that it works
    li s2, 0x80000000
    li t0, 0x1000
    add s0, s2, t0
    add s0, s0, t0
    add s0, s0, t0
    add s0, s0, t0
    add s0, s0, t0
    ld s1, 0(s0)

    // access to supervisor mode page, which will
    // raise a fault
    add s1, s2, t0
    ld s1, 0(s1)
    // add offfset to user base address
    # add s1, t0, s1
    # // load from that address in order to
    # // reveal secret value through side channel
    # ld s2, 0(s1)
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
