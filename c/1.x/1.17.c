#include<stdio.h>

#define MAXLENGTH 1000     /* the maximum length of the input line */
#define THRESHOLD 80

int getline1(char line[], int lim); /* getline is a fuction define in stdio  */

main()
{
  int len;                  /* length of current line */  
  char line[MAXLENGTH];     /* current line */

  while((len = getline1(line, MAXLENGTH)) > 0)
    if(len > THRESHOLD) 
      printf("%s", line);
  return 0;
}


/* getline1: reads a line from input into 'line' whose length is no longer than 'lim' */

int getline1(char line[], int lim)
{
  int i, c;

  for(i = 0; (c = getchar()) != EOF && c != '\n' && i <= lim - 1; ++i)
    line[i] = c;
  if(c == '\n') {
    line[i] = c;
    ++i;
  }
  line[i] = '\0';
  return i;
}

