#include <iostream>

int main()
{
  int sum = 0, value = 0;
  /* tests if the istream object (cin) is valid
   * (i.e it stops when cin is EOF or invalid input)
   */
  while (std::cin >> value)
    sum += value;
  std::cout << "Sum is: " << sum << std::endl;

  return 0;
}
    
