#include<stdio.h>

main()
{
  int c;
  // We define c as an int instead of a char so that it will be 
  // able to contain EOF in addition to possible char values
  while((c = getchar()) != EOF) { 
  // Every assignment returns a value which is assigned to the variable on
  // the right hand side (the value of c, in this case) . Hence we can use
  // the above construct instead of 
  // c = getchar();
  // while(c != EOF)
  // as it shortens the definition
    putchar(c);
    // putchar converts int to equivalent char
  }
}
