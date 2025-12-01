#include <cstdint>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <sanitizer/dfsan_interface.h>

volatile uint64_t s2_req_0_addr = 0x80009000;
volatile uint64_t amoalu_io_lhs = 0x00000000deadbeef;

volatile uint32_t cache_resp_0_bits_data_shifted = 0;


int main() {
    dfsan_set_label(1, (uint8_t*)&amoalu_io_lhs+4, 1);
    dfsan_set_label(1, (uint8_t*)&amoalu_io_lhs+5, 1);
    dfsan_set_label(1, (uint8_t*)&amoalu_io_lhs+6, 1);
    dfsan_set_label(1, (uint8_t*)&amoalu_io_lhs+7, 1);
    for (size_t i = 0; i < sizeof(amoalu_io_lhs); i++) {
        uint8_t label = dfsan_read_label((uint8_t*)&amoalu_io_lhs + i, 1);
        printf("beginning byte %zu label: %u\n", i, label);
    }

    cache_resp_0_bits_data_shifted = ((1U & (uint32_t)((s2_req_0_addr >> 2U))) ? (uint32_t)((amoalu_io_lhs)) : (uint32_t)(amoalu_io_lhs));
    printf("cache_resp_0_bits_data_shifted = %x\n", cache_resp_0_bits_data_shifted);
    for (size_t i = 0; i < 8; i++) {
        uint8_t label = dfsan_read_label((uint8_t*)&cache_resp_0_bits_data_shifted + i, 1);
        printf("result byte %zu label: %u\n", i, label);
    }
    return 0;

}
