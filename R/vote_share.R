

#' Calculate the vote share of parties
#'
#' @param data A data frame of parties and their raw vote numbers
#' @param .party Character vector of column name that contains party names. By
#'  default the first column
#' @param .raw_vote Character vector of column name that contain raw vote numbers.
#'  By default the second column
#'
#' @return An object of the same type as parties. The output has the following properties:
#'   * A new column: vote_share that contains the vote share of each party.
#' @export
#'
#' @examples
#' df <- data.frame(party = c("A Group", "B Team"), votes = c(5, 9))
#' vote_share(df, "party", "votes")
#'
vote_share <- function(data, .party = NULL, .raw_vote = NULL) {

  if (!is.data.frame(data)) {
    abort_bad_argument("data", must = "be data.frame", not = data)
  }

  party_col <- if (is.null(.party)) colnames(data)[[1]] else .party
  vote_col <- if (is.null(.raw_vote)) colnames(data)[[2]] else .raw_vote

  if (!is.character(party_col)) {
    abort_bad_argument(".party", must = "be character", not = party_col)
  }
  if (!is.character(vote_col)) {
    abort_bad_argument(".raw_vote", must = "be character", not = vote_col)
  }

  total_votes <- sum(data[[vote_col]])

  data %>%
    mutate(
      vote_share = .data[[vote_col]] / total_votes
    )

}
