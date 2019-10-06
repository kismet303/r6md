# Set example titles and code to use for testing --------------------------
rep_title <- "my Rmarkdown report"
intro <- "this is my markdown report generated from shiny"
code1 <- rlang::expr(mtcars %>% filter(gear == 4))
code2 <- rlang::expr(mtcars %>% filter(carb == 4))
add_code <- rlang::expr(2+2)

expr <- code1
prefix1 <- "Lets first run code 1"
block_settings1 <- "block1"

expr <- code2
prefix2 <- "Lets first run code 2"
block_settings2 <- "block2"

code1


# Test R6md class ---------------------------------------------------------
x <- R6md$new(rep_title, intro)
# x$add_code_block(expr = code1,
#                  prefix = prefix1,
#                  block_settings = block_settings1)
#
# x$report_code
#
# x$add_code_block(expr = code2,
#                  prefix = prefix2,
#                  block_settings = block_settings2)
#
# spin_markdown(unlist(x$report_code), "report2.R")
#
# x
# as.character()
#
