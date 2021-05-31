/*
 * mirror.c
 * A program to find the mirror image of a matrix
 */
#include <stdio.h>

int main()
{
	int i, j, matrix[10][10], r, c, mirror[10][10], ctr;
	printf("Enter the number of rows and colums: ");
	scanf("%i %i", &r, &c);
	printf("Enter the matrix:\n");
	for (i = 0; i < r; ++i)
		for (j = 0; j < c; ++j)
			scanf("%i", &matrix[i][j]);

	printf("\nMatrix:\n");
	for (i = 0; i < r; ++i) {
		for (j = 0; j < c; ++j)
			printf("%2i ", matrix[i][j]);
		printf("\n");
	}

        for (i = c - 1, ctr = 1; i >= 0; --i, ctr += 2)
            for (j = 0; j < r; ++j) 
                mirror[j][(i + ctr) % c] = matrix[j][i];

	printf("\nMirror Matrix:\n");
	for (i = 0; i < r; ++i) {
		for (j = 0; j < c; ++j)
			printf("%2i ", mirror[i][j]);
		printf("\n");
	}
	
	return 0;
}
