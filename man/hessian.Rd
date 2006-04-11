\name{hessian}
\alias{hessian}
\alias{hessian.default}

\title{Calculate Hessian Matrix}
\description{Calculate a numerical approximation to the Hessian matrix of a 
function at a parameter value.}
\usage{
    hessian(func, x, method="Richardson", method.args=list(), ...)

    \method{hessian}{default}(func, x, method="Richardson",
        method.args=list(eps=1e-4, d=0.1, r=4, v=2), ...)
}
\arguments{
    \item{func}{a function for which the first (vector) argument 
        is used as a parameter vector.}
    \item{x}{the parameter vector first argument to func.}
    \item{method}{one of \code{"Richardson"} or \code{"simple"} indicating 
    the method to use for the aproximation.}
    \item{method.args}{arguments passed to method. (Arguments not specified 
       remain with their default values.)}
    \item{...}{an additional arguments passed to \code{func}.}
}
\value{An n by n matrix of the Hessian of the function calculated at the 
       point \code{x}.}
\details{
  The function \code{hessian} calculates an numerical aproximation to 
  the n x n second derivative of a scalar real valued function with n-vector
  argument. It uses \code{\link{genD}} and extracts the second derivative.
}
\seealso{
    \code{\link{jacobian}},
    \code{\link{grad}},
    \code{\link{genD}}
}
\keyword{multivariate}
