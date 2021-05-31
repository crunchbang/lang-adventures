#include<stdio.h>

#define IN  1
#define OUT 0 

main()
{
  int c, state, word;

  state = IN;
  while((c = getchar()) != EOF) {
    if(c == ' ' || c == '\t' || c == '\n') {
      state = OUT;
      putchar('\n');
    } else
      putchar(c);
  }
}
      
