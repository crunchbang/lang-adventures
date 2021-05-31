#include<stdio.h>

#define MAXLENGTH 1000     /* the maximum length of the input line */

int getline1(char line[], int lim); /* getline is a fuction define in stdio  */
void copy(char to[], char from[]);

main()
{
  int len;                  /* length of current line */  
  int max;                  /* length of longest line */
  char line[MAXLENGTH];     /* current line */
  char longest[MAXLENGTH];  /* longest line */

  max = 0;
  while((len = getline1(line, MAXLENGTH)) > 0)
    if(len > max) {
      copy(longest, line);
      max = len;
    }
  if(max > 0)              /* checks if there is any line at all */
    printf("%s", longest);
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

/* copy : copies the array 'from' to 'to'; assuming they are of sufficient size */

void copy(char to[], char from[])
{
  int i;
  
  i = 0;
  while((to[i] = from[i]) != '\0')
    ++i;
}
