/*
 * f(x) = 1 / (1 + sqr(x))
 * simpsons rule
 * h / 3 [ (f(0) + f(n)) + 4(f(1) + f(3) + .. + f(n-1)) + 2(f(2) + f(4) + ... + f(n-2))]
 */

#include <stdio.h>
#include <math.h>

float function (int n);
float simpson (int llim, int ulim);

int main()
{
    int llim, ulim;
    float result;

    printf("Enter the lower and upper limit for integration: ");
    scanf("%i %i", &llim, &ulim);
    result = simpson(llim, ulim);
    printf("\n\n");
    printf("Integral f(x) between limits %i and %i : \n", llim, ulim);
    printf("\n%3.3f", result);

    return 0;
}

float function (int n)
{
    float res;

    res = 1 / (1.0 + pow(n, 1));
    return res;
}

float simpson (int llim, int ulim)
{
    int i;
    float h;
    float term1, term2, term3;
    float result;

    h = (ulim - llim) / 2.0;
    printf("#%f", h);
//    term1 = function(0) + function(ulim);
    term1 = function(llim);
//    term2 = 0;
//    for (i = 1; i < ulim; i+=2)
//        term2 += function(i);
    term2 = function((ulim + llim) / 2.0);
//    term3 = 0;
//    for (i = 2; i < ulim; i+=2)
//        term3 += function(i);
    term3 = function(ulim);
    result = (h / 3) * (term1 + 4 * term2 + term3);

    return result;
}
