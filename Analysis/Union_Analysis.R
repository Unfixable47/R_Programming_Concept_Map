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

CollectiveBargaining %>%
  ggplot(mapping = aes(x = Country))+
  geom_bar()


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
    geom_bar()
  
  
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
  filter(time == "2021") %>% 
  ggplot(aes(x = ref_area, y = obs_value))+
  geom_point()+
  coord_flip()
# This data need to be joined with Collective Bargaining table left join on the
# mentioned table, as it contains a larger set of data than Collective
# Bargaining


