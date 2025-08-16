#include <stdint.h>
#include <stdio.h>

# define READ_PORT ((volatile uint32_t*)0x10000000)
# define WRITE_PORT ((volatile uint32_t*)0x10000004)

__attribute__((interrupt ("machine")))
void m_mode_external_interrupt_handler(void) {
	uint32_t input_value = *READ_PORT;
	uint32_t n = input_value;
	
	volatile uint32_t *result = (volatile uint32_t *)(0x00100004);
    uint32_t factorial = 1;
        for (uint32_t i = 1; i <= n; ++i) {
            factorial *= i;
        }
	*result = factorial;
	*WRITE_PORT = factorial;
}

int main() {
    // Enable machine timer/software/external interrupt in the mie register
    asm volatile("csrs mstatus, %0" : : "r"(0x8)); // Set the MIE (Machine Interrupt Enable) bit in mstatus
    asm volatile("csrs mie, %0" : : "r"(0x800)); // Enable external interrupts in mie (Machine Interrupt Enable)
	
    
    uintptr_t mtvec_value = (uintptr_t)&m_mode_external_interrupt_handler;
    asm volatile("csrw mtvec, %0" : : "r"(mtvec_value));
   
    
    while (1) {
	}
        
    return 0;
}

