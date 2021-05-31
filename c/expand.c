#include <stdio.h>
#include <string.h>

void expand(char s1[], char s2[]);


int main(int argc, char *argv[])
{
	int i;
	char result[36];
	for (i = 1; i < argc; ++i) {
		expand(argv[i], result);
		printf("%s \n", result);
	}

	return 0;
}

void expand(char s1[], char s2[])
{
	int i, j, diff, len;
	char beg, end;
	len = 0;
	for (i = 0; s1[i] != '\0'; ++i) 
		if (s1[i] == '-' && i != 0 && s1[i + 1] != '\0') {
			beg = s1[i - 1]; 
			end = s1[i + 1];
			diff = end - beg;
			for (j = 0; j <= diff; ++j) {
				s2[len] = beg + j;
				len++;
			}
		}
	s2[len] = '\0';
}
