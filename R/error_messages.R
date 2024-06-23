

#' Create an error message for bad arguments
#'
#' @param arg Character Argument of function error relates to
#' @param must What must the function be.
#' @param not Argument that error is about. Optional, by default NULL
#' @param call Returns the parent environment that called the error with
#'   `rlang::caller_env()`.
#'
#' @return None. Throws error_bad_argument error
#'
#' @details
#' Taken from Wickham, H. (2019). Advanced R, Second Edition (2nd ed.).
#' Chapman and Hall/CRC. https://doi.org/10.1201/9781351201315
#'
abort_bad_argument <- function(arg, must, not = NULL, call = rlang::caller_env()) {
  msg <- glue::glue("`{arg}` must {must}")
  if (!is.null(not)) {
    not <- typeof(not)
    msg <- glue::glue("{msg}; not {not}.")
  }

  abort(
    "error_bad_argument",
    message = msg,
    arg = arg,
    must = must,
    not = not,
    call = call
  )
}

#' Create an error message for missing selection
#'
#' @param arg Character Argument of function error relates to.
#' @param not_in Object that arg is missing from.
#' @param call Returns the parent environment that called the error with
#'   `rlang::caller_env()`.
#'
#' @return None. Throws error_missing_selection error
#'
abort_missing_selection <- function(arg, not_in, call = rlang::caller_env()) {
  msg <- glue::glue("`{arg}` not present in {not_in}")

  abort(
    "error_missing_selection",
    message = msg,
    arg = arg,
    not_in = not_in,
    call = call
  )

}
