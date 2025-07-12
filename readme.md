## 1. Better approach to choose the range in the bisection method

Instead of manually choosing a large interval, automatically scan the function domain in small steps to detect sub-intervals where the function changes sign  \(f(x)*f(x+1)<0). it will find a possible interval where a root is abailbale 
This small inteval can be use in the main bisection function to find the root it will minimize the itration form the traditional bisection method approach.

---

## 2. Application of techniques and comparison

- **i) Traditional bisection method:**  
  Uses a manually chosen interval \([0, 10]\). Since this interval is large, it requires approximately 24 iterations to reach the desired tolerance (1e-6).

- **ii) Improved bisection implementation:**  
  Automatically detects a smaller sub-interval (around length 0.1) within \([0, 10]\) where the function changes sign. Applying bisection on this smaller interval requires about 17 iterations to achieve the same tolerance.

---

## 3. Performance comparison (Number of iterations)

| Approach              | Initial Interval Length | Approximate Iterations to Tolerance (1e-6) |
|-----------------------|-------------------------|---------------------------------------------|
| Traditional           | 10                      | ~24                                         |
| Improved (auto detect)| 0.1                     | ~17      