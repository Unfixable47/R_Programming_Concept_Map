library(tidyverse)
library(dplyr)
library(purrr)

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

walk(model_summaries$summary, print)


library(knitr)
library(highr)
library(evaluate)
library(xfun)
setwd("~/Lab1/Exercises/")
knit("mtcarsadd.Rnw")
