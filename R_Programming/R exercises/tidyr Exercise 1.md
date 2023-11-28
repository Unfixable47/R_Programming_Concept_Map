here's an exercise focusing on the `tidyr` library in R, which is designed for tidying your data. For this exercise, you'll work with the `gather()`/`pivote_longer()`, `spread()`/`pivote_wider()`, `separate()`, and `unite()` functions, which are useful for converting between wide and long formats and for manipulating column values.

### Background:
Suppose you have a dataset named `sales_data` that tracks monthly sales figures for different products across several years in a wide format. Each row represents a product, and each column contains the sales for a month in a specific year (e.g., `Jan_2020`, `Feb_2020`, etc.).

### Dataset Structure:

Here's a hypothetical structure of the `sales_data` dataset:

```r
sales_data <- tibble(
  ProductID = 1:5,
  ProductName = c("Widget", "Gadget", "Doohickey", "Thingamabob", "Whatsit"),
  Jan_2020 = sample(100:200, 5),
  Feb_2020 = sample(100:200, 5),
  Mar_2020 = sample(100:200, 5),
  Jan_2021 = sample(100:200, 5),
  Feb_2021 = sample(100:200, 5),
  Mar_2021 = sample(100:200, 5)
)
```

### Tasks:

1. **Converting Wide to Long**: Use the `gather()` function to convert this wide-format table into a long-format table. The new table should have columns for `ProductID`, `ProductName`, `MonthYear`, and `Sales`.

2. **Converting Long Back to Wide**: After converting to long format, use the `spread()` function to return your long-format table to the original wide format.

3. **Separating Month and Year**: Use the `separate()` function on the `MonthYear` column in your long-format table to create separate `Month` and `Year` columns.

4. **Combining Month and Year**: Use the `unite()` function to reverse your previous `separate()` operation, combining the `Month` and `Year` columns back into a single `MonthYear` column.

### Bonus Task:

5. **Monthly Sales Analysis**: After separating `Month` and `Year`, use `dplyr` functions to find out which product had the highest average sales for each month regardless of the year.

### Example Code to Begin:

```r
# Load the necessary library
library(tidyr)
library(dplyr)

# Assuming you've already created the sales_data tibble as shown above
```

Remember, the `gather()` and `spread()` functions were superseded by `pivot_longer()` and `pivot_wider()` in recent versions of `tidyr`, but they still work and are useful to know, as many existing R codebases and tutorials use them. You may also want to explore their newer counterparts as a bonus.

task completed see: 
[Sales_Data_(tidyr).R](https://github.com/Unfixable47/R_Programming_Concept_Map/blob/main/Exercises/Sales_Data_(tidyr).R)

