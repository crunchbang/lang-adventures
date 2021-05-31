#include<stdio.h>

/* A program to print a histogram of the frequecy 
 * of each character in its input
 */

main()
{
  int c, j, i;
  int alphabet[26];

  for(i = 0; i < 26; ++i)
    alphabet[i] = 0;

  while((c = getchar()) != EOF)
    if(c >= 'a' && c <= 'z')
      ++alphabet[c - 'a'];
    else if(c >= 'A' && c <= 'Z')
      ++alphabet[c - 'A'];

  printf("Frequency of alphabets :\n");
  for(i = 0; i < 26; ++i) {
    printf("%c ", (i+65));
    for(j = 0; j < alphabet[i]; ++j)
      printf("|");
    printf("\n");
  }
}
  
      
