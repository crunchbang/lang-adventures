#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

//pg 162
int main()
{
    vector<double> temps;
    double ele;
    while (cin >> ele)
        temps.push_back(ele);

    double sum = 0;
    for (int i = 0; i < temps.size(); ++i)
        sum += temps[i];
    cout << "Avg temperature: " << sum / temps.size() << endl;

    sort(temps.begin(), temps.end());

    cout << "Median temp: " << temps[temps.size() / 2] << endl;

    return 0;
}
