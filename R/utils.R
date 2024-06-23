

#' Check if a literal variable is present in the data context.
#'
check_data_variable_present <- function(var, data, call_level = 1) {
  expr <- rlang::enquo(var)
  tidyselect::eval_select(expr, data = data, error_call = rlang::caller_env(n = call_level))
}
