/*  A program to determine the ranges of char, short, 
 *  int and long variables, both signed and unsigned,
 *  by printing appropriate values from standard headers 
 *  and by direct computation
 */
#include <stdio.h> 
#include <limits.h>
#include <float.h>

main()
{
  printf(" CHAR_BIT:%20d\n", CHAR_BIT);
  printf(" CHAR_MAX:%20d\n UCHAR_MAX:%20d\n SCHAR_MAX:%20d\n", CHAR_MAX, UCHAR_MAX, SCHAR_MAX);
  printf(" CHAR_MIN:%20d\n SCHAR_MIN:%20d\n", CHAR_MIN, SCHAR_MIN);
  printf(" INT_MAX:%20d\n INT_MIN:%20d\n LONG_MAX:%20ld\n LONG_MIN:%ld\n", INT_MAX, INT_MIN, LONG_MAX, LONG_MIN);

  return 0;
}
