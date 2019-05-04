source('../../R/check-functions.R')
context("checkers")

test_that("check_prob", {
  expect_true(check_prob(1))
  expect_true(check_prob(0))
  expect_length(check_prob(0.5), 1)
  #expect_error(check_prob(2), "p has to be a number between 0 and 1")
})

test_that("check_trials", {
  expect_true(check_trials(1000000))
  expect_length(check_trials(10), 1)
  #expect_error(1.1, "invalid trials value")
  expect_error(check_trials(-1), "invalid trials value")
})

test_that("check_success", {
  expect_true(check_success(c(1, 2, 3), 5))
  expect_true(check_success(c(1), 5))
  expect_error(check_success(c(1, 2, 6), 5), "success cannot be greater than trials")
})
