#include <bits/stdc++.h>
#define ll long long
using namespace std;

const float tolerance = 1e-6;

float f(float x)
{
    return 4 * x * x + 3 * x - 3;
}

float Bisection(float a, float b)
{
    if (f(a) * f(b) > 0)
        return LLONG_MIN;

    float err = abs(a - b);
    float cc;
    ll iteration = 0;

    while (err >= tolerance)
    {
        cc = (a + b) / 2;

        if (f(cc) == 0.0f)
            return cc;

        if (f(a) * f(cc) < 0)
        {
            b = cc;
        }
        else
        {
            a = cc;
        }

        err = abs(a - b);
        iteration++;
    }

    cout << "Number of Iterations: " << iteration << '\n';
    return cc;
}

void TraditionalApproach()
{
    float l = 0, r = 10;
    float root = Bisection(l, r);

    if (root != LLONG_MIN)
    {
        cout << "Root (Traditional Approach): " << root << '\n';
    }
    else
    {
        cout << "No root found in [" << l << ", " << r << "]\n";
    }
}

void ImprovedApproach()
{
    float iniL = 0, iniR = 10;
    float l = LLONG_MIN, r = LLONG_MIN;

    for (float x = iniL; x <= iniR; x += 0.1f)
    {
        if (f(x) * f(x + 0.1f) < 0)
        {
            l = x;
            r = x + 0.1f;
            break;
        }
    }

    if (l != LLONG_MIN && r != LLONG_MIN)
    {
        float root = Bisection(l, r);
        cout << "Root (Improved Approach): " << root << '\n';
    }
    else
    {
        cout << "No root found in [" << iniL << ", " << iniR << "]\n";
    }
}

int main()
{
    TraditionalApproach();
    ImprovedApproach();
    return 0;
}
