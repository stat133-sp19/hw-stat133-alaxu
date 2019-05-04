source('../../R/aux-functions.R')
context("summary")

test_that("aux_mean", {
  expect_equal(aux_mean(10, 0.3), 3)
  expect_length(aux_mean(10, 0.3), 1)
  expect_type(aux_mean(10, 0.3), "double")
  #expect_equal(aux_mean(36, 0.5), 18)
})

test_that("aux_variance", {
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_length(aux_variance(10, 0.3), 1)
  #expect_type(aux_variance(10, 0.3), "double")
  expect_equal(aux_variance(40, 0.5), 10)
})

test_that("aux_mode", {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_length(aux_mode(10, 0.3), 1)
  expect_type(aux_mode(10, 0.3), "double")
})

test_that("aux_skewness", {
  #expect_equal(aux_skewness(10, 0.3), 0.2760262)
  expect_length(aux_skewness(10, 0.3), 1)
  expect_type(aux_skewness(10, 0.3), "double")
})

test_that("aux_kurtosis", {
  #expect_equal(aux_kurtosis(10, 0.3), -0.1238095)
  expect_length(aux_kurtosis(10, 0.3), 1)
  expect_type(aux_kurtosis(10, 0.3), "double")
})
