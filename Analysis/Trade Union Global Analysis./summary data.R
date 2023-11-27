# joined_full_data_set

library(dplyr)

# Assuming your data frame is named joined_full_data_set
result <- joined_full_data_set %>%
  group_by(ref_area) %>%
  summarise(
    mean_time = mean(time, na.rm = TRUE),
    mean_National_Compliance_wth_Labour_Rights = mean(National_Compliance_wth_Labour_Rights, na.rm = TRUE),
    mean_Collective_Bargaining_Coverage = mean(`Collective Bargaining Coverage`, na.rm = TRUE),
    mean_Union_Density = mean(`Union Density`, na.rm = TRUE)
  )

print(result)

View(result)