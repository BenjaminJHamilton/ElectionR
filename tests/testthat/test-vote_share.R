

test_that("vote_share calculates correctly", {

  df <- data.frame(party = c("A Group", "B Team"), votes = c(5, 9))

  expected_output <- data.frame(
    party = c("A Group", "B Team"),
    votes = c(5, 9),
    vote_share = c(5/14, 9/14)
  )

  expect_equal(
    vote_share(df, votes),
    expected_output
  )

})

test_that("vote_share column selection works and grouping works", {

  df <- data.frame(votes = c(5, 9), party = c("A Group", "B Team"))

  expected_output <- data.frame(
    votes = c(5, 9),
    party = c("A Group", "B Team"),
    vote_share = c(5/14, 9/14)
  )

  expect_equal(
    vote_share(df, raw_vote = votes),
    expected_output
  )

  df_group <- data.frame(
    votes = c(5, 9, 6, 8),
    party = c("A Group", "B Team", "A Group", "B Team"),
    year = c(2019, 2019, 2024, 2024)
  )
  expected_output <- data.frame(
    votes = c(5, 9, 6, 8),
    party = c("A Group", "B Team", "A Group", "B Team"),
    year = c(2019, 2019, 2024, 2024),
    vote_share = c(5/14, 9/14, 6/14, 8/14)
  )

  expect_equal(
    vote_share(df_group, raw_vote = votes, .group = year),
    expected_output
  )
})

test_that("vote_share argument checking works", {

  # Check the data frame argument checking works

  list_test <- list(votes = c(5, 9), party = c("A Group", "B Team"))
  err_df <- rlang::catch_cnd(vote_share(list_test))

  expect_s3_class(err_df, "error_bad_argument")
  expect_equal(err_df$arg, "data")
  expect_equal(err_df$not, "list")

  # Check the column name argument checking works
  df <- data.frame(votes = c(5, 9), party = c("A Group", "B Team"))
  err_col <- rlang::catch_cnd(vote_share(df, raw_vote = NOT_PRESENT))

  expect_s3_class(err_col, "vctrs_error_subscript_oob")
  expect_equal(err_col$subscript_arg, "NOT_PRESENT")

})
