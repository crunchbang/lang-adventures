#include <stdio.h>
#include <stdlib.h>

void shellsort (int v[], int len);
int binsearch (int x, int v[], int len);


int main()
{
	int sarray[50], len, i, pos, ele;

	printf("Enter the number of elements in the array (MAX = 50): ");
	scanf("%i", &len);
	if (!len || len < 0) {
		printf("INVALID LENGTH\n");
		exit(0);
	}
	printf("Enter the elements:\n");
	for (i = 0; i < len; ++i)
		scanf("%i", &sarray[i]);
	shellsort(sarray, len);
	printf("Enter the search term: ");
	scanf("%i", &ele);
	pos = binsearch(ele, sarray, len);
	if (pos != -1)
		printf("Element found at position %i\n", pos);
	else
		printf("Element not found\n");

	return 0;
}

/*
 * shellsort : Perform shell sort on the array 'v'
 */
void shellsort (int v[], int len)
{
	int i, j, gap, temp;

	for (gap = len/2; gap > 0; gap /= 2)
		for (i = gap; i < len; ++i) 
			for (j = i - gap; j >= 0 && v[j] > v[j+gap]; j -= gap) {
				temp = v[j];
				v[j] = v[j+gap];
				v[j+gap] = temp;
			}

}




/*
 * binsearch : a function to perform binary search for the element
 *             'x' in array 'v'
 */

int binsearch (int x, int v[], int len)
{
	int low, high, mid;
	low = 0;
	high = len - 1;

	while (low <= high) {
		mid = (low + high) / 2;
		if (x < mid)
			high = mid - 1;
		else if (x > mid)
			low = mid + 1;
		else 
			return mid;
	}
	return -1;
}
