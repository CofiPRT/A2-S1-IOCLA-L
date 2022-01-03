#include <stdio.h>

void print_binary(short num, char *name)
{
	printf("%s: ", name);

	int i;
	for (i = 0; i < 8 * sizeof(num); i++)
	{
		printf("%u ", !!(num & (1 << 8 * sizeof(num) - 1)));
		num <<= 1;
	}

	printf("\n");
}

void print_binary_un(unsigned short num, char *name)
{
	printf("%s: ", name);

	int i;
	for (i = 0; i < 8 * sizeof(num); i++)
	{
		printf("%u ", !!(num & (1 << 8 * sizeof(num) - 1)));
		num <<= 1;
	}

	printf("\n");
}

int main(void)
{
    short a = 20000;
    short b = 14000;

    print_binary(a, "a");
    print_binary(b, "b");

    short c = a + b;

    print_binary(c, "c");

    unsigned short d = 3 * a + b;

    print_binary_un(d, "d");

    short e = a << 1;

    print_binary(e, "e");

    // TODO - print variables c, d, e
    printf("c: %d\nd: %d\ne: %d\n", c, d, e);

    return 0;
}
