#include <stdio.h>
#include <math.h>

int main()
{
	int s[20], words[10];
	s = getline();
        sscanf(s, "%s ", words);
	printf("%s \n", words);
	return 0;
}
