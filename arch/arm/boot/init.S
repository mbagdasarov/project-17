.section .bss
.align 16
stack_bottom:
.skip 32768
stack_top:

.section .boot, "x"

.global _ivt
_ivt:
    b _reset              /* Reset          */
    b .                   /* Undefined      */
    b .                   /* Prefetch Abort */
    b .                   /* Data Abort     */
    nop                   /* Reserved       */
    b .                   /* IRQ            */
    b .                   /* FIQ            */

_reset:
    ldr sp, =stack_top

    /* Disable MMU */
    mrc p15, 0, r1, c1, c0, 0
    bic r1, r1, #0x1
    mcr p15, 0, r1, c1, c0, 0

    /* Disable L1 caches */
    mrc p15, 0, r1, c1, c0, 0
    bic r1, r1, #(0x1 << 12)
    bic r1, r1, #(0x1 << 2)
    mcr p15, 0, r1, c1, c0, 0

    bl main
    b .
