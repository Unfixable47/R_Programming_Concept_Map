library(tidyverse)
library(RSQLite)
library(DBI)
library(ggplot2)
library(dplyr)
library(forcats)


setwd("~/workbook")

con <- dbConnect(RSQLite::SQLite(),"trade_union_data.db")

TUDR <- as_tibble(dbReadTable(con,"TUDR"))
CBCR <- as_tibble(dbReadTable(con,"CBCR"))
CollectiveBargaining <- as_tibble(dbReadTable(con,"CollectiveBargaining"))
TradeUnionDensity <- as_tibble(dbReadTable(con,"TradeUnionDensity"))
WorkplaceRights <- as_tibble(dbReadTable(con,"WorkplaceRights"))

dbDisconnect(con)


CollectiveBargaining %>% 
  group_by(Country) %>% 
  summary()

CBCR %>% 
  select(ref_area,time,obs_value) %>% 
  group_by(ref_area) %>%
  summary()

TUDR %>% 
  select(ref_area,time,obs_value) %>% 
  group_by(ref_area) %>% 
  summary()

TradeUnionDensity %>% 
  select(Country,Time,Value) %>% 
  group_by(Country) %>% 
  summary()

WorkplaceRights %>%
  select(ref_area, time, obs_value) %>% 
  group_by(ref_area) %>% 
  summary()

library(ggplot2)
library(dplyr)


CollectiveBargaining %>%
  mutate(Country = fct_reorder(Country, Country, .fun = length)) %>%
  ggplot(aes(x = Country)) +
  geom_bar() +
  coord_flip()  # Optional: flip coordinates to make it horizontal

  
CollectiveBargaining %>%
    mutate(Year = factor(Year),  # Convert Year to a factor
           Year = fct_infreq(Year)) %>%  # Reorder factor levels based on frequency
    ggplot(aes(x = Year)) +
    geom_bar()+
  coord_flip()
  
  
CollectiveBargaining %>% 
  filter(Country == "United States") %>% 
  count()
# counts how many times the "United State data point is found in a column it was found 21 times"

CollectiveBargaining %>% 
  filter(Year == "2015") %>% 
  count()

CollectiveBargaining %>% 
  distinct(Country, .keep_all = TRUE) %>% 
  count()

CollectiveBargaining %>% 
  distinct(Year, .keep_all = TRUE) %>% 
  count()

WorkplaceRights %>% 
  filter(time == "2021",obs_value > 5.0) %>% 
  ggplot(aes(x = ref_area, y = obs_value))+
  geom_point()+
  coord_flip()

WorkplaceRights %>% 
  filter(time == "2021",obs_value < 5.0) %>% 
  ggplot(aes(x = ref_area, y = obs_value))+
  geom_point()+
  coord_flip()

WorkplaceRights %>% 
  filter(time == "2021",obs_value == 0) %>% 
  View()

WorkplaceRights %>% 
  filter(time == "2021",obs_value == 0) %>% 
  count()
#14 out of the 39 counties are in compliance with international labor law 


# This data need to be joined with Collective Bargaining table left join on the
# mentioned table, as it contains a larger set of data than Collective
# Bargaining


# Count distinct values
count_CollectiveBargaining <- CollectiveBargaining %>% distinct(Country, .keep_all = TRUE) %>% count() %>% pull(n)
count_CBCR <- CBCR %>% distinct(ref_area, .keep_all = TRUE) %>% count() %>% pull(n)
count_TUDR <- TUDR %>% distinct(ref_area, .keep_all = TRUE) %>% count() %>% pull(n)
count_TradeUnionDensity <- TradeUnionDensity %>% distinct(Country, .keep_all = TRUE) %>% count() %>% pull(n)
count_WorkplaceRights <- WorkplaceRights %>% distinct(ref_area, .keep_all = TRUE) %>% count() %>% pull(n)

# Combine into a named vector
counts <- c(CollectiveBargaining = count_CollectiveBargaining,
            CBCR = count_CBCR,
            TUDR = count_TUDR,
            TradeUnionDensity = count_TradeUnionDensity,
            WorkplaceRights = count_WorkplaceRights)

# Convert to a tibble
counts_tibble <- tibble(Dataset = names(counts), Countrycount = counts)


#below is the combined data set for year

YearCount_WorkplaceRights <- WorkplaceRights %>% 
  distinct(time, .keep_all = TRUE) %>% 
  count() %>% 
  pull(n)

YearCount_TradeUnionDensity <- TradeUnionDensity %>% 
  distinct(Time, .keep_all = TRUE) %>% 
  count() %>% 
  pull(n)

YearCount_TUDR <- TUDR %>% 
  distinct(time, .keep_all = TRUE) %>% 
  count() %>% 
  pull(n)

YearCount_CBCR <- CBCR %>% 
  distinct(time, .keep_all = TRUE) %>% 
  count() %>% 
  pull(n)

YearCount_CollectiveBargaining <- CollectiveBargaining %>% 
  distinct(Year, .keep_all = TRUE) %>% 
  count() %>% 
  pull(n)

# Combine into a tibble
YearCounts_tibble <- tibble(
  Dataset = c("WorkplaceRights", "TradeUnionDensity", "TUDR", "CBCR", "CollectiveBargaining"),
  YearCount = c(YearCount_WorkplaceRights, YearCount_TradeUnionDensity, YearCount_TUDR, YearCount_CBCR, YearCount_CollectiveBargaining)
)

# Display the tibble
print(YearCounts_tibble)
print(counts_tibble)

combinedtibble <- bind_rows(counts_tibble,YearCounts_tibble)

print(combinedtibble)

#the more comprehensive data sets from this data base is TUDR, CBCR, workplace
#rights. (unsurprising because these where sources directly from the ILO's
#website)



TUDR_2017 <- TUDR %>% 
  filter(time == 2017)

CBCR_2017 <- CBCR %>% 
  filter(time == 2017)

WorkplaceRights_2017 <- WorkplaceRights %>% 
  filter(time == 2017)


joined_data <- inner_join(WorkplaceRights_2017, TUDR_2017, by = c("ref_area", "time"))

# View the structure of the combined data
str(joined_data)
View(joined_data)

joined_data2017 <- inner_join(joined_data, CBCR, by = c("ref_area","time"))

View(joined_data2017)


joined_data2017 <- joined_data2017 %>% 
  rename("FACB" = obs_value.x,
         "Collective Bargaining Coverage" = obs_value.y,
         "Union Density"  = obs_value
           )

joined_data2017 %>% 
  select(FACB,`Collective Bargaining Coverage`)


#below is the data exploration


joined_data2017 %>%
  select(FACB, `Collective Bargaining Coverage`) %>%
  cor(use = "complete.obs") # Handling missing values by excluding them


ggplot(joined_data2017, aes(x = FACB, y = `Collective Bargaining Coverage`)) +
  geom_point() +
  theme_minimal() +
  labs(x = "FACB", y = "Collective Bargaining Coverage", title = "Scatter Plot between FACB and Collective Bargaining Coverage")



model <- lm(`Collective Bargaining Coverage` ~ FACB, data = joined_data2017)
summary(model)


