#include<stdio.h>

main()
{
  int c, test;


  while((c = getchar()) != EOF) {
    test = 0;
    if(c == '\b') {
      test = 1;
      putchar('\\');
      putchar('b');
    }
    if(c == '\t') {
      test = 1;
      putchar('\\');
      putchar('t');
    }
    if(c == '\\') {
      test = 1;
      putchar('\\');
      putchar('\\');
    }
    if(test == 0)
      putchar(c);
  }
}

