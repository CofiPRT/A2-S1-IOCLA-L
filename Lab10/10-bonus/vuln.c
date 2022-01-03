#include <stdio.h>

int hidden(int a, int b) {
	if (a == 0x12345678 && b == 0xdeadbeef) {
		puts("Good job, buddy!");
	} else {
		puts("Not there yet..");
	}
}

void reader() {
	char buf[32];
	puts("Gimme name: ");

	fgets(buf, 120, stdin);

	printf("Hi %s\n", buf);
}

int main() {
	reader();
	return 0;
}
