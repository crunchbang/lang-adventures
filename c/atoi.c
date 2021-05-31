#include <stdio.h>

int atoi(const char s[]);

main()
{
  char s[] = "129";
  printf("%d\n", atoi(s));

  return 0;
}

int atoi(const char s[])
{
  int n, i;

  n = 0;
  for(i = 0; s[i] >= '0' && s[i] <= '9'; ++i)
    n = 10 * n + (s[i] - '0');
  return n;
}
