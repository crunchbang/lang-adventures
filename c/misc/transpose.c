/*
 * transpose.c
 * A program to find the transpose of a matrix stored in row major form
 */
#include <stdio.h>

#define MAX(A, B) ((A) >= (B) ? (A) : (B))

int main()
{
	int i, j, matrix[10][10], r, c, temp, min, max;
	printf("Enter the number of rows and colums: ");
	scanf("%i %i", &r, &c);
	printf("Enter the matrix:\n");
	for (i = 0; i < r; ++i)
		for (j = 0; j < c; ++j)
			scanf("%i", &matrix[i][j]);

	printf("\nMatrix:\n");
	for (i = 0; i < r; ++i) {
		for (j = 0; j < c; ++j)
			printf("%i ", matrix[i][j]);
		printf("\n");
	}
	
	max = MAX(r, c);
	min = r + c - MAX(r, c);

	for (i = 0; i < min; ++i)               // Find the square matrix within the matirx and transpose it
		for(j = i + 1; j < min; ++j) {
			temp = matrix[i][j];
			matrix[i][j] = matrix[j][i];
			matrix[j][i] = temp;
		}
	if (r != c) {				// Reposition the rest of the elements
		for (i = min; i < max; ++i)
			for(j = 0; j < min; ++j) 
				if (min == c) 
					matrix[j][i] = matrix[i][j];
				else
					matrix[i][j] = matrix[j][i];
	}
	
	printf("\nTransposed Matrix:\n");
	for (i = 0; i < c; ++i) {
		for (j = 0; j < r; ++j)
			printf("%i ", matrix[i][j]);
		printf("\n");
	}
	return 0;
}
