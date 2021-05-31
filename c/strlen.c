#include <stdio.h>

int strlen(char s[]);

main()
{
  char string[] = "athulsuresh";
  printf("%d\n", strlen(string));

  return 0;
}

int strlen(char s[])
{
  int i;
  while( s[i] != '\0')
    ++i;
  return i;
}
