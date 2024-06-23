

#' Calculate the vote share of parties
#'
#' @param data A data frame of parties and their raw vote numbers
#' @param raw_vote Character vector of column name that contain raw vote numbers
#' @param .group Column to group by
#'
#' @return An object of the same type as parties. The output has the following properties:
#'   * A new column: vote_share that contains the vote share of each party.
#' @export
#'
#' @examples
#' # Use literal variables to
#' df <- data.frame(party = c("A Group", "B Team"), votes = c(5, 9))
#' vote_share(df, votes)
#'
#' df2 <- data.frame(
#'   party = c("A Group", "B Team", "A Group", "B Team"),
#'   votes = c(5, 9, 6, 8),
#'   year = c(2019, 2019, 2024, 2024)
#'  )
#' vote_share(df, votes, .group = year)
vote_share <- function(data, raw_vote, .group = NULL) {

  if (!is.data.frame(data)) {
    abort_bad_argument("data", must = "be data.frame", not = data)
  }

  check_data_variable_present({{ raw_vote }}, data)
  check_data_variable_present({{ .group }}, data)

  data %>%
    mutate(
      vote_share = {{ raw_vote }} / sum({{ raw_vote }}),
      .by = {{.group}}
    )

}
