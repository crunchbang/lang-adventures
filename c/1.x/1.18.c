#include<stdio.h>

#define MAXLENGTH 1000

int getline1(char line[], int limit);
void rem_whites(char line[], int len);

main()
{
  int len;
  char line[MAXLENGTH]; 

  while((len = getline1(line, MAXLENGTH)) > 0)
  {
    rem_whites(line, len);
    printf("=>%s\n", line);
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

/* rem_whites : removes trailing white spaces and tabs from string 'line' of
 * length 'len'
 */

void rem_whites(char line[], int len)
{
  int state, pos;

  state = 0;
  while(state == 0) { 
    if(line[len] != '\0' && line[len] != '\n' && line[len] != '\t' && line[len] != ' ') {
      pos = len;
      state = 1;
    }
    --len;
  }
  ++pos;
  line[pos] = '\0';
}

    
