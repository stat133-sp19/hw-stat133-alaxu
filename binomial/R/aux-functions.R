# private aux function to calculate mean of binomial variable
aux_mean <- function(trials, prob) {
  return(trials * prob)
}

# private aux function to calculate variance of binomial variable
aux_variance <- function(trials, prob) {
  return(trials*prob*(1-prob))
}

# private aux function to calculate mode of binomial variable
aux_mode <- function(trials, prob) {
  res <- (trials * prob) + prob
  if (res%%1==0) {
    return(c(res, res - 1))
  } else {
    return(floor((res)))
  }
}

# private aux function to calculate skewness of binomial variable
aux_skewness <- function(trials, prob) {
  res <- (1 - 2 * prob)
  res <- res / (trials * prob * (1 - prob)) ** 0.5
  return(res)
}

# private aux function to calculate kurtosis
aux_kurtosis <- function(trials, prob) {
  num <- 1 - 6 * prob * (1 - prob)
  den <- trials * prob * (1 - prob)
  return(num/den)
}
