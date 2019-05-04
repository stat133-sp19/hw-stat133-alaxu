# private function to check validity of prob value
check_prob <- function(prob) {
  if (prob >= 0 & prob <= 1) {
    return(TRUE)
  } else {
    stop("prob has to be a number between 0 and 1")
  }
}

# private function to check validity of trials value
check_trials <- function(trials) {
  if (trials%%1==0 & trials > 0) {
    return(TRUE)
  } else {
    stop("invalid trials value")
  }
}

# private function to check validity of success value
check_success <- function(success, trials) {
  if (all(success <= trials) & (all(success > 0) & all(success%%1 == 0))) {
    return(TRUE)
  } else {
    stop("success cannot be greater than trials")
  }
}

