% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main.R
\name{bin_variable}
\alias{bin_variable}
\title{bin_variable}
\usage{
bin_variable(trials, prob)
}
\arguments{
\item{trials}{number of total trials}

\item{prob}{probabilty of success in each trial}
}
\value{
binvar object
}
\description{
returns a list of number of trials and the probability of success per trial
}
\examples{
bin_variable(10, 0.3)
}
