
# code <- c(
#   "#+ fig.width=5, fig.height=5",
#   "plot(cars)"
# )
#
# code2 <- c(
#   "#+ fig.width=5, fig.height=5",
#   "plot(cars)",
#   "#'  ",
#   "#' ## New section",
#   "#+ test",
#   "plot(mtcars)"
# )

spin_rmd <- function(code, destination) {
  stopifnot(is.character(code))

  # browser()
  writeLines(code, con = destination)
  knitr::spin(destination,
              knit = FALSE,
              format = "Rmd")
  # invisible()
}

# spin_markdown(code2, "report.R")
