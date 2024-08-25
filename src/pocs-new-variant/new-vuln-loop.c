// TODO: This doesn't produce the right code (yet). See the assembly PoCs.

#include <stdint.h>

volatile uint64_t* secret_addr;

volatile uint64_t* ptr_chase_end;
volatile uint64_t* ptr_chase_start;

volatile uint64_t dummy;

uint64_t secret;
uint64_t legit;
uint64_t uncontrolled;


void init_victim_data() {
    secret = 0xdeadbeef;
    legit = 0xffffffff;
    uncontrolled = 1;


}

void victim(int n_inters) {
    int i = 0;
    do {
        fence();
        i++;
        // This branch is NOT controlled by the attacker.
        if (**ptr_chase_start == 0) {
            tmp = *secret_addr;
        }
    } while(i < n_inters);
}

int main () {
    // Wait for BIM initialization.
    for (int i = 0; i < 2048; i++)
        ;

    // Simulate victim storing some secret.
    init_victim_data();

    // Train the victim to set the BIM to a controlled state.
    secret_addr = &legit;
    victim(/*n_iters=*/0);
    fence();

    secret_addr = &secret;
    for (int i = 0; i < 12; i++)
        victim(/*n_iters=*/2);
}
