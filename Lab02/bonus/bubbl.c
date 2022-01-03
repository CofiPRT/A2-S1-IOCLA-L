#include <stdio.h>

#define MAX 100

int main()
{
    int a[MAX], maxnr;

    scanf("%d", &maxnr);

    int i = 0, j = 0, temp;

start_read:
    if (i == maxnr)
        goto end_read;

    scanf("%d", &a[i]);

    i++;
    goto start_read;

end_read:

    i = 0;

start_bubble:
    if (i == maxnr - 1)
        goto end_bubble;

    j = 0;
start_swap:
    if (j == maxnr - i - 1)
        goto end_swap;

    if (a[j] > a[j+1])
    {
        a[j] = a[j] + a[j+1];
        a[j+1] = a[j] - a[j+1];
        a[j] = a[j] - a[j+1];
    }

    j++;
    goto start_swap;

end_swap:

    i++;
    goto start_bubble;

end_bubble:

    i = 0;

    printf("Final: ");

start_print:
    if (i == maxnr)
        goto end_print;

    printf("%d ", a[i]);

    i++;
    goto start_print;

end_print:

    return 0;
}