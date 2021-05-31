#include <stdio.h>
#define MAXLIMIT 1000

int getline2(char line[], int limit);
int strindex(char source[], char searchfor[]);

char pattern[] = "ould";

int main()
{
	char line[MAXLIMIT];
	int found = 0;

	while((getline2(line, MAXLIMIT)) > 0) 
		if((strindex(line, pattern)) >= 0) {
			printf("%s", line);
			found++;
		}
	return found;
}	

int getline2(char line[], int limit)
{
	char c;
	int i;

	i = 0;
	while(--limit > 0 && (c = getchar()) != EOF && c != '\n')
		line[i++] = c;
	if (c == '\n')
		line[i++] = c;
	line[i] = '\0';

	return i;
}

int strindex(char source[], char searchfor[])
{
	int i, j, k;
	
	for (i = 0; source[i] != '\0'; ++i) {
		for (j = i, k = 0; searchfor[k] != '\0' && source[j] == searchfor[k]; ++j, ++k)
			;
		if (k > 0 && source[k] != '\0')
			return i;
	}
	return -1;
}
