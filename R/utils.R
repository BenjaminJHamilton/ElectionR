

#' Check if a literal variable is present in the data context.
#'
#' @param var Literal variable to check
#' @param data Data context of variable
#' @param call_level level of parent environment to show as the error call level
#'
check_data_variable_present <- function(var, data, call_level = 1) {
  expr <- rlang::enquo(var)
  tidyselect::eval_select(expr, data = data, error_call = rlang::caller_env(n = call_level))
}
