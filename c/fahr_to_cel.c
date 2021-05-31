#include<stdio.h>

main()
{
  float fahr, cel; 
  // fahr and cel are converted to floating point numbers for better
  // precision

  int lower, upper, step;

  lower = 0;
  upper = 300;
  step = 20;
  fahr = lower;            // #1

  printf("Fahrenheit to Celsius\n");
  while(fahr <= upper) {     // #2 
    cel = (5.0 / 9.0) * (fahr - 32.0); // #3
    printf("%5.0f %12.1f\n", fahr, cel);
    // %6.1f => print as floating point, atleast 6 characters wide
    // with only one number after the decimal point

    fahr = fahr + step;                // #4 
  }
  /* In statements 1, 2, 3, & 4 , all the integers are automatically converted into
   * floating point numbers before the calculation is done. In #3 , they are explicitly stated
   * inorder to improve readability of the code 
   */
   
}

