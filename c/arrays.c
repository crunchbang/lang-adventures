#include<stdio.h>

main()
{
  int c, i, nwhites, noc;
  int ndigit[10];

  nwhites = noc = 0;
  for(i = 0; i < 10; ++i)
    ndigit[i] = 0;

  while((c = getchar()) != EOF) {
    if(c >= '0' && c <= '9')
      ++ndigit[c - '0'];
    else if(c == '\n' || c == '\t' || c == ' ')
      ++nwhites;
    else
      ++noc;
  }
    printf("Digits =");
    for(i = 0; i < 10; ++i)
      printf(" %d", ndigit[i]);

    printf(", whites = %d, other characters = %d\n", nwhites, noc);
}



