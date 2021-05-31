#include <stdio.h>


int main()
{
    int i, j, a[6] = { 38, 45, 41, 58, 41, 59 };
    int key;

    for (i = 0; i < 6; ++i)
        printf("%d ", a[i]);
    printf("\n");

    for (j = 1; j < 6; ++j) {
        key = a[j];
        for (i = j-1; i >= 0 && a[i] > key; --i)
            a[i+1] = a[i];
        a[i+1] = key;
    }

    for (i = 0; i < 6; ++i)
        printf("%d ", a[i]);
    printf("\n");

    return 0;
}



        

