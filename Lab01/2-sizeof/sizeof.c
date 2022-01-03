#include <stdio.h>
int main()
{
    char charT;
    short shortT;
    int integerT;	
    unsigned int unsignedIntegerT;
    long longT;
    long long longlongT;
    void * voidT;

    printf("\nSizes: \n\n");

    printf("charT: %zu\n", sizeof(charT));
    printf("shortT: %zu\n", sizeof(shortT));
    printf("integerT: %zu\n", sizeof(integerT));
    printf("unsignedIntegerT: %zu\n", sizeof(unsignedIntegerT));
    printf("longT: %zu\n", sizeof(longT));
    printf("longlongT: %zu\n", sizeof(longlongT));
    printf("voidT: %zu\n", sizeof(voidT));

    return 0;
}
