#include <stdio.h>

char lower(char s);

main()
{
  char s[] = "ATHULSURESH";
  int i;

  for(i = 0; s[i] != '\0'; ++i)
    s[i] = lower(s[i]);

  printf("%s\n",s);
  return 0;
}

char lower(char s)
{

  if(s >= 'A' && s <= 'Z')
    s = 'a' + (s - 'A');
  return s;
}
