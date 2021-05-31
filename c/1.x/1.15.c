#include<stdio.h>

/* Fahrenheit to Celsius converter */

float temp_converter(int fahr);

#define LOWER      0
#define UPPER    300
#define STEP      20

main()
{
  int fahr;

  for(fahr = LOWER; fahr <= UPPER; fahr += STEP)
    printf("%3d %6.1f\n", fahr, temp_converter(fahr));
  return 0;
}

/* temp_converter : converts temperature in Fahrenheit to Celsius */

float temp_converter(int fahr)
{
  float cel;

  cel = (5.0/9.0) * (fahr - 32);
  return cel;
}
