#include <stdio.h>

void squeeze (char s[], char t[]);

main()
{
	char string[20] = "Mississippi";
	char string2[20] = "ps";

	squeeze(string, string2);
	printf("%s\n", string);

	return 0;
}

/*
 * squeeze: Removes every occurence of every character in 't' from string 's'
 */

void squeeze (char s[], char t[])
{
	int i, j, k;

	for (k = 0; t[k] != '\0'; ++k) {
		for (i = j = 0; s[i] != '\0'; ++i) {
			if (s[i] != t[k])
				s[j++] = s[i];
		}
		s[j] = '\0';
	}
}
