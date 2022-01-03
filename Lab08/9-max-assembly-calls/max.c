#include <stdio.h>

unsigned int get_max(unsigned long long int *arr, unsigned long long int len)
{
	unsigned long long int max = 0;
	size_t i;

	for (i = 0; i < len; i++)
		if (max < arr[i])
			max = arr[i];

	return max;
}
