Linear regression models are used to predict the value of a dependent variable based on one or more independent variables, assuming a linear relationship between them. Here are different types of linear regression models, along with examples using either the `iris` dataset or other datasets readily available in R:

### 1. Simple Linear Regression
Used when there is one independent variable.

**Example with `mtcars` dataset**: Predicting miles per gallon (`mpg`) based on the weight of the car (`wt`).

```R
# Simple Linear Regression
model_simple <- lm(mpg ~ wt, data = mtcars)
summary(model_simple)
```

### 2. Multiple Linear Regression
Used when there are multiple independent variables.

**Example with `mtcars` dataset**: Predicting `mpg` based on `wt` (weight) and `hp` (horsepower).

```R
# Multiple Linear Regression
model_multiple <- lm(mpg ~ wt + hp, data = mtcars)
summary(model_multiple)
```

### 3. Polynomial Regression
Used when the relationship between independent and dependent variables is non-linear.

**Example with `iris` dataset**: Predicting petal length (`Petal.Length`) based on petal width (`Petal.Width`) using a 2nd-degree polynomial.

```R
# Polynomial Regression
model_poly <- lm(Petal.Length ~ poly(Petal.Width, 2), data = iris)
summary(model_poly)
```

### 4. Ridge Regression (L2 Regularization)
Useful when dealing with multicollinearity or overfitting.

**Example**: Since `iris` and `mtcars` are not ideal for demonstrating Ridge regression due to their simplicity, a synthetic dataset or a more complex dataset should be used. However, here’s a basic structure for Ridge regression:

```R
# Ridge Regression
library(glmnet)
x <- model.matrix(mpg ~ wt + hp, data = mtcars)[-1]
y <- mtcars$mpg
model_ridge <- glmnet(x, y, alpha = 0)
# View coefficients at a specific lambda value
predict(model_ridge, s = 0.01, type = "coefficients")
```

### 5. Lasso Regression (L1 Regularization)
Used for variable selection and regularization.

**Example**: Similar to Ridge regression, more complex data is better, but here's the basic structure:

```R
# Lasso Regression
model_lasso <- glmnet(x, y, alpha = 1)
predict(model_lasso, s = 0.01, type = "coefficients")
```

### 6. Elastic Net Regression
A blend of L1 and L2 regularization, used when there are multiple correlated features.

**Example**: As with Ridge and Lasso, a more complex dataset is ideal, but the code structure is:

```R
# Elastic Net Regression
model_elastic <- glmnet(x, y, alpha = 0.5)
predict(model_elastic, s = 0.01, type = "coefficients")
```

### Notes:
- The `iris` dataset is more suitable for classification problems rather than regression, but it can be used for simple linear regression and polynomial regression examples.
- For Ridge, Lasso, and Elastic Net regression, `glmnet` requires the `x` matrix to exclude the intercept, which is why `model.matrix()` is used and the first column is omitted (`[-1]`).
- The `mtcars` dataset is a better fit for regression examples. It contains various measurements of different car models, making it suitable for both simple and multiple linear regression.
- In real-world scenarios, you would use cross-validation (e.g., `cv.glmnet`) to find the optimal value of lambda (`λ`) for Ridge, Lasso, and Elastic Net regressions.
- Make sure to install and load the `glmnet` package (`install.packages("glmnet")`) to use Ridge, Lasso, and Elastic Net models.