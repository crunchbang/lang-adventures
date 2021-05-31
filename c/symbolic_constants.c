/* It is not wise to use numbers like 300 and 20 in a
 * program without any indication. They convey little meaning about
 * their purpose. Hence it is adived to use symbolic names using #define
 * The format is 
 * #define text replacement_text
 */

#include<stdio.h>

#define LOWER 0
#define UPPER 300
#define STEP  20

main()
{
  int fahr;

  for(fahr = LOWER; fahr <= UPPER; fahr = fahr + STEP){
    printf("%3d %6.1f\n", fahr, (5.0/9.0) * (fahr - 32));
  }
}

