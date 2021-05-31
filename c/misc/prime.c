#include <stdio.h>

main()
{
  int i, j, flag=1;

  printf("2 ");
  for (i = 3; i < 100000; ++i) {
    for (j = 2; j < i/2; ++j)
      if (i % j == 0)
        flag = 0;
    if (flag)
      printf("%i ", i);
    flag = 1;
  }

  return 0;
}
