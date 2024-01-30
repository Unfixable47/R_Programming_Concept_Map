```
Absolutely, I'd be happy to provide an exercise involving the `mtcars` dataset in R. This dataset is a classic in R and great for practicing data manipulation and analysis. Here's a beginner to intermediate level exercise for you:

### Exercise: Analyzing the `mtcars` Dataset in R

**Objective:** Explore the relationship between miles per gallon (mpg) and other variables in the dataset.

**Tasks:**

1. **Load the `mtcars` Dataset:**
   - Start by loading the `mtcars` dataset into R. This dataset comes pre-loaded in R, so you don't need to download it from anywhere. Just use `data(mtcars)` to load it.

2. **Basic Exploration:**
   - Display the first few rows of the dataset using the `head()` function.
   - Use the `summary()` function to get a summary of the dataset.

3. **Data Analysis:**
   - Create a new column in the dataset that categorizes cars into "High MPG" and "Low MPG" based on whether their mpg is above or below the median mpg of all cars in the dataset. You can use the `ifelse()` function for this.

4. **Visualization:**
   - Plot a histogram of mpg to see its distribution.
   - Create a scatter plot to examine the relationship between mpg and weight (`wt`). 
   - Bonus: Color the points in your scatter plot based on the "High MPG" and "Low MPG" categorization.

5. **Advanced Analysis (Optional):**
   - Perform a linear regression analysis to study the relationship between mpg (as the dependent variable) and other variables like weight (`wt`), horsepower (`hp`), and number of cylinders (`cyl`). Use the `lm()` function for this.
   - Summarize your linear regression model using the `summary()` function and interpret the results.

6. **Reflection:**
   - Write a brief summary of your findings. Which variables seem to affect mpg the most? Were there any surprises in your analysis?

**Deliverables:**
- R script with your code and comments explaining each step.
- A brief report summarizing your findings.

This exercise will help you practice data manipulation, conditional operations, basic plotting, and simple linear regression in R. It's a great way to get comfortable with some of the core functionalities of R using a well-known dataset. Remember, the best way to learn is by doing, so feel free to experiment with the data beyond the tasks listed here!
```

library(tidyverse)
library(dplyr)

mtcars <- mtcars

head(mtcars)

mtcars %>%
  summary()

mtcars <- mtcars %>%
  mutate(mpg_category = ifelse(mpg > 20.09, "High MPG", "Low MPG"))

hist(mtcars$mpg)
plot(mtcars$wt, mtcars$mpg)

library(tidyverse)
# Define the independent variables
independent_vars <- c("hp", "cyl", "drat", "qsec", "vs", "carb")
# Create a list of formulas
formulas <- lapply(
  independent_vars,
  function(var) as.formula(paste("mpg ~", var))
)
# Use map() to apply lm() to each formula
models <- map(formulas, ~ lm(data = mtcars, formula = .))
# Create a tibble with model summaries
model_summaries <- tibble(variable = independent_vars, model = models) %>%
  mutate(summary = map(model, summary))
# View the tibble
print(model_summaries)

# Extract and print the summary
# for the model with 'hp' as the independent variable
hp_model_summary <- model_summaries %>%
  filter(variable == "hp") %>%
  pull(summary)
# Display the summary
print(hp_model_summary)
