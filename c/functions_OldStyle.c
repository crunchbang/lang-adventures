#include<stdio.h>

int power()

main()
{
  int i;
  for(i = 0; i < 10; ++i)
    printf(" %d %3d %6d\n", i, power(2, i), power(-3, i));
  return 0;
}

int power(base, n)
  int base, n;
{
  int i, p;
  
  p = 1;
  for(i = 0; i < n; ++i)
    p = p * base;
  return p;
}
