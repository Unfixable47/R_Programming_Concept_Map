Absolutely, let's explore some additional `tidyr` functions and concepts through an exercise involving a dataset of book ratings. This exercise will focus on `complete()`, `drop_na()`, `fill()`, and `replace_na()` functions.

### Background:
You are given a dataset `book_ratings` that records the ratings given by readers to a variety of books in a small library. For some books, ratings are not available for certain months because no reviews were recorded.

### Dataset:

```r
# Load the libraries
library(tidyr)
library(dplyr)

# Create the dataset
book_ratings <- tibble(
  book_id = c(1, 1, 1, 2, 2, 3, 3, 3, 3),
  month = c(1, 2, 4, 2, 3, 1, 2, 3, 4),
  rating = c(4, NA, 5, 3, NA, 4, 5, NA, 4)
)
```

### Tasks:

1. **Filling Missing Months**: Use the `complete()` function to create entries for the missing months for each `book_id`. Assume that months run from 1 to 4 and that if a book has no entry for a month, it should still appear in the dataset with an `NA` rating.

2. **Dropping Missing Ratings**: Create a new version of the dataset without the `NA` ratings using the `drop_na()` function.

3. **Filling Missing Ratings**: Use the `fill()` function to fill in missing ratings for each book by carrying forward the last available rating. If the first rating is missing, carry the next available backward.

4. **Replacing `NA` with a Default Value**: Use the `replace_na()` function to replace all `NA` ratings with a default value of 3, which is the average historical rating of books.

### Bonus Task:

5. **Wide Format for Monthly Analysis**: Convert the dataset into a wide format where each row represents a book and each column represents a month. Use `pivot_wider()` to achieve this, and fill any missing values with the average rating for that book.

### Example Code to Begin:

```r
# Assuming the book_ratings tibble is already created

# Task 1: Complete the missing months for each book_id
book_ratings_complete <- book_ratings %>%
  complete(book_id, month = 1:4)

# Continue with tasks 2, 3, 4, and the bonus task as described above
```

Feel free to complete the exercise to practice manipulating and tidying data with `tidyr`. This exercise provides an excellent opportunity to familiarize yourself with these common data cleaning tasks.