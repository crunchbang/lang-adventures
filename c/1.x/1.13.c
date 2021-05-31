#include<stdio.h>

/* Print a horizontal histogram of
 * the length of the words in input
 */
#define IN   1  /* Inside a word */
#define OUT  0  /* Outside a word */
main()
{
  int c, state;

  state = OUT;

  while((c = getchar()) != EOF) {
    if(c != '\n' && c != '\t' && c != ' ')  {
      state = IN;
      printf("|");
    } else if(state == IN) {
      state = OUT;
      printf("\n");
    }
  }
}



    
  

  

