#include <stdio.h>

#define TABSTOP   8
#define MAXLENGTH 100

int getline1(char line[], int limit);
void detab(char line[], int length);

main()
{
  
  int i, len;
  char line[MAXLENGTH];

  for (i = 0; (len = getline1(line, MAXLENGTH)) > 0; ++i) {
   detab(line, len);
   printf("%s", line);
  }

  return 0;
}

int getline1(char line[], int limit)
{
  int c, j;
  printf("getline\n");
  for (j = 0; j < limit-1 && (c = getchar()) != EOF && c != '\n'; ++j)
    line[j] = c;
  if (c == '\n') {
    line[j] = c;
    ++j;
  }
  line[j] = '\0';
  
  return j;
}

void detab(char line[], int len)
{
  int k, l, spaces;
  char result[MAXLENGTH];
  printf("here1");
  l = 0;
  for (k = 0; k < len; ++k) {
    if (line[k] == '\t') {
      spaces = (((k / TABSTOP) + 1) * TABSTOP) - k;
      printf("heere");
      for (;l <= l+spaces; ++l)
        result[l] = ' ';
    
    }
    else {
      result[l] = line[k];
      ++l;
    }
  }

  line = result;
}
