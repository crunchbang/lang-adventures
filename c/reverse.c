#include <stdio.h>
#include <string.h>

void reverse(char s[]);

int main(int argc, char *argv[])
{
	int i;
	for (i = 1; i < argc; ++i) {
		reverse(argv[i]);
		printf("%s ", argv[i]);
	}
	printf("\n");

	return 0;
}

void reverse(char s[])
{
	int i, j;
	char c;
/*
 * Alternate method:
 *	for (i = 0, j = strlen(s) - 1; i < j; ++i, --j) {
 *		c = s[i];
 *		s[i] = s[j];
 *		s[j] = c;
 *	}
 */
	for (i = 0, j = strlen(s) - 1; i < j; ++i, --j) 
		c = s[i], s[i] = s[j], s[j] = c;
}
		

	
