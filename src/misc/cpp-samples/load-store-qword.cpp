#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <sanitizer/dfsan_interface.h>

volatile uint8_t amoalu__DOT____VdfgTmp_h6f312ce4__0;
volatile uint64_t new_data;
volatile uint64_t s2_req_0_uop_mem_cmd;
volatile uint64_t amoalu__DOT__wmask;
volatile uint64_t amoalu_io_out;
volatile uint64_t old_data;
volatile uint8_t amoalu__DOT__logic_and;
volatile uint8_t amoalu__DOT__logic_xor;
volatile uint8_t __VdfgTmp_h89eb4295__0;
volatile uint8_t amoalu__DOT___less_T_12;

void VTestHarness___024root___nba_sequent__TOP__5377() {    
   amoalu_io_out = (amoalu__DOT__wmask & new_data) | ((~ amoalu__DOT__wmask & old_data));
}

int main() {
    amoalu__DOT____VdfgTmp_h6f312ce4__0 = 0x1;
    new_data = 0xdeadbeefULL;
    old_data = 0x0ULL;
    s2_req_0_uop_mem_cmd = 0x1;
    // amoalu__DOT__wmask = 0xffffffffULL;
    amoalu__DOT__wmask = 0xffffffffffffffffULL;
    amoalu_io_out = 0ULL;
    amoalu__DOT__logic_and = 0;
    amoalu__DOT__logic_xor = 0;
    __VdfgTmp_h89eb4295__0 = 0xf;
    amoalu__DOT___less_T_12 = 0x1;

    dfsan_set_label(1, (uint8_t*)&old_data, sizeof(old_data));


    VTestHarness___024root___nba_sequent__TOP__5377();
    printf("amoalu_io_out = %lx\n", amoalu_io_out);
    // printf("io out label: %u\n", dfsan_read_label((uint8_t*)&amoalu_io_out, sizeof(amoalu_io_out)));
    for (size_t i = 0; i < sizeof(amoalu_io_out); i++) {
        uint8_t label = dfsan_read_label((uint8_t*)&amoalu_io_out + i, 1);
        printf("byte %zu label: %u\n", i, label);
    }
    return 0;
}