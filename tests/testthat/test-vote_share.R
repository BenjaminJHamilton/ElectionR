

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
