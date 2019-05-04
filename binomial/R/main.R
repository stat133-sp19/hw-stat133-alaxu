#' @title bin_choose
#' @description calculates number of combinations in n choose k
#' @param n number of total trials
#' @param k number of desired successes
#' @return n choose k
#' @examples
#' bin_choose(5,2)
#' @export
bin_choose <- function(n, k){
  if(k > n){
    stop('k cannot be greater than n')
  } else {
    return(factorial(n)/(factorial(k)*factorial(n-k)))
  }
}

#' @title bin_probability
#' @description calculates probability of getting a number of successes in another number of trials with probability
#' @param success number(s) of desired successes
#' @param trials number of total trials
#' @param prob probabilty of success in each trial
#' @return vector of probabilities for each success
#' @examples
#' bin_probability(2, 5, 0.5)
#' bin_probability(0:2, 5, 0.5)
#' @export
bin_probability <- function(success, trials, prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  res <- bin_choose(trials, success) * prob ^ success * (1-prob)^(trials-success)
  return(res)
}

#' @title bin_distribution
#' @description calculates the probability of all possible numbers of successes occurring
#' @param trials number of total trials
#' @param prob probabilty of success in each trial
#' @return data.frame with successes in the first column, probaility in the second column
#' @examples
#' bin_distirbution(5, 2)
#' @export
bin_distribution <- function(trials, prob){
  success <- 0:(trials)
  probability <- bin_probability(success, trials, prob)
  res <- data.frame(success, probability)
  class(res) <- c("bindis", "data.frame")
  return(res)
}

#' @export
plot.bindis <- function(dis){
  ggplot(data = dis, aes(x = success, y = probability)) +
    geom_col() +
    xlab("successes")
}

#' @title bin_cumulative
#' @description calculates probability of successse in trials, as well as the cumulative probability of all results so far
#' @param trials number of total trials
#' @param prob probabilty of success in each trial
#' @return data.frame with successes in the first column, probability in the second column, cumulative probability in the third column
#' @examples
#' bin_cumulative(5, 0.5)
#' @export
bin_cumulative <- function(trials, prob){
  success <- 0:trials
  probability <- bin_probability(success, trials, prob)
  cumulative <- cumsum(probability)
  res <- data.frame(success, probability, cumulative)
  class(res) <- c("bincum", "data.frame")
  return(res)
}

#' @export
plot.bincum <- function(dis){
  ggplot(data = dis, aes(x = success, y = cumulative)) +
    geom_line() +
    geom_point() +
    xlab("successes") +
    ylab("probability")
}

#' @title bin_variable
#' @description returns a list of number of trials and the probability of success per trial
#' @param trials number of total trials
#' @param prob probabilty of success in each trial
#' @return binvar object
#' @examples
#' bin_variable(10, 0.3)
#' @export
bin_variable <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  res <- list(trials = trials, prob = prob)
  class(res) <- "binvar"
  return(res)
}

#' @export
print.binvar <- function(binvar){
  cat("\"Binomial variable\"", "\n")
  cat("\nParameters\n")
  cat("- number of trials: ", binvar[[1]], "\n")
  cat("- prob of success :", binvar[[2]])
}

#' @export
summary.binvar <- function(binvar){
  trials <- binvar$trials
  prob <- binvar$prob
  res <- list(trials = trials, prob = prob, mean = aux_mean(trials, prob), variance = aux_variance(trials, prob),
              mode = aux_mode(trials, prob), skewness = aux_skewness(trials, prob), kurtosis = aux_kurtosis(trials, prob))
  return(res)
}

#' @export
print.summary.binvar <- function(binvar){
  cat("\"Summary Binomial\"", "\n")
  cat("\nParameters\n")
  cat("- number of trials: ", binvar$trials, "\n")
  cat("- prob of success :", binvar$prob, "\n")
  cat("\nMeasures\n")
  cat("- mean:    ", binvar$mean, "\n")
  cat("- variance: ", binvar$variance, "\n")
  cat("- mode     : ", binvar$mode, "\n")
  cat("- skewness: ", binvar$skewness, "\n")
  cat("- kurtosis: ", binvar$kurtosis, "\n")
}

#' @title bin_mean
#' @description returns expected value for binomial variable
#' @param trials number of total trials
#' @param prob probabilty of success in each trial
#' @return expected value
#' @examples
#' bin_mean(10, 0,3)
#' @export
bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' @title bin_variance
#' @description returns variance of binomial variable
#' @param trials number of total trials
#' @param prob probabilty of success in each trial
#' @return variance
#' @examples
#' bin_variance(10, 0,3)
#' @export
bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' @title bin_mode
#' @description returns the mode of the binomial variable
#' @param trials number of total trials
#' @param prob probabilty of success in each trial
#' @return expected value
#' @examples
#' bin_mode(10, 0,3)
#' @export
bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#' @title bin_skewness
#' @description returns skewness binomial variable
#' @param trials number of total trials
#' @param prob probabilty of success in each trial
#' @return skew value
#' @examples
#' bin_skewness(10, 0,3)
#' @export
bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#' @title bin_kurtosis
#' @description returns kurtosis for binomial variable
#' @param trials number of total trials
#' @param prob probabilty of success in each trial
#' @return kurtosis
#' @examples
#' bin_kurtosis(10, 0,3)
#' @export
bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}
