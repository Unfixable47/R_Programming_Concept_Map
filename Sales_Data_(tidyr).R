# Load the necessary library
library(tidyverse)
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

head(sales_data)

# Assuming the tidyr package is installed and library(dplyr) has been loaded
long_sales_data <- sales_data %>%
  pivot_longer(
    cols = starts_with("Jan_") | starts_with("Feb_") | starts_with("Mar_"), # Select columns to pivot
    names_to = "MonthYear",    # Create a new 'MonthYear' column from the names of the pivoted columns
    values_to = "Sales"        # The new 'Sales' column will contain the values
  )

# View the result
View(long_sales_data)


wide_sales_data <- long_sales_data %>%
  pivot_wider(
    names_from = MonthYear,
    values_from = Sales
  )

# View the result
View(wide_sales_data)

#incorrect answer was the 'names = c()' which is the new vector being produced
#from splitting a vector
long_sales_data %>% 
  separate_wider_delim(cols = MonthYear,
                       delim = "_")

long_sales_data <- long_sales_data %>%
  separate(MonthYear, into = c("Month", "Year"), sep = "_")


#the correct most up to date method is more intuitive
long_sales_data_separate <- long_sales_data %>%
  separate_wider_delim(
    cols = MonthYear,
    delim = "_",
    names = c("Month", "Year")
  )

View(long_sales_data_separate)

long_sales_data <- long_sales_data %>% 
  unite(col = "YearMonth",
        sep = "_",
        Year:Month,
        remove = TRUE
       )

View(long_sales_data)


long_sales_data_separate %>% 
  group_by(Month) %>% 
  summarise(
    Total.Monthly.Sales = mean(Sales)
  )
