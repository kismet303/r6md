#' R6 Class Representing a markdown report
#'
#' @description
#' A report contains chunks of code contributing to an R
#' Markdown report
#'
#' @details
#' Chunks can be added or removed from the report and the updated code will
#' trigger recreation of the stored markdown document.
#'
R6md <- R6Class(
  "code_block",
  private = list(
    #' @field .n_exp total number of chunks
    .n_exp = NULL,
    #' @field .char_code_blocks total number of chunks
    .char_code_blocks = list(),
    #' @field .n_exp total number of chunks
    .block_counter = 0,
    #' @field .n_exp total number of chunks
    .section_counter = 0
  ),

  active = list(
    #' @description
    #' view the private .char_code_blocks
    #' @param value
    #' @return the private .char_code_blocks
    report_code = function(value){
      private$.char_code_blocks
    }
  ),

  public = list(
    code = rlang::expr(`<-`(matt, test)),



    #' @description
    #' Create a new R6md object.
    #' @param rep_title Title of the report
    #' @param intro Text to be included as introduction
    #' @return A new `R6md` object.
    initialize = function(rep_title, intro) {
      stopifnot(class(rep_title) == "character")
      stopifnot(class(intro) == "character")
      cat("initializing ...\n")
      # self$code = code
      private$.char_code_blocks <- list(title = paste0("#' ## ", rep_title),
                                        intro = paste0("#' ", intro)
      )
      # private$.n_exp = length(self$code)
      private$.n_exp = length(private$.char_code_blocks)
      # self$deparse_code()
      # set_n_exp()
      invisible()
    },

    print = function(...) {
      cat(paste0("There are ", private$.n_exp, " expressions\n"))
      if(class(self$code) == "call") cat(rlang::expr_deparse(self$code))
      if(class(self$code) == "list") {
        cat(as.character(self$code), sep="\n")
      }
      invisible(self)
    },

    print2 = function(...){
      cat(paste0("There are ", private$.n_exp, " expressions\n"))
      cat(private$.char_code, sep="\n")
      invisible(self)
    },

    set_n_exp = function() {
      private$.n_exp <- length(self$code)
    },

    deparse_code = function(){
      cat("-- deparsing code --\n")
      if(class(self$code) == "call") ch <- rlang::expr_deparse(self$code)
      if(class(self$code) == "list") {
        ch <- as.character(self$code)
      }

      private$.char_code <- ch
      invisible(self)
    },

    add_code = function(expr) {
      # self$code = c(self$code, expr)
      # self$set_n_exp()
      # invisible(self)

      private$char_code_block[private$.n_expr] <- c(private$char_code_block[private$.n_expr],
                                                    format_tidy_code(expr))

    },

    add_code_block = function(expr, prefix = NULL, block_settings = NULL) {


      private$.block_counter  <- private$.block_counter +1
      new_block <- paste0("block",private$.block_counter)
      cat(paste0("-- test add block: ", new_block,  " --\n"))
      block <- c(
        paste0("#' ", prefix),
        paste0("#+ ", new_block,  block_settings),
        format_tidy_code(expr)
      )
      private$.char_code_blocks <- c(private$.char_code_blocks, list(newblock=block))
      self$set_n_exp()
      invisible(self)
    },

    run_code = function() {
      if(class(self$code) == "call") result = eval(self(code))
      if(class(self$code) == "list") cat("Not implemented for list")
      invisible(result)
    },

    remove_code = function(){
      cat("removing last expression")
      self$code = self$code[seq(private$.n_exp-1)]
      self$set_n_exp()
      invisible(self)
    }
  ))




#example r6 class
# BankAccount <- R6Class("code_block", list(
#
#   balance = 0,
#   deposit = function(dep = 0) {
#     self$balance = self$balance + dep
#     invisible(self)
#   },
#
#   withdraw = function(draw) {
#     self$balance = self$balance - draw
#     invisible(self)
#   }
# ))



#
#
# class(rep_title)
#
# class(title)
# x$code
# x$report_code
# x$private$.n_exp
#
# x$add_code(code2)
# x$remove_code()
# spin_markdown(x$report_code, "report2.R")
# x$print2()
#
# x$report_code = 0
# str(x)
#
#
#
# Person <- R6Class("Person", list(
#   name = NULL,
#   age = NA,
#   initialize = function(name, age = NA) {
#     self$name <- name
#     self$age <- age
#   },
#   print = function(...) {
#     cat("Person: \n")
#     cat("  Name: ", self$name, "\n", sep = "")
#     cat("  Age:  ", self$age, "\n", sep = "")
#     invisible(self)
#   }
# ))
#
# hadley2 <- Person$new("Hadley")
#
#
# eval(code1)
