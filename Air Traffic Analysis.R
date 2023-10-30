# Load necessary libraries
library(dplyr)

# Setting a seed for reproducibility
set.seed(123)

# Number of data points (flights)
n <- 1000

# Generate data
flights_data <- data.frame(
  FlightID = seq(1, n),
  Date = sample(seq(as.Date('2023-01-01'), as.Date('2023-01-31'), by="day"), n, replace = TRUE),
  Origin = sample(c("JFK", "LAX", "SEA", "ORD", "DFW", "ATL"), n, replace = TRUE),
  Destination = sample(c("LHR", "CDG", "NRT", "SYD", "GRU", "DXB"), n, replace = TRUE),
  Carrier = sample(c("AirlineA", "AirlineB", "AirlineC", "AirlineD"), n, replace = TRUE),
  Duration = sample(60:600, n, replace = TRUE), # Flight duration from 1 hour to 10 hours
  Delay = sample(-20:120, n, replace = TRUE), # Delay from -20 mins (early) to 120 mins (2 hours delay)
  Passengers = sample(50:400, n, replace = TRUE) # Passengers from 50 to 400 per flight
)

# Check the first few rows of the dataset
head(flights_data)



flights_data %>% 
  mutate(Flgiht_Status =if_else(Delay < -15, "Early",
                                if_else(Delay <= 15,"On Time")) )