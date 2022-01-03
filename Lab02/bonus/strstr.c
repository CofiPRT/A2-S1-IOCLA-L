#include <stdio.h>
#include <string.h>

int main()
{
	char *str1 = "nemaivazut";
	char *str2 = "mai";

	int i, j, index = -1;

	i = 0;

	if (strlen(str2) > strlen(str1))
		goto end_string_one;

start_string_one:
	if (i > strlen(str1) - strlen(str2))
		goto end_string_one;

	j = 0;

start_string_two:
	if (j == strlen(str2))
	{
		index = i;
		goto end_string_one;
	}

	if (str2[j] != str1[i+j])
		goto end_string_two;

	j++;
	goto start_string_two;

end_string_two:

	i++;
	goto start_string_one;

end_string_one:

	printf("Index: %d\n", index);

	return 0;
}