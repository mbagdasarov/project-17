ENTRY(_start)

SECTIONS
{
	. = 0x80010000;
	.text :
	{
		KEEP(*(.boot))
		*(.text)
	}

	.data :
	{
		*(.data)
	}

	.bss :
	{
		*(COMMON)
		*(.bss)
	}
}
