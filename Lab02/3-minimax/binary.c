#include <stdio.h>

#define MAX 100

int main()
{
    int a[MAX], maxnr;
    int search_for, left, mid, right, sol = -1;

    scanf("%d", &maxnr);

    left = 0; right = maxnr - 1;

    int i = 0;

start_read:
    if (i == maxnr)
        goto end_read;

    scanf("%d", &a[i]);

    i++;
    goto start_read;

end_read:

    printf("Search for: ");
    scanf("%d", &search_for);

start_search:
    if (left > right)
        goto end_search;

    mid = (left + right) / 2;
    if (a[mid] == search_for)
    {
        sol = mid;
        goto end_search;
    }

    if (a[mid] > search_for)
        right = mid - 1;

    if (a[mid] < search_for)
        left = mid + 1;

    goto start_search;

end_search:
    printf("Index: %d\n", sol);

    return 0;
}

