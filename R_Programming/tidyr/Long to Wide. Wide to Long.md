### Question
[[tidyr Exercise 1]]

### Answer
```R programming
# Load the necessary library
library(tidyr)
library(dplyr)


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

# Assuming the tidyr package is installed and library(dplyr) has been loaded
long_sales_data <- sales_data %>%
  pivot_longer(
    cols = starts_with("Jan_") | starts_with("Feb_") | starts_with("Mar_"), # Select columns to pivot
    names_to = "MonthYear",    # Create a new 'MonthYear' column from the names of the pivoted columns
    values_to = "Sales"        # The new 'Sales' column will contain the values
  )

# View the result
print(long_sales_data)



wide_sales_data <- long_sales_data %>%
  pivot_wider(
    names_from = MonthYear,
    values_from = Sales
  )

print(wide_sales_data)

