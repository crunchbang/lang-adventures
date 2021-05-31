#include <stdio.h>
#include <ctype.h>

double atof(char s[])
{
    double val, power, expower, step;
    int i, j, sign, psign;

    for (i = 0; isspace(s[i]); ++i)
        ;
    sign = (s[i] == '-') ? -1 : 1;
    if (s[i] == '-' || s[i] == '+')
        i++;
    for (val = 0.0; isdigit(s[i]); ++i)
        val = 10.0 * val + (s[i] - '0');
    if (s[i] == '.')
        i++;
    for (power = 1.0; isdigit(s[i]); ++i) {
        val = 10.0 * val + (s[i] - '0');
        power *= 10.0;
    }
    expower = 1.0;
    if (s[i] == 'e' || s[i] == 'E') {
        i++;
        psign = (s[i] == '-') ? -1 : 1;
        if (s[i] == '-' || s[i] == '+')
            i++;
        step = (psign == -1) ? 0.1 : 10.0;
        for (j = 1; j <= (s[i] - '0'); ++j) 
            expower *= step;
    }


    return sign * val * expower / power;
}

