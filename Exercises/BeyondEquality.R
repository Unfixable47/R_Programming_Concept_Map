library(dplyr)

# Creating a tibble for patients and admissions
patients <- tibble(
  patient_id = c(1, 2, 3),
  patient_name = c("Alice", "Bob", "Charlie"),
  admission_date = as.Date(c("2022-01-01", "2022-02-15", "2022-03-10"))
)
print(medications)
# Creating a tibble for medication prescriptions
medications <- tibble(
  patient_id = c(1, 1, 2, 3, 3),
  medication_name = c("Aspirin", "Tylenol", "Ibuprofen", "Amoxicillin", "Vitamin C"),
  start_date = as.Date(c("2021-12-01", "2022-02-01", "2022-02-20", "2022-01-15", "2022-04-01")),
  end_date = as.Date(c("2022-01-31", "2022-02-28", "2022-03-15", "2022-02-28", "2022-04-30"))
)
print(medications)
# Performing non-equi join
result <- patients |>
  inner_join(
    medications,
    by = join_by(
      patient_id,
      admission_date >= start_date,
      admission_date <= end_date
    )
  )
print(result)
# Equivalent overlap join
result <- patients |>
  inner_join(
    medications,
    by = join_by(
      patient_id,
      between(admission_date, start_date, end_date)
    )
  )
print(result)


ships <- tibble(
  ship_id = 1:4,
  arrival_time = as.POSIXct(c(
    "2022-01-01 18:00:00",
    "2022-01-01 21:30:00",
    "2022-01-02 02:45:00",
    "2022-01-02 15:15:00"
  )),
  departure_time = as.POSIXct(c(
    "2022-01-01 22:00:00",
    "2022-01-02 03:30:00",
    "2022-01-02 05:45:00",
    "2022-01-02 18:15:00"
  ))
)


ships |>
  inner_join(
    ships,
    by = join_by(
      x$ship_id < y$ship_id, # Only consider ordered pairs
      overlaps(
        x_lower = x$arrival_time,
        x_upper = x$departure_time,
        y_lower = y$arrival_time,
        y_upper = y$departure_time
      )
    )
  )


Ashley
612 - 913 - 0033
