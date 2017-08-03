#include <asm/macros.h>

.section .text

FUNC(enable_irq)
    mrs r1, cpsr
    bic r1, r1, #0x80
    msr cpsr_c, r1

FUNC(disable_irq)
    mrs r1, cpsr
    orr r1, r1, #0x80
    msr cpsr_c, r1

FUNC(enable_fiq)
    mrs r1, cpsr
    bic r1, r1, #0x40
    msr cpsr_c, r1

FUNC(disable_fiq)
    mrs r1, cpsr
    orr r1, r1, #0x40
    msr cpsr_c, r1

FUNC(enable_interrupts)
    mrs r1, cpsr
    bic r1, r1, #0xc0
    msr cpsr_c, r1

FUNC(disable_interrupts)
    mrs r1, cpsr
    orr r1, r1, #0xc0
    msr cpsr_c, r1

