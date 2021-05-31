#include <iostream>

int main()
{
  int currVal;

  if (std::cin >> currVal) {
    int val = currVal;
    int cnt = 1;
    while (std::cin >> currVal) {
      if (val == currVal)
	++cnt;
      else {
	std::cout << val << " occurs " << cnt << " times" << std::endl;
	val = currVal;
	cnt = 1;
      }
    }
    std::cout << val << " occurs " << cnt << " times" << std::endl;
  }

  return 0;
}
    
    
    
