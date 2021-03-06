% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main.R
\name{bin_probability}
\alias{bin_probability}
\title{bin_probability}
\usage{
bin_probability(success, trials, prob)
}
\arguments{
\item{success}{number(s) of desired successes}

\item{trials}{number of total trials}

\item{prob}{probabilty of success in each trial}
}
\value{
vector of probabilities for each success
}
\description{
calculates probability of getting a number of successes in another number of trials with probability
}
\examples{
bin_probability(2, 5, 0.5)
bin_probability(0:2, 5, 0.5)
}
