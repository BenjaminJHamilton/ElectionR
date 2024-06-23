
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ElectionR

<!-- badges: start -->

[![R-CMD-check](https://github.com/BenjaminJHamilton/ElectionR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/BenjaminJHamilton/ElectionR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

ElectionR aims to provide convenient methods for analysing election
results. This package is built as a way to gain experience in producing
packages in R.

## Installation

You can install the development version of ElectionR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("BenjaminJHamilton/ElectionR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ElectionR)

df <- data.frame(
  party = c("A Group", "B Team", "C Fellas", "A Group", "B Team", "C Fellas"), 
  votes = c(5.5, 9.2, 1.2, 4.2, 6.1, 3.9),
  year = c(rep(2019, 3), rep(2024, 3))
)

vote_share(df, votes, .group = year)
#>      party votes year vote_share
#> 1  A Group   5.5 2019  0.3459119
#> 2   B Team   9.2 2019  0.5786164
#> 3 C Fellas   1.2 2019  0.0754717
#> 4  A Group   4.2 2024  0.2957746
#> 5   B Team   6.1 2024  0.4295775
#> 6 C Fellas   3.9 2024  0.2746479
```
