/* PMP configuration */
#define PMP_R                        0x01
#define PMP_W                        0x02
#define PMP_X                        0x04
#define PMP_A                        0x18
#define PMP_A_TOR            0x08
#define PMP_A_NA4            0x10
#define PMP_A_NAPOT          0x18
#define PMP_L                        0x80

#define CSR_PMPCFG0 0x3a0
#define CSR_PMPADDR0 0x3b0
#define CSR_PMPADDR1 0x3b1
#define CSR_PMPADDR2 0x3b2
#define CSR_PMPADDR3 0x3b3
#define CSR_PMPADDR4 0x3b4
#define CSR_PMPADDR5 0x3b5
#define CSR_PMPADDR6 0x3b6
#define CSR_PMPADDR7 0x3b7
#define CSR_PMPADDR8 0x3b8

// original meltdown variant

.text
melt_us:
    nop
    nop

init_trap_vector:
    // all traps will end up in the pc
    // being set to trap_handler
    lla t0, trap_handler
    csrw mtvec, t0

preload_s_mem:
    // Bring S mode memory in the cache
    # lla s0, s_mem
    # addi s0, s0, 8
    # ld s0, 0(s0)

set_pmp:
    # // Supervisor code
    # lla a0, s_mem
    # csrw CSR_PMPADDR0, a0

    # // Supervisor data
    # lla a0, table_1
    # csrw CSR_PMPADDR1, a0

    # // User code
    # lla a0, u_mem
    # csrw CSR_PMPADDR2, a0

    # // User data
    # li a0, -1
    # csrw CSR_PMPADDR3, a0

    # li a0, (PMP_A_TOR | PMP_R | PMP_W | PMP_X) | (PMP_A_TOR | 0) << 8 | (PMP_A_TOR | 0) << 16 | (PMP_A_TOR | 0) << 24
    # csrw CSR_PMPCFG0, a0

set_page_table:
    // set the satp register and page table accordingly
    // page table address is 0x00000080002 (actual address 0x80002000)
    // ASID is 0x0004 (random value)
    // MODE is 0x8 (for Sv39)
    li s0, 0x8000400000080002
    csrw satp, s0

change_to_U:
    // clear Trap Virtual Memory(TVM) bit
    li s1, 0x00100000
    csrc mstatus, s1

    // set MPP such that we return to U mode
    li s1, 0x00000000
    csrc mstatus, s1
    # li s1, 0x00001000
    # csrc mstatus, s1
    # li s1, 0x00000800
    # csrs mstatus, s1
    // load address of U mode code
    lla s2, U_mode_code
    csrw mepc, s2

    // return to U mode code
    mret

trap_handler:
  nop
  nop
  unimp
  unimp

.section .melt_data , "adw"

s_mem:
  .dword 0x00000000deadbeef
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000


// this is a data section (for page table entries)
.section .table1 , "adw"

table_1:
  // entire address as bits, e.g. 0x80001000
  // 000 0000 1000 0000 0000 0000 0001 0000 0000 0000
  // 0x000 page offset
  // 0b0 0000 0001 vpn[0] ( vpn[0] * 8 = 8)
  // 0b0 0000 0000 vpn[1] ( vpn[1] * 8 = 0)
  // 0b0 0000 0010 vpn[2] ( vpn[2] * 8 = 16)

  // Level[1] PTE
  // D=0, A=0, G=0, U=0, X=0, W=0, R=0, V=1: 0x01
  // RSW=0b00
  // 0x00000080003 (ppn)
  // Reserved 0b 00 0000 000
  // 0x0000000020000c01
  .dword 0x0000000020000c01

  // PTE not in use
  .dword 0x0000000000000000

  // Level[2] PTE
  // D=0, A=0, G=0, U=0, X=0, W=0, R=0, V=1: 0x01
  // RSW=0b00
  // 0x00000080002 (ppn)
  // Reserved 0b 00 0000 000
  //.dword 0x0000000020000801
  .dword 0x0000000020000801


// this is a data section (for page table entries)
.section .table2 , "adw"

table_2:

  // supervisor code page
  // Level[0] text-PTE
  // D=0, A=1, G=0, U=0, X=1, W=0, R=1, V=1: 0x4b
  // RSW=0b00
  // 0x00000080000 (ppn)
  // Reserved 0b 00 0000 000
  // 0x000000002000004b
  .dword 0x000000002000004b

  // supervisor data page
  // Level[0] data-PTE
  // NOTE: readable and writable, BUT NOT FROM USER MODE
  // D=0, A=1, G=0, U=0, X=0, W=1, R=1, V=1: 0x47
  // RSW=0b00
  // 0x00000080001 (ppn)
  // Reserved 0b 00 0000 000
  // 0x0000000020000447
  .dword 0x0000000020000447

  // two pages not in use
  .dword 0x0000000000000000
  .dword 0x0000000000000000

  // user code page
  // Level[0] text-PTE
  // D=0, A=1, G=0, U=1, X=1, W=0, R=1, V=1: 0x5b
  // RSW=0b00
  // 0x00000080004 (ppn)
  // Reserved 0b 00 0000 000
  // 0x000000002000105b
  .dword 0x000000002000105b

  // user data page
  // Level[0] data-PTE
  // NOTE: readable and writable from user mode
  // D=0, A=1, G=0, U=1, X=0, W=1, R=1, V=1: 0x57
  // RSW=0b00
  // 0x00000080005 (ppn)
  // Reserved 0b 00 0000 000
  // 0x0000000020001457
  .dword 0x0000000020001457


// this is the code section for user mode code
.section .melt_utext , "ax"

// user mode code
U_mode_code:
    // access to user mode page to show that it works
    lla s0, u_mem
    ld s1, 0(s0)

    // access to supervisor mode page, which will
    // raise a fault
    lla s1, s_mem
    ld s1, 0(s1)
    // add offfset to user base address
    add s1, s0, s1
    // load from that address in order to
    // reveal secret value through side channel
    ld s2, 0(s1)


// this is the data section for user data
.section .melt_udata , "adw"

u_mem:
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
  .dword 0x0000000000000000
