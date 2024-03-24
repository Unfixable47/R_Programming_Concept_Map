# Load package
library(readr)
library(dplyr)
library(tidyverse)
library(ggplot2)


# Load dataset
by_tag_year <- read_csv("~/datasets/by_tag_year.csv")
# Inspect the dataset
print(by_tag_year)


# Add fraction column
by_tag_year_fraction <- by_tag_year %>%
  mutate(fraction = number / year_total)
# Print the new table
print(by_tag_year_fraction$fraction)


# Print the new table
print(by_tag_year_fraction)
r_over_time <- by_tag_year_fraction %>%
  filter(tag == "r")
print(r_over_time)


library(ggplot2)
r_over_time %>%
  ggplot(aes(x = year, y = fraction)) +
  geom_line()
print(r_over_time)


selected_tags <- c("r", "dplyr", "ggplot2")
selected_tags_over_time <- by_tag_year_fraction %>%
  filter(tag %in% selected_tags)
selected_tags_over_time %>%
  ggplot(mapping = aes(
    x = year,
    y = fraction,
    color = tag
  )) +
  geom_line()


sorted_tags <- by_tag_year %>%
  group_by(tag) %>%
  summarize(tag_total = sum(number)) %>%
  arrange(desc(tag_total))
print(sorted_tags)


highest_tags <- head(sorted_tags$tag)

# Filter for the six largest tags
by_tag_subset <- by_tag_year_fraction %>%
  filter(tag %in% highest_tags)

by_tag_subset %>%
  ggplot(mapping = aes(x = year, y = fraction, color = tag)) +
  geom_line()

# Get tags of interest
my_tags <- c("android", "ios", "windows-phone")

# Filter for those tags
by_tag_subset <- by_tag_year_fraction %>%
  filter(tag %in% my_tags)

by_tag_subset %>%
  ggplot(mapping = aes(x = year, y = fraction, color = tag)) +
  geom_line()
