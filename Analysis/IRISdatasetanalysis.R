library(ggplot2)
library(dplyr)


iris <- iris


tapply(iris$Sepal.Length, iris$Species, mean)

tapply(iris$Sepal.Width, iris$Species, mean)

average_petal_length <- tapply(iris$Petal.Length, iris$Species, mean)

tapply(iris$Petal.Width, iris$Species, mean)


tapply(iris$Sepal.Length, iris$Species, median)

tapply(iris$Sepal.Width, iris$Species, median)

tapply(iris$Petal.Length, iris$Species, median)

tapply(iris$Petal.Width, iris$Species, median)


tapply(iris$Petal.Width, iris$Species, range)




iris_summary <- iris %>%
  group_by(Species) %>%
  summarize(
    Mean_Sepal.Length = mean(Sepal.Length),
    Median_Sepal.Length = median(Sepal.Length),
    Min_Sepal.Length = min(Sepal.Length),
    Max_Sepal.Length = max(Sepal.Length),
    
    Mean_Sepal.Width = mean(Sepal.Width),
    Median_Sepal.Width = median(Sepal.Width),
    Min_Sepal.Width = min(Sepal.Width),
    Max_Sepal.Width = max(Sepal.Width),
    
    Mean_Petal.Length = mean(Petal.Length),
    Median_Petal.Length = median(Petal.Length),
    Min_Petal.Length = min(Petal.Length),
    Max_Petal.Length = max(Petal.Length),
    
    Mean_Petal.Width = mean(Petal.Width),
    Median_Petal.Width = median(Petal.Width),
    Min_Petal.Width = min(Petal.Width),
    Max_Petal.Width = max(Petal.Width)
  )

print(iris_summary)


Sepal1 <- iris_summary %>% 
  ggplot(aes(x = Species, y = Mean_Sepal.Length, fill = Species)) + 
  geom_bar(stat = "identity", position = "dodge")

Sepal2 <- iris_summary %>% 
  ggplot(aes(x = Species, y = Median_Sepal.Length, fill = Species)) + 
  geom_bar(stat = "identity", position = "dodge")

Sepal3 <- iris_summary %>% 
  ggplot(aes(x = Species, y = Min_Sepal.Length, fill = Species)) + 
  geom_bar(stat = "identity", position = "dodge")

Sepal4 <- iris_summary %>% 
  ggplot(aes(x = Species, y = Max_Sepal.Length, fill = Species)) + 
  geom_bar(stat = "identity", position = "dodge")


Sepal_Length_Plot <- list(Sepal1,Sepal2,Sepal3, Sepal4)



library(dplyr)
library(ggplot2)
library(tidyr)

iris <- iris

#Creating the Summary Data

iris_summary <- iris %>%
  group_by(Species) %>%
  summarize(
    Mean_Sepal.Length = mean(Sepal.Length),
    Median_Sepal.Length = median(Sepal.Length),
    Min_Sepal.Length = min(Sepal.Length),
    Max_Sepal.Length = max(Sepal.Length),
    
    Mean_Sepal.Width = mean(Sepal.Width),
    Median_Sepal.Width = median(Sepal.Width),
    Min_Sepal.Width = min(Sepal.Width),
    Max_Sepal.Width = max(Sepal.Width),
    
    Mean_Petal.Length = mean(Petal.Length),
    Median_Petal.Length = median(Petal.Length),
    Min_Petal.Length = min(Petal.Length),
    Max_Petal.Length = max(Petal.Length),
    
    Mean_Petal.Width = mean(Petal.Width),
    Median_Petal.Width = median(Petal.Width),
    Min_Petal.Width = min(Petal.Width),
    Max_Petal.Width = max(Petal.Width)
  )

# Making the data long format
iris_summary_long <- iris_summary %>%
  pivot_longer(cols = contains("Sepal.Length"), 
               names_to = "Statistic", 
               values_to = "Value")

iris_summary_long2 <- iris_summary %>%
  pivot_longer(cols = contains("Sepal.Width"), 
               names_to = "Statistic", 
               values_to = "Value")

iris_summary_long3 <- iris_summary %>%
  pivot_longer(cols = contains("Petal.Length"), 
               names_to = "Statistic", 
               values_to = "Value")

iris_summary_long4 <- iris_summary %>%
  pivot_longer(cols = contains("Petal.Width"), 
               names_to = "Statistic", 
               values_to = "Value")


iris_summary_long5 <- iris_summary %>%
  pivot_longer(cols = matches("(Sepal.Width|Petal.Width)"), 
               names_to = "Statistic", 
               values_to = "Value")


# Plotting the data
Sepal_Length_Plot <-
  ggplot(data = iris_summary_long, aes(x = Species, y = Value, fill = Species)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap( ~ Statistic, scales = "free") +
  labs(y = "Sepal Length")

print(Sepal_Length_Plot)


Sepal_Width_Plot <-
  ggplot(data = iris_summary_long2, aes(x = Species, y = Value, fill = Species)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ Statistic, scales = "free") +
  labs(y = "Sepal Width")

print(Sepal_Width_Plot)

Petal_Length_Plot <-
  ggplot(data = iris_summary_long3, aes(x = Species, y = Value, fill = Species)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ Statistic, scales = "free") +
  labs(y = "Petal Length")

print(Petal_Length_Plot)

Petal_Width_Plot <-
  ggplot(data = iris_summary_long4, aes(x = Species, y = Value, fill = Species)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ Statistic, scales = "free") +
  labs(y = "Petal Width")



IrisHistogram <- list(Sepal_Length_Plot, Sepal_Width_Plot, Petal_Length_Plot, Petal_Width_Plot)
print(Petal_Width_Plot )


print("Virginca has the highest Average Petal Length")


iris %>% 
  ggplot(aes(x = Sepal.Length, y = Petal.Length)) + 
  geom_point(mapping = aes(color = Species))+
  geom_smooth(method = "lm", se = FALSE, aes(group = 1))

iris %>% 
  ggplot(aes(x = Sepal.Width, y = Species))+
  geom_boxplot(mapping = aes(color = Species))


iris %>%
  ggplot(aes(x = Sepal.Width, y = factor(Species, levels = c("versicolor", "virginica", "setosa")))) +
  geom_boxplot(aes(color = Species))+
  labs(y = "sepal width for each species using a boxplot")



