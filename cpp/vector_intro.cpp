#include <iostream>
#include <string>
#include <vector>

using namespace std;

//growing a vector using pushback
int main()
{
    vector<int> v;
    int ele;
    cout << "Enter the elements of the vector: ";
    while (cin >> ele) 
        v.push_back(ele);
    cout << endl;
    cout << "VECTOR:\n";
    for (int i = 0; i < v.size(); ++i)
        cout << v[i] << " ";

    cout << endl;
    return 0;
}
