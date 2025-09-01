## **Bisection Method**

The **Bisection Method** is used to find a **root** of a continuous function f(x)f(x)f(x) in an interval [a,b][a, b][a,b] where

$f(a) \cdot f(b) < 0$

This condition ensures that the function changes sign over the interval, so by the **Intermediate Value Theorem**, a root exists within [a,b][a, b][a,b].

$c = \frac{a+b}{2}$


$$
|c_n - c_{n-1}| < \text{tolerance}
$$


```
#include <bits/stdc++.h>

using namespace std;

double f(double x)

{

    return (x * x * x - x - 2);

}

  

int main()

{

    double a = 1, b = 2;

    double tol = 0.001;

  

    double error = fabs(b - a);

    while (error >= tol)

    {

  

        double c = (a + b) / 2.0;

        error = fabs(a - b);

        cout << a << " " << b << " " << c << " " << error << endl;

        if (f(a) * f(c) <= 0)

        {

            b = c;

        }

        else

        {

            a = c;

        }

    }

}
```



FalsyMethod
/
```
#include <bits/stdc++.h>
using namespace std;

double f(double x)
{
    return x * x * x - x - 2;
}

  

int main()

{
    double a = 1, b = 2;
    double tol = 0.001; 
    double c_old = a;  
    double c;          
    double ea = 100;   
    int iter = 1;
    cout << "Iter\ta\tb\tc\tf(c)\tApproxError(%)\n";

  

    while (ea > tol)

    {

        c = b - (f(b) * (a - b)) / (f(a) - f(b)); 

        double fc = f(c);

  

        // Calculate approximate relative error

        if (iter > 1)

            ea = fabs((c - c_old) / c) * 100;

        cout << iter << "\t" << fixed << setprecision(6)
                     << a << "\t" << b << "\t" << c << "\t" << fc << "\t" << ea << endl;
             
        if (fabs(fc) < tol)

            break;

  

        // Update interval

        if (f(a) * fc < 0)

        {

            b = c;

        }

        else

        {

            a = c;

        }

  

        c_old = c; // update previous approximation

        iter++;

    }

  

    cout << "\nApproximate root: " << c << endl;

  

    return 0;

}
```

//newton rapson


```
#include <bits/stdc++.h>

using namespace std;

  

// Function

double f(double x)

{

    return x * x * x - x - 2;

}

  

// Derivative

double df(double x)

{

    return 3 * x * x - 1;

}

  

int main()

{

    double x0 = 1.5;    // initial guess

    double tol = 0.001; // tolerance

    double x1;          // next approximation

    double ea = 100;    // approximate error (%)

    int iter = 1;

  

    cout << "Iter\tx0\tx1\tf(x1)\tea(%)\n";

  

    while (ea > tol)

    {

        x1 = x0 - f(x0) / df(x0); // Newton-Raphson formula

     
        if (iter > 1)

            ea = fabs((x1 - x0) / x1) * 100;

  

        cout << iter << "\t" << fixed << setprecision(6)

             << x0 << "\t" << x1 << "\t" << fx1 << "\t" << ea << endl;

  
  
  

        x0 = x1;

        iter++;

    }

  

    cout << "\nApproximate root: " << x1 << endl;

  

    return 0;

}
```


$$
f[x_i] = y_i
$$

$$
f[x_i, x_{i+1}, \dots, x_{i+k}] 
= \frac{f[x_{i+1}, \dots, x_{i+k}] - f[x_i, \dots, x_{i+k-1}]}{x_{i+k} - x_i}
$$

$$
P_{n-1}(x) = f[x_0] 
+ f[x_0, x_1](x - x_0) 
+ f[x_0, x_1, x_2](x - x_0)(x - x_1) 
+ \dots 
+ f[x_0, x_1, \dots, x_{n-1}] \prod_{j=0}^{n-2} (x - x_j)
$$


```
#include <bits/stdc++.h>
using namespace std;

double dividedDifference(vector<double> x, vector<double> y, int n, double value) {
    // Create a 2D table for divided differences
    vector<vector<double>> table(n, vector<double>(n));

    // First column is y values
    for(int i = 0; i < n; i++)
        table[i][0] = y[i];

    // Fill the table
    for(int j = 1; j < n; j++) {
        for(int i = 0; i < n - j; i++) {
            table[i][j] = (table[i+1][j-1] - table[i][j-1]) / (x[i+j] - x[i]);
        }
    }

    // Evaluate the Newton polynomial at 'value'
    double result = table[0][0];
    double prod = 1.0;
    for(int i = 1; i < n; i++) {
        prod *= (value - x[i-1]);
        result += table[0][i] * prod;
    }

    return result;
}

int main() {
    vector<double> x = {1, 2, 3};
    vector<double> y = {1, 4, 9};
    int n = x.size();

    double val = 2.5;
    double result = dividedDifference(x, y, n, val);

    cout << "P(" << val << ") = " << result << endl;

    return 0;
}

```


Lagrange Interpollation

$$
P(x) = \sum_{i=0}^{n-1} y_i \, L_i(x)
$$

$$
L_i(x) = \prod_{\substack{j=0 \\ j \neq i}}^{n-1} 
\frac{x - x_j}{x_i - x_j}
$$



%% --- 1st Order (2 points → line) ---
$$
P(x) = 
y_0 \, \frac{x - x_1}{x_0 - x_1} 
+ y_1 \, \frac{x - x_0}{x_1 - x_0}
$$

%% --- 2nd Order (3 points → parabola) ---
$$
P(x) = 
y_0 \, \frac{(x - x_1)(x - x_2)}{(x_0 - x_1)(x_0 - x_2)}
+ y_1 \, \frac{(x - x_0)(x - x_2)}{(x_1 - x_0)(x_1 - x_2)}
+ y_2 \, \frac{(x - x_0)(x - x_1)}{(x_2 - x_0)(x_2 - x_1)}
$$

 3rd Order (4 points → cubic) 

$$
\begin{aligned}
P(x) = & \; y_0 \, 
\frac{(x - x_1)(x - x_2)(x - x_3)}{(x_0 - x_1)(x_0 - x_2)(x_0 - x_3)} \\[6pt]
&+ y_1 \, \frac{(x - x_0)(x - x_2)(x - x_3)}{(x_1 - x_0)(x_1 - x_2)(x_1 - x_3)} \\[6pt]
&+ y_2 \, \frac{(x - x_0)(x - x_1)(x - x_3)}{(x_2 - x_0)(x_2 - x_1)(x_2 - x_3)} \\[6pt]
&+ y_3 \, \frac{(x - x_0)(x - x_1)(x - x_2)}{(x_3 - x_0)(x_3 - x_1)(x_3 - x_2)}
\end{aligned}
$$

```
#include <bits/stdc++.h>
using namespace std;

// Function for Lagrange interpolation
double lagrangeInterpolation(vector<double> x, vector<double> y, int n, double value) {
    double result = 0.0;

    for (int i = 0; i < n; i++) {
        double term = y[i];  // Start with y[i]
        for (int j = 0; j < n; j++) {
            if (i != j) {
                term *= (value - x[j]) / (x[i] - x[j]);
            }
        }
        result += term;  
    }

    return result;
}

int main() {
    // Example: quadratic interpolation (2nd order)
    vector<double> x = {1, 2, 3};
    vector<double> y = {1, 4, 9};  // y = x^2
    int n = x.size();

    double val = 2.5;  // Value to interpolate
    double result = lagrangeInterpolation(x, y, n, val);

    cout << "P(" << val << ") = " << result << endl;

    return 0;
}

```
