# expr <- code1
# prefix <- "Lets first run code 1"
# block_settings <- "block1"


add_code_block = function(expr, prefix = NULL, block_settings = NULL) {
  cat("-- test add code block --\n")

  block <- c(
    paste0("#' ", prefix),
    paste0("#+ ", block_settings),
    format_tidy_code(expr)
  )
}

add_new_section = function(name, prefix = NULL, block_settings = NULL) {
  cat("-- test add code block --\n")

  block <- c(
    paste0("#' ##", name),
    paste0("#' ##", prefix),
    paste0("#+ ", block_settings),
    format_tidy_code(expr)
  )
}

# add_code
#
# b <- add_code_block(expr=expr,
#                     prefix=prefix,
#                     block_settings)
#
# b <-
#   spin_markdown(b, "test.R")


# self$code = c(self$code,
#               expr))
# self$set_n_exp()
# invisible(self)
