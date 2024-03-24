library(dplyr)

countries <- c("Austria", "Belgium ", "Germany", "Denmark", "Portugal")

for (i in countries) {
  rmarkdown::render(
    input = "example_report.Rmd",
    output_file = paste0("report_", i, "_", Sys.date(), ".docx"),
    rmarkdown::word_document(),
    params = list(county = i, year = 1990)
  )
}
