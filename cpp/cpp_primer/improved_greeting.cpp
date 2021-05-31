#include <iostream>
#include <string>

int main()
{
  std::string name;
  std::cout << "Please enter your first name: ";
  std::cin >> name;

  const std::string greeting = "Hello, " + name + "!";
  const std::string spaces(greeting.size(), ' ');
  const std::string second = "*" + spaces + "*";
  const std::string first(second.size(), '*');

  std::cout << std::endl
	    << first << std::endl
	    << second << std::endl
	    << "*" << greeting << "*" << std::endl
	    << second << std::endl
	    << first << std::endl;

  return 0;
}
  
