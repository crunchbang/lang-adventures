#include<stdio.h>

/* An assignment is an expression whose value is the
 * value assigned to the variable on the left.
 * Thus
 * a = (b = (c = 1));
 * is possible and is equivalent to
 * a = b = c = 1;
 */

#define IN  1  /* Inside a word */
#define OUT 0  /* Outside a word */

/* Count the number of lines, words and characters in input */
main()
{
  int c, nl, nw, nc, state;

  state = OUT;
  nl = nw = nc = 0;

  while((c = getchar()) != EOF) {
    ++nc;
    if(c == '\n')
      ++nl;
    if(c == ' ' || c == '\n' || c == '\t')
      state = OUT;
    else if(state == OUT) {
      state = IN;
      ++nw;
    }
  }

  printf("%d %d %d\n", nl, nw, nc);
}
