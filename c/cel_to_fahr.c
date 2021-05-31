#include<stdio.h>

main()
{
  float fahr, cel;
  int lower, upper, step;

  lower = 0;
  upper = 300;
  step = 20;
  cel = lower;

  while(cel <= upper)  {
    fahr = ((9 * cel) / 5) + 32;
    printf("%3.0f %6.1f\n", cel, fahr);
    cel = cel + step;
  }
}

