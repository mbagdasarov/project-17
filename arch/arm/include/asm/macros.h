#ifndef _ASM_MACROS_H_
#define _ASM_MACROS_H_

#define FUNC(name)                                                           \
    .type name STT_FUNC;                                                     \
    .global name;                                                            \
    name:

#endif

