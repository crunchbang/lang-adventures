#include <stdio.h>
#include <string.h>

void trim(char s[]);

int main()
{
	char s[20] = "athul          ";
	printf("%s:end\n", s);
	trim(s);
	printf("%s:end\n", s);

	return 0;
}
	
void trim(char s[])
{
	int i;
	for (i = strlen(s) - 1; i >= 0; i--)
		if (s[i] != ' ' && s[i] != '\t' && s[i] != '\n')
			break;
	s[i+1] = '\0';
}
	

