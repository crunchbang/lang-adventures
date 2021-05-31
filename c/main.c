#include <stdio.h>

double atof(char s[]);

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

int main()
{
    char s[10], line[20];
    double sum;

    sum = 0;
    while (getline2(line, 100) > 0)
        printf("\t%g\n", sum+= atof(line));


    return 0;
}
    
