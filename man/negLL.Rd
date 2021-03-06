% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/f_likelihoodEqs.R
\name{negLL}
\alias{negLL}
\title{Likelihood without zero counts}
\usage{
negLL(theta, N, E, N_star = 1)
}
\arguments{
\item{theta}{A numeric vector of hyperparameters ordered as:
\eqn{\alpha_1, \beta_1, \alpha_2, \beta_2, P}.}

\item{N}{A whole number vector of actual counts from
\code{\link{processRaw}}.}

\item{E}{A numeric vector of expected counts from \code{\link{processRaw}}.}

\item{N_star}{A scalar whole number for the minimum count size used.}
}
\value{
A scalar negative log-likelihood value
}
\description{
\code{negLL} computes the negative log-likelihood based on the conditional
marginal distribution of the counts, \emph{N}, given that \emph{N >= N*},
where \emph{N*} is the smallest count used for estimating the hyperparameters
(DuMouchel et al. 2001). This function is minimized to estimate the
hyperparameters of the prior distribution. Use this function when neither
zero counts nor data squashing are being used. Generally this function is not
recommended unless using a small data set since data squashing (see
\code{\link{squashData}} and \code{\link{negLLsquash}}) can increase
efficiency (DuMouchel et al. 2001).
}
\details{
The conditional marginal distribution for the counts, \emph{N},
  given that \emph{N >= N*}, is based on a mixture of two negative binomial
  distributions. The hyperparameters for the prior distribution (mixture of
  gammas) are estimated by optimizing the likelihood equation from this
  conditional marginal distribution. It is recommended to use \code{N_star =
  1} when practical.

The hyperparameters are:
  \itemize{
    \item{\eqn{\alpha_1, \beta_1}: }{Parameters of the first component of the
      marginal distribution of the counts (also the prior distribution)}
    \item{\eqn{\alpha_2, \beta_2}: }{Parameters of the second component}
    \item{\eqn{P}: }{Mixture fraction}
}

This function will not need to be called directly if using
  \code{\link{exploreHypers}} or \code{\link{autoHyper}}.
}
\section{Warnings}{

  Make sure \emph{N_star} matches the smallest actual count in \emph{N}
  before using this function. Filter \emph{N} and \emph{E} if needed.


  Make sure the data were not squashed before using this function.
}

\references{
DuMouchel W, Pregibon D (2001). "Empirical Bayes Screening for
  Multi-item Associations." In \emph{Proceedings of the Seventh ACM SIGKDD
  International Conference on Knowledge Discovery and Data Mining}, KDD '01,
  pp. 67-76. ACM, New York, NY, USA. ISBN 1-58113-391-X.
}
\seealso{
\code{\link[stats]{nlm}}, \code{\link[stats]{nlminb}}, and
  \code{\link[stats]{optim}} for optimization

Other negative log-likelihood functions: 
\code{\link{negLLsquash}()},
\code{\link{negLLzeroSquash}()},
\code{\link{negLLzero}()}
}
\concept{negative log-likelihood functions}
\keyword{openEBGM}
