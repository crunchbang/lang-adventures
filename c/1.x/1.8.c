#include<stdio.h>

main()
{
  int c, nl, tb, sp;

  nl = 0;
  tb = 0;
  sp = 0;
  
  while((c = getchar()) != EOF) {
    if(c == '\n')
      ++nl;
    else if(c == ' ')
      ++sp;
    else if(c == '\t')
      ++tb;
  }
  printf("Newline:%d\nTabspace:%d\nSpace:%d\n", nl, tb, sp);
}
