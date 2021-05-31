#include <stdio.h>

void qsort (int *a, int n)
{
  int pivot;
  int *left, *right;
  int temp;
  
  if (n <= 1)
    return;
  pivot = a[n / 2];
  left = a;
  right = (a + n - 1);

  while (left <= right) {
    if (*left < pivot) {
      left++;
      continue;
    }
    if (*right > pivot) {
      right --;
      continue;
    }
    temp = *left;
    *left = *right;
    *right = temp;
    ++left;
    --right;
    /* alternately:
       temp = *left;
       *left++ = *right;
       *right-- = temp; */
  }
  qsort(a, right - a + 1);
  qsort(left, n - (left - a));
}

int main()
{
  int arr[] = {3 , 23, 263, 2, 1, 20};
  //  int n = sizeof(arr) / sizeof(arr[0]);
  int n = 6;
  int i;
  printf("Before sorting:\n");
  for (i = 0; i < n; ++i)
  printf("%d ", arr[i]);
  qsort(arr, n);
  printf("\nAfter sorting:\n");
  for (i = 0; i < n; ++i)
    printf("%d ", arr[i]);

  return 0;
}
