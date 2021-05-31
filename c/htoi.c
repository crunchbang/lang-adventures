#include<stdio.h>

int htoi(char s[]);

main()
{
  char s[] = "0x1f";
  printf("%d\n", htoi(s));

  return 0;
}

int htoi(char s[])
{
  int n, i;

  n = 0;
  for(i = 0;s[i] != '\0'; ++i) {
    if(s[i] == '0' && (s[i+1] == 'x' || s[i+1] == 'X'))
      i = i + 2;
    if(s[i] >= 'a' && s[i] <= 'f')
      n = 16 * n + 10 + (s[i] - 'a');
    if(s[i] >= 'A' && s[i] <= 'F')
      n = 16 * n + 10 + (s[i] - 'A');
    if(s[i] >= '0' && s[i] <= '9')
      n = 10 * n + (s[i] - '0');
  }
  
  return n;
}
