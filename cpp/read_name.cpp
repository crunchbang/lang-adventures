#include <iostream>
#include <string>

using namespace std;

int main()
{
    cout << "Please enter your first name and age: ";
    string first_name;
    int age;
    cin >> first_name >> age;
    cout << "Hello, " << first_name << "(" << age << ")!\n";
}
