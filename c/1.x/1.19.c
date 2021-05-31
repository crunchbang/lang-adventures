#include<stdio.h>

#define MAXLENGTH 1000

int getline1(char line[], int limit);
void reverse(char reversed[], char line[], int len);

main()
{
  int len;
  char line[MAXLENGTH], rev_line[MAXLENGTH];

  while((len = getline1(line, MAXLENGTH)) > 0)
  {
    reverse(rev_line, line, len);
    printf(" %s", rev_line);
  }
  return 0;
}


/* getline1 : reads input , line by line, into 'line' until 'limit' or '\n' is reached 
 *           returns an int denoting the length of the line
 */

int getline1(char line[], int limit)
{
  int i, c;

  for(i = 0; i < limit - 1 && (c = getchar()) != EOF && c != '\n'; ++i)
    line[i] = c;
  if(c == '\n') {
    line[i] = c;
    ++i;
  }
  line[i] = '\0';
  return i;
}

/* reverse: reverses the string 'line' and stores it in 'reversed' 
 *           'len' is the length of 'line'
 */

void reverse(char reversed[], char line[], int len)
{
  int i;

  for(i = 0; len >= 0; --len) 
    if(line[len] != '\0' && line[len] != '\n') {
      reversed[i] = line[len];
      ++i;
    }
  reversed[i++] = '\n';
  reversed[i] = '\0';
}
