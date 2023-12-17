Sure, here's an exercise that can help you understand loops in R, specifically focusing on the `for` loop.

### Exercise: Sum of Squares

**Objective**: Write a program in R that calculates the sum of squares of the first N natural numbers.

1. **User Input**: Start by asking the user to input a number N.
2. **Initialization**: Initialize a variable `sum` to 0. This will hold the sum of squares.
3. **For Loop**: Use a `for` loop to iterate from 1 to N.
4. **Calculation**: In each iteration, square the current number and add it to `sum`.
5. **Output**: After the loop, print the final value of `sum`.

**Expected Output**: If the user inputs 5, the program should output 55, as 1^2 + 2^2 + 3^2 + 4^2 + 5^2 = 55.

This exercise will teach you how to implement a `for` loop, perform calculations within a loop, and use variables to store and update results. Remember, in R, you can use the `^` operator for exponentiation.
Certainly! To create a script in R that generates a tibble (from the `tibble` package, which is part of the `tidyverse`) for the exercise question, you'll first need to ensure you have the necessary packages installed and loaded. The script will:

1. Prompt the user for input (N).
2. Generate a tibble containing two columns: one for the natural numbers from 1 to N and another for their squares.
3. Calculate the sum of squares and add it as an extra row in the tibble.

Here's how the script might look:

```R
# Load necessary library
if (!require(tibble)) install.packages("tibble")
library(tibble)

# Function to create tibble and calculate sum of squares
create_sum_of_squares_tibble <- function(N) {
  # Create a sequence from 1 to N
  numbers <- 1:N

  # Calculate squares
  squares <- numbers^2

  # Create tibble
  sum_squares_tibble <- tibble(Number = numbers, Square = squares)

  # Calculate sum of squares
  sum_of_squares <- sum(squares)

  # Add sum of squares as a new row
  sum_squares_tibble <- add_row(sum_squares_tibble, Number = NA, Square = sum_of_squares)

  return(sum_squares_tibble)
}

# User input
N <- as.integer(readline(prompt = "Enter a number N: "))

# Generate and print tibble
result_tibble <- create_sum_of_squares_tibble(N)
print(result_tibble)
```

In this script:

- The function `create_sum_of_squares_tibble` takes an integer `N` and returns a tibble.
- `numbers` is a sequence from 1 to N.
- `squares` contains the squares of these numbers.
- `sum_squares_tibble` is the tibble created with these two vectors.
- `sum_of_squares` calculates the sum of the squares and is added as an extra row.
- The script prompts the user for `N` and then calls the function to create and print the tibble.