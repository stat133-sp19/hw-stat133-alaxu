source('../../R/check-functions.R')
source('../../R/aux-functions.R')
source('../../R/main.R')

context("binomial")

test_that("bin_choose", {
  expect_equal(bin_choose(5, 2), 10)
  expect_length(bin_choose(5, 2), 1)
  #expect_error(bin_choose(2, 5), "n choose k")
})

test_that("bin_probability", {
  expect_equal(bin_probability(2, 5, 0.5), 0.3125)
  #expect_equal(bin_probability(0:2, 5, 0.5), c(0.3125, 0.15625, 0.31250))
  expect_equal(bin_probability(55, 100, 0.45), 0.01075277)
  #expect_error(bin_probability(2, 5.5, 0.5), 0.3125)
  #expect_error(bin_choose(2, 5), "invalid trials value")
})

test_that("bin_distribution", {
  #expect_equal(bin_distribution(5, 0.5)$probability, c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125))
  #expect_length(bin_distribution(5, 0.5), 6)
  #expect_equal(bin_distribution(5, 0.5)$success, 0:5)
})

test_that("bin_cumulative", {
  #expect_equal(bin_cumulative(5, 0.5)$probability, c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125))
  #expect_length(bin_distribution(5, 0.5), 6)
  #expect_equal(bin_distribution(5, 2)$success, 0:5)
  #expect_equal(bin_distribution(5, 0.5)$cumulative, c(0.03125, 0.18750, 0.50000, 0.81250, 0.96875, 1.00000))

})
