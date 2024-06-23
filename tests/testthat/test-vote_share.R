

test_that("vote_share calculates correctly", {

  df <- data.frame(party = c("A Group", "B Team"), votes = c(5, 9))

  expected_output <- data.frame(
    party = c("A Group", "B Team"),
    votes = c(5, 9),
    vote_share = c(5/14, 9/14)
  )

  expect_equal(
    vote_share(df),
    expected_output
  )

})

test_that("vote_share column selection works", {

  df <- data.frame(votes = c(5, 9), party = c("A Group", "B Team"))

  expected_output <- data.frame(
    votes = c(5, 9),
    party = c("A Group", "B Team"),
    vote_share = c(5/14, 9/14)
  )

  expect_equal(
    vote_share(df, .party = "party", .raw_vote = "votes"),
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
  err_col <- rlang::catch_cnd(vote_share(df, 1L, "votes"))

  expect_s3_class(err_col, "error_bad_argument")
  expect_equal(err_col$arg, ".party")
  expect_equal(err_col$not, "integer")

})
