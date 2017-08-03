MODULES=kernel

# Main target
all: os

# Includes
# Make it recursive
include scripts/extra.mk
include config/Makefile
include kernel/Makefile
include arch/Makefile

.PHONY: os
os: $(BUILD_DIR)/kernel.elf
	$(OBJCOPY) --only-keep-debug $(BUILD_DIR)/kernel.elf                     \
                                 $(BUILD_DIR)/kernel.syms
	$(OBJCOPY) --strip-debug $(BUILD_DIR)/kernel.syms

$(BUILD_DIR)/kernel.elf: $(MODULES) scripts/script.ld
	$(GCC) -T scripts/script.ld $(CFLAGS) $(KERNEL_SOURCES)                  \
	                            -o $(BUILD_DIR)/kernel.elf

.PHONY: clean
clean:
	rm -f $(BUILD_DIR)/*

.PHONY: rebuild
rebuild:
	os;

.PHONY: qemu
qemu: os
	$(QEMU) $(QEMU_FLAGS) -kernel $(BUILD_DIR)/kernel.elf

.PHONY: qemu_gdb
qemu_gdb: os
	$(QEMU) $(QEMU_FLAGS) -s -S -kernel $(BUILD_DIR)/kernel.elf

.PHONY: gdb_local
gdb_local: os
	cp scripts/gdbinit $(BUILD_DIR)/.gdbinit
	echo -e "\nsymbol-file $(BUILD_DIR)/kernel.syms" >> $(BUILD_DIR)/.gdbinit
	$(GDB) -x $(BUILD_DIR)/.gdbinit
