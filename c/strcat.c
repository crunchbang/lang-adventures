#include <stdio.h>

void strcat1 (char s[], char t[]);

main()
{
	char str1[20] = "athul";
	char str2[10] = "suresh";

	strcat1(str1, str2);
	printf("%s\n", str1);

	return 0;
}

/* strcat1 : Concatenates string 't' to the end of 's'
 *          's' must be long enough.
 */

void strcat1 (char s[], char t[]) 
{
	int i, j;
	
	i = j = 0;
	while (s[i] != '\0')
		++i;
	while ((s[i++] = t[j++]) != '\0')
		;
}

	
