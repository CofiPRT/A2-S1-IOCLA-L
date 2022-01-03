#include <stdio.h>

#define MAX 100

int main()
{
	int a[MAX], maxnr, max;

	scanf("%d", &maxnr);

	int i = 0;

start_read:
	if (i == maxnr)
		goto end_read;

	scanf("%d", &a[i]);

	i++;
	goto start_read;

end_read:

	max = 0;
	i = 0;

start_find:
	if (i == maxnr)
		goto end_find;

	if (max <= a[i])
		max = a[i];

	i++;
	goto start_find;

end_find:
	
	printf("Maximum: %d\n", max);

	return 0;
}