#include <stdio.h>

int main(void)
{
	char cpuid_str[13];

	__asm__ (
	"xor eax, eax\n"
	"cpuid\n"
	"mov eax, %0\n"
	"mov DWORD PTR [eax], ebx\n"
	"mov DWORD PTR [eax + 4], edx\n"
	"mov DWORD PTR [eax + 8], ecx\n"
	: 
	: "r" (cpuid_str)
	: "eax", "ebx", "ecx", "edx"
	);

	cpuid_str[12] = '\0';

	printf("CPUID string: %s\n", cpuid_str);

	return 0;
}
