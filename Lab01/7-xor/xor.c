#include <stdio.h>

int main() {
    char hex1[] = "\x4c\x26\xe3\xb4\x4c\x86\xc2\x1e\xf8\x90\x89\x70\xc7\xaf\x74\x75\xc1\x7e\x83\x4c\x7c\x01\xaa\x70\x2e\x77";
    char hex2[] = "\x00\x43\x82\xc6\x22\xa6\xb6\x71\xd8\xe5\xfa\x15\xe7\xc7\x11\x0d\xe1\x07\xec\x39\x5c\x6c\xdf\x03\x5a\x56";

    char xor[26];

    // TODO - xor hex1 and hex2 byte by byte
    int i;
    for (i = 0; i < sizeof(xor) + 1; i++)
    	xor[i] = hex1[i] ^ hex2[i];

    printf("%s\n", xor);
    printf("hex1: %zu\nhex2: %zu\nxor: %zu\n", sizeof(hex1), sizeof(hex2), sizeof(xor));
    return 0;
}
