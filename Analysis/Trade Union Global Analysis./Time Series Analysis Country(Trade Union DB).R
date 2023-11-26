# Select a country for the analysis, e.g., "United States"
country_focus <- "United States"

# Filter the data for the selected country
TUD_country <- TradeUnionDensity %>%
  filter(Country == country_focus)

# Plotting the trend of Union Density over time
ggplot(TUD_country, aes(x = Time, y = Value)) +
  geom_line() +
  labs(title = paste("Time Series of Union Density in", country_focus),
       x = "Time",
       y = "Union Density") +
  theme_minimal()

#filter Data 
TUDR_Country <- TUDR %>% 
  filter(ref_area == country_focus)

#Trade Union Density sourced: ILO data in a viz
ggplot(TUDR_Country, aes(x = time, y = obs_value)) +
  geom_line() +
  labs(title = paste("(ILOdata)Time Series of Trade Union Density in", country_focus),
       x = "Time",
       y = "(ILOdata)Trade Union Density") +
  theme_minimal()



#filter Data 
CBCR_Country <- CBCR %>% 
  filter(ref_area == country_focus)

#Collective Bargaining Coverage sourced: ILO
ggplot(CBCR_Country, aes(x = time, y = obs_value)) +
  geom_line() +
  labs(title = paste("(ILOdata)Collective Bargaining Coverage Over Time", country_focus),
       x = "Time",
       y = "(ILOdata)Collective bargaining coverage") +
  theme_minimal()


#filter Data 
WorkplaceRights_Country <- WorkplaceRights %>% 
  filter(ref_area == country_focus)

#Compliance with international law
ggplot(WorkplaceRights_Country, aes(x = time, y = obs_value)) +
  geom_line() +
  labs(title = paste("(ILOdata)Complaince wth International Labor Law Over Time", country_focus),
       x = "Time",
       y = "(ILOdata)Collective bargaining coverage") +
  theme_minimal()

