#include <stdio.h>

int main(void)
{
	unsigned int a = 4127;
	int b = -27714;
	unsigned int c = 0x12345678;
	char d[] = {'I', 'O', 'C', 'L', 'A'};

	unsigned char *p;
	size_t i;
	
	p = (unsigned char *) &a;
	printf("a: ");
	for (i = 0; i < sizeof(a); i++)
		printf(" 0x%02x", p[i]);
	printf("\n");

	p = (unsigned char *) &b;
	printf("b: ");
	for (i = 0; i < sizeof(b); i++)
		printf(" 0x%02x", p[i]);
	printf("\n");

	p = (unsigned char *) &c;
	printf("c: ");
	for (i = 0; i < sizeof(c); i++)
		printf(" 0x%02x", p[i]);
	printf("\n");

	p = (unsigned char *) &d;
	printf("d: ");
	for (i = 0; i < sizeof(d); i++)
		printf(" 0x%02x", p[i]);
	printf("\n");


	return 0;
}
