#include <stdio.h>
#include <string.h>

void itoa(int n, char s[]);
void reverse(char s[]);

int main()
{
	int n;
	char s[10];
	printf("Enter a number: ");
	scanf("%i", &n);
	itoa(n, s);
	printf("%s \n", s);
	return 0;
}

void itoa(int n, char s[])
{
	int i, sign;
	if ((sign = n) < 0)
		n = -n;
	i = 0;
	do {
		s[i++] = n % 10 + '0';
	} while((n /= 10) > 0);
	if (sign < 0)
		s[i++] = '-';
	s[i] = '\0';
	reverse(s);
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
