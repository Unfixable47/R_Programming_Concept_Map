view_xl <- function(.data) {
  if (interactive()) {
    tmp <- tempfile(fileext = ".csv")
    data.table::fwrite(.data, tmp)
    browseURL(tmp, browser = "gnumeric")
  }
}

function(.data) {
  if (interactive()) {
    tmp <- tempfile(fileext = ".html")
    html <- reactable::reactable(.data,
      filterable = TRUE,
      searchable = TRUE, showPageSizeOptions = TRUE, striped = TRUE,
      highlight = TRUE, compact = TRUE, defaultPageSize = 30
    )
    htmlwidgets::saveWidget(html, file = tmp)
    browseURL(tmp, browser = "brave")
  }
}


view_xl(iris)
view(iris)



install.packages("knitr")
install.packages("highr")
install.packages("evaluate")
install.packages("xfun")

library("highr")
library("xfun")
library("evaluate")
library("knitr")


head(iris)
knit("test.Rnw")
