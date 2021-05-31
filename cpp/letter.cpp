#include <iostream>
#include <string>

using namespace std;

int main()
{
  string first_name;
  int age;
  cout << "Enter the name of the person you wish to write to "
       << "and their age:\n";
  cin >> first_name >> age;
  if (age < 0 || age > 110)
    cout << "error('your kidding!')";
  string friend_name;
  char friend_sex = 0;
  cout << "Enter the name of another friend:\n";
  cin >> friend_name;
  cout << "Gender (m:Male, f:Female):\n";
  cin >> friend_sex;

  cout << "Dear " << first_name << "," << endl;
  cout << "\tHow are you? I am fine. I miss you. "
       << "Have you seen " << friend_name << " lately? "
       << "If you see " << friend_name << " please ask ";
  if (friend_sex == 'm')
    cout << "him ";
  else
    cout << "her ";
  cout << "to call me. ";
  cout << "I hear you just had a birthday and you are " << age
       << " years old. ";
  if (age < 12)
    cout << "Next year you will be " << age + 1 << ". ";
  else if (age == 17)
    cout << "Next year you will be able to vote. ";
  else if (age > 70)
    cout << "I hope you are enjoying retirement. ";
  cout << endl;
  cout << "Yours sincerely\n\n";
  cout << "Bjarne S\n";

  return 0;
}
