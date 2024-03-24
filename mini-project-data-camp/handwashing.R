library(tidyverse)
library(dplyr)
library(readr)

yearly <- read.csv("~/datasets/yearly_deaths_by_clinic.csv")

print(yearly)

yearly <- yearly %>%
  mutate(proportions_deaths = death / births)

print(yearly)

yearly %>%
  group_by(clinic) %>%
  ggplot(mapping = aes(x = "year", y = "proportions_deaths", color = clinic)) +
  geom_line()

# Read datasets/monthly_deaths.csv into monthly
monthly <- read.csv("datasets/monthly_deaths.csv")

# Adding a new column with proportion of deaths per no. births
monthly <- monthly %>%
  mutate(proportions_deaths = death / births)

# Print out the first rows in monthly
monthly


ggplot(monthly, aes(x = date, y = proportion_deaths))


handwashing_start <- as.Date("1847-06-01")

monthly <- monthly %>%
  mutate(handwashing_started = date >= handwashing_start)

ggplot(monthly, aes(
  x = date, y = proportion_deaths,
  color = handwashing_started
)) +
  geom_line()

# before and after handwashing.

monthly_summary <- monthly %>%
  group_by(handwashing_started) %>%
  summarize(
    proportion_deaths_mean =
      mean(proportion_deaths)
  )
# .... YOUR CODE FOR TASK 7 HERE ....

# Printing out the summary.
monthly_summary

# Calculating a 95% Confidence intrerval using t.test
test_result <- t.test(proportion_deaths ~ handwashing_started, data = monthly)
test_result
