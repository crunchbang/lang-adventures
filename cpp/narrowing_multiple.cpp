#include <iostream>
#include <string>

using namespace std;

int main()
{
    double d = 0;
    while (cin >> d) {
        int i = d;
        char c = d;
        int i2 = c;
        cout << "d == " << d << endl
	     << "i == " << i << endl
	     << "i2 == " << i2 << endl
	     << "char(" << c << ")\n";
    }
    return 0;
}

