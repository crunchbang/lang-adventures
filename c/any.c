#include <stdio.h>

int any (char s1[], char s2[]);

main()
{
	char s1[10] = "thul";
	char s2[2] = "la";
	int pos = -1;

	pos = any(s1, s2);
	printf("%d\n", pos);

	return 0;
}

/* any: returns the first location in s1 where any character from s2 occurs, -1 otherwise. */

int any(char s1[], char s2[])
{
	int i, j, pos;
	int flag = 0;

	for (i = 0; s2[i] != '\0'; ++i)
		for (j = 0; s1[j] != '\0'; ++j)
			if (s1[j] == s2[i]) {
				if (!flag) {
					flag = 1;
					pos = j;
				}
				else if (j < pos)
					pos = j;
			}
	if (!flag)
		pos = -1;
	return pos;
}
