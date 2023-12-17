library(tidyr)
library(dplyr)

# Revised dataset
book_ratings <- tibble(
  book_id = rep(1:4, each = 3),
  month = c(1, 2, 4, 1, 3, 4, 1, 3, NA, 2, 4, NA),
  rating = c(4, NA, 5, 3, NA, 4, NA, 5, 4, 3, NA, 4)
)

# Complete missing months
book_ratings_complete <- book_ratings %>%
  complete(book_id, month = 1:4)

print(book_ratings_complete)

# Fill missing ratings
book_ratings_filled <- book_ratings_complete %>%
  group_by(book_id) %>% # Ensure filling is done within each book
  fill(rating) %>%
  ungroup()

print(book_ratings_filled)

# Now, drop rows with NA (if this step is still required after filling)
book_rating_dropna <- book_ratings_filled %>%
  drop_na()

print(book_rating_dropna)
