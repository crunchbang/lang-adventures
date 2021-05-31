#include <stdio.h>

main()
{
  int i, j, flag, p_array[50000], len;
  flag = 1;
  len = 1;
  p_array[0] = 2;

  for (i = 3; i < 100000; ++i) {
    for (j = 0; j < len; ++j)
      if (i % p_array[j] == 0)
        flag = 0;
    if (flag) {
      p_array[len] = i;
      ++len;
    }
    flag = 1;
  }

  for (i = 0; i < len; ++i)
    printf("%li ", p_array[i]);
  return 0;
}
