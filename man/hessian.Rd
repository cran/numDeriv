\name{hessian}
\alias{hessian}
\alias{hessian.default}

\title{Calculate Hessian Matrix}
\description{Calculate a numerical approximation to the Hessian matrix of a 
function at a parameter value.}
\usage{
    hessian(func, x, method="Richardson", method.args=list(), ...)

    \method{hessian}{default}(func, x, method="Richardson",
        method.args=list(), ...)
}
\arguments{
    \item{func}{a function for which the first (vector) argument 
        is used as a parameter vector.}
    \item{x}{the parameter vector first argument to func.}
    \item{method}{one of \code{"Richardson"} or \code{"complex"} indicating 
    the method to use for the approximation.}
    \item{method.args}{arguments passed to method.  See \code{\link{grad}}. 
       (Arguments not specified remain with their default values.)}
    \item{...}{an additional arguments passed to \code{func}.
          WARNING: None of these should have names matching other arguments of this function.}
}
\value{An n by n matrix of the Hessian of the function calculated at the 
       point \code{x}.}
\details{
  The function \code{hessian} calculates an numerical approximation to 
  the n x n second derivative of a scalar real valued function with n-vector
  argument. 
  
  The argument \code{method} can be \code{"Richardson"} or \code{"complex"}.
  Method \code{"simple"} is not supported. 
  
  For method \code{"complex"} the Hessian matrix is calculated as the Jacobian
  of the gradient. The function \code{grad} with method "complex" is used, 
  and \code{methods.args} is ignored for this (an \code{eps} of 
  \code{.Machine$double.eps} is used - see \code{\link{grad}} for more details). 
  However,  \code{jacobian} is used in the second step, with method 
  \code{"Richardson"} and argument \code{methods.args} is used for this. 
  The default is
  \code{methods.args=list(eps=1e-4, d=0.1, zero.tol=sqrt(.Machine$double.eps/7e-7), 
   r=4, v=2, show.details=FALSE)}. (These are the defaults for \code{hessian} 
   with method \code{"Richardson"}, which are slightly different from the defaults 
   for \code{jacobian} with method \code{"Richardson"}.)
  
  Methods \code{"Richardson"} uses \code{\link{genD}} and extracts the 
  second derivative. For this method 
   \code{methods.args=list(eps=1e-4, d=0.1, zero.tol=sqrt(.Machine$double.eps/7e-7), 
   r=4, v=2, show.details=FALSE)} is set as the default.
}
\seealso{
    \code{\link{jacobian}},
    \code{\link{grad}},
    \code{\link{genD}}
}
\examples{
  sc2.f <- function(x){
    n <- length(x)
    sum((1:n) * (exp(x) - x)) / n
    }

  sc2.g <- function(x){
    n <- length(x)
    (1:n) * (exp(x) - 1) / n
    }

  x0 <- rnorm(5)
  hess <- hessian(func=sc2.f, x=x0)
  hessc <- hessian(func=sc2.f, x=x0, "complex")
  all.equal(hess, hessc, tolerance = .Machine$double.eps)
  
#  Hessian = Jacobian of the gradient
  jac  <- jacobian(func=sc2.g, x=x0)
  jacc <- jacobian(func=sc2.g, x=x0, "complex")
  all.equal(hess, jac, tolerance = .Machine$double.eps)
  all.equal(hessc, jacc, tolerance = .Machine$double.eps)
}
\keyword{multivariate}
