int main(void)
{
	char *string = "Hello, World!\n";

	while (*string) {
		*(volatile char *)0x1c090000 = *string;
		string++;
	}

	return 0;
}
