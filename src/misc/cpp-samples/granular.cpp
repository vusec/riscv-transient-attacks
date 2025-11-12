#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <sanitizer/dfsan_interface.h>


volatile uint64_t result;
volatile uint64_t byte_taint;
volatile uint64_t mask;

int main() {
    byte_taint = 0xffffffffdeadbeef;
    mask = 0xffffffffffffffffULL;
    dfsan_set_label(1, ((uint8_t*)&byte_taint), 1);
    dfsan_set_label(2, ((uint8_t*)&byte_taint)+1, 1);
    for (size_t i = 0; i < 8; i++) {
        uint8_t label = dfsan_read_label(((uint8_t*)&byte_taint)+i, 1);
        printf("byte %zu label: %u\n", i, label);
    }

    result = mask & byte_taint;
    for (size_t i = 0; i < 8; i++) {
        uint8_t label = dfsan_read_label(((uint8_t*)&result)+i, 1);
        printf("result byte %zu label: %u\n", i, label);
    }
    printf("result: 0x%lx\n", result);
    
    return 0;
}