
# Ensure the year_focus variable is set to the desired year
year_focus <- 2015

# Filter the data for the selected year
CBC_year <- joined_full_data_set %>%
  filter(time == year_focus)

# Reordering the ref_area based on the Collective Bargaining Coverage
CBC_year <- CBC_year %>%
  mutate(ref_area = fct_reorder(ref_area, `Collective Bargaining Coverage`))

# Comparative plot
ggplot(CBC_year, aes(x = ref_area, y = `Collective Bargaining Coverage`)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = paste("Comparative Analysis of Collective Bargaining Coverage in", year_focus),
       x = "Country",
       y = "Collective Bargaining Coverage") +
  theme_minimal()


library(ggplot2)
library(dplyr)
library(forcats)

# Looping through each year from 2010 to 2020
for (year_focus in 2015:2020) {
  # Filter the data for the selected year
  CBC_year <- joined_full_data_set %>%
    filter(time == year_focus)
  
  # Reordering the ref_area based on the Collective Bargaining Coverage
  CBC_year <- CBC_year %>%
    mutate(ref_area = fct_reorder(ref_area, `Collective Bargaining Coverage`))
  
  # Comparative plot
  plot <- ggplot(CBC_year, aes(x = ref_area, y = `Collective Bargaining Coverage`)) +
    geom_bar(stat = "identity") +
    coord_flip() +
    labs(title = paste("Comparative Analysis of Collective Bargaining Coverage in", year_focus),
         x = "Country",
         y = "Collective Bargaining Coverage") +
    theme_minimal()
  
  # Print the plot
  print(plot)
}