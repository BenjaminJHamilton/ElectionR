
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ElectionR

<!-- badges: start -->

[![R-CMD-check](https://github.com/BenjaminJHamilton/ElectionR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/BenjaminJHamilton/ElectionR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of ElectionR is to …

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

df <- data.frame(party = c("A Group", "B Team", "C Fellas"), votes = c(5.5, 9.2, 1.2))

vote_share(df)
#>      party votes vote_share
#> 1  A Group   5.5  0.3459119
#> 2   B Team   9.2  0.5786164
#> 3 C Fellas   1.2  0.0754717
```
