/* 
 * A program that detects adjacent identical words in its input
 * (My first try at literate programming)
 */

/* <double.c>=
 *  <includes>
 *  <data>
 *  <prototypes>
 *  <functions>
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <ctype.h>

int linenum;

int getword(FILE *, char *, int);
void doubleword(char *, FILE *);

int main(int argc, char *argv[])
{
    int i;

    for (i = 1; i < argc; ++i) {
        FILE *fp = fopen(argv[i], "r");
        if (fp == NULL) {
            fprintf(stderr, "%s: can't open '%s' (%s)\n",
                    argv[0], argv[i], strerror(errno));
            return EXIT_FAILURE;
        } else {
            doubleword(argv[i], fp);
            fclose(fp);
        }
    }
    if (argc == 1)
        doubleword(NULL, stdin);
    return EXIT_SUCCESS;
}

int getword(FILE *fp, char *buf, int size)
{
    int c;

    c = getc(fp);
    /* <scan forward to a nonspace character or EOF> */
    for ( ; c != EOF && isspace(c); c = getc(fp))
        if (c == '\n')
            linenum++;
    /* <copy the word into buf[0..size-1] */
    {
        int i = 0;
        for ( ; c != EOF && !isspace(c); c = getc(fp)) {
            if (c == '\n') {
                linenum++;
                break;
            }
            if (i < size - 1)
                buf[i++] = tolower(c);
        }
        if (i < size)
            buf[i] = '\0';
    }
    if (c != EOF)
        ungetc(c, fp);
    /* return <found a word?> */
    return buf[0] != '\0';
}

void doubleword(char *name, FILE *fp)
{
    char prev[128], word[128];
    int prevln;

    linenum = 1;
    prev[0] = '\0';
    while (getword(fp, word, sizeof word)) {
        if (isalpha(word[0]) && strcmp(prev, word) == 0) {
            if (prevln != linenum) {
                if (name)
                    printf("%s:", name);
                printf("%d: %s\n", linenum, word);
                prevln = linenum;
            }
        }
        strcpy(prev, word);
    }
}
