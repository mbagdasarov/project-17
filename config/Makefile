# Configuration
## Toolchain
TOOLS       := /home/mk0rvin/dev/osdev/project-toolchain/

TOOLCHAIN   := $(TOOLS)/gcc-linaro-6.3.1-2017.02-x86_64_arm-eabi
GCC         := $(TOOLCHAIN)/bin/arm-eabi-gcc
GDB         := $(TOOLCHAIN)/bin/arm-eabi-gdb
LD          := $(TOOLCHAIN)/bin/arm-eabi-ld
AS          := $(TOOLCHAIN)/bin/arm-eabi-as
OBJCOPY     := $(TOOLCHAIN)/bin/arm-eabi-objcopy

#QEMU        := $(TOOLS)/bin/qemu-system-arm
QEMU         := qemu-system-arm
## Kernel
KERNEL_ROOT := $(CURDIR)
BUILD_DIR   := $(KERNEL_ROOT)/build

## Set target here
BOARD       := vexpress-qemu

include $(get_makefile_dir)/$(BOARD)/Makefile

# Kernel build options
## Flags

### TODO: -march=armv7-a causes
###       "switch -mcpu=cortex-a15 conflicts with -march=armv7-a switch"
###       when compiling. Investigate the reason.

CFLAGS      := -O0                                                           \
               -ggdb                                                         \
               -mcpu=$(CPU)                                                  \
               -ffreestanding                                                \
               -nostdlib                                                     \
               -nostartfiles                                                 \
               -Wall                                                         \
               -Wextra                                                       \
               -Werror                                                       \
               $(EXTRA_CFLAGS)
ASFLAGS     := -mcpu=$(CPU)
QEMU_FLAGS  := -nographic                                                    \
               -machine $(QEMU_MACH)                                         \
               -cpu $(CPU)


