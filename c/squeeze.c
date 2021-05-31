#include <stdio.h>

void squeeze (char s[], int c);

main()
{
	char string[20] = "Mississippi";
	char c = 's';

	squeeze(string, c);
	printf("%s\n", string);

	return 0;
}

/*
 * squeeze: Removes every occurence of 'c' from string 's'
 */

void squeeze (char s[], int c)
{
	int i, j;

	for (i = j = 0; s[i] != '\0'; ++i) {
		if (s[i] != c)
			s[j++] = s[i];
	}
	s[j] = '\0';
}
