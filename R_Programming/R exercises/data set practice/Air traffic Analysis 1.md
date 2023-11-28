**Problem**: Air Traffic Analysis

**Background**:
Imagine you work for an aviation authority and have been provided with a dataset (`flights_data`) for incoming and outgoing flights from various airports over the past month. The dataset contains the following columns:

1. `FlightID`: Unique ID for each flight.
2. `Date`: Date of the flight.
3. `Origin`: The origin airport of the flight.
4. `Destination`: The destination airport of the flight.
5. `Carrier`: The airline carrier.
6. `Duration`: Duration of the flight in minutes.
7. `Delay`: Flight delay in minutes (negative values indicate the flight left early).
8. `Passengers`: Number of passengers on the flight.

**Tasks**:
1. **Using `mutate()`**: [[Mutate If else]]
Create a new column, `Status`, that classifies each flight as either "On Time" (if Delay <= 10 minutes), "Slightly Delayed" (if Delay is between 10 to 60 minutes), or "Highly Delayed" (if Delay > 60 minutes).

2. **Using `arrange()`**: 
List the top longest flights (based on Duration) in descending order.

3. **Using `group_by()` and `summarise()`**:
Determine the total number of passengers flown by each airline carrier over the past month.

4. **Using `filter()`**:
Extract data only for flights that originated from "JFK" airport and faced a delay of more than 30 minutes.

5. **Using `select()`**:
Create a subset of the data retaining only the columns `FlightID`, `Date`, `Carrier`, and `Delay`.

**Bonus**:
6. **Using `count()`**:
Identify the top 3 destination airports with the highest number of incoming flights.

To work on this problem, you can create a hypothetical dataset (`flights_data`) using functions like `sample()`, `data.frame()`, etc., in R, or you could use a relevant dataset from available repositories. The main objective is to practice data manipulation using the functions from `dplyr`. Happy coding!