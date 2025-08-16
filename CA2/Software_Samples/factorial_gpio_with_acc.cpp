#include <stdint.h>
#include <stdio.h>

# define READ_PORT ((volatile uint32_t*)0x0020000C)
# define WRITE_PORT ((volatile uint32_t*)0x00200000)

# define N_FACT_ACC      ((volatile uint32_t*)0x00300000)
# define RESULT_FACT_ACC ((volatile uint32_t*)0x00300001)
# define FACT_ACC_START  ((volatile uint32_t*)0x00300005)
# define FACT_ACC_INT_EN ((volatile uint32_t*)0x00300006)
# define FACT_ACC_DONE   ((volatile uint32_t*)0x00300007)

__attribute__((interrupt ("machine")))
void m_mode_external_interrupt_handler(void) {

	*N_FACT_ACC = *READ_PORT;
	
	volatile uint32_t *result = (volatile uint32_t *)(0x00100000);

    *FACT_ACC_INT_EN = 0x00;
    *FACT_ACC_START = 0x01;

    while(*FACT_ACC_DONE != 0x01){
    }
    

	*result = *RESULT_FACT_ACC;
	*WRITE_PORT = *result;

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

