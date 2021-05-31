#include<stdio.h>

main()
{
  int c, prev_space;

  if((c = getchar()) != EOF) {
    if(c == '\t')
      c = ' ';
    if(c != ' ')
      prev_space = 0;
    if(c == ' ')
      prev_space = 1;
    putchar(c);
  }

  while((c = getchar()) != EOF) {
    if(prev_space == 0) {
      if(c == '\t')
        c = ' ';
      if(c == ' ')
        prev_space = 1;
      putchar(c);
    }
    if(prev_space == 1) {
      if(c == '\t')
        c = ' ';
      if(c != ' ') {
        prev_space = 0;
        putchar(c);
      }
    }
  }
}
      
