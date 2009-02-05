\name{grad}
\alias{grad}
\alias{grad.default}
\title{Numerical Gradient of a Function}
\description{Calculate the gradient of a function by numerical approximation.}
\usage{
     grad(func, x, method="Richardson", method.args=list(), ...) 

    \method{grad}{default}(func, x, method="Richardson",
      method.args=list(eps=1e-4, d=0.0001,
      zero.tol=sqrt(.Machine$double.eps/7e-7), r=4, v=2, show.details=FALSE), ...)
 }
\arguments{
    \item{func}{a function with a scalar real result (see details).}
    \item{x}{a real scalar or vector argument to func, indicating the 
      point(s) at which the gradient is to be calculated.}
    \item{method}{one of \code{"Richardson"} or \code{"simple"} indicating 
    the method to use for the approximation.}
    \item{method.args}{arguments passed to method. (Arguments not specified 
       remain with their default values.)}
    \item{...}{an additional arguments passed to \code{func}.}
}
\value{A real scalar or vector of the approximated gradient(s).}

\details{
   The function \code{grad} calculates a numerical approximation of the 
   first derivative of \code{func} at the point \code{x}. Any additional 
   arguments in \dots are also passed to \code{func}, but the gradient is not
   calculated with respect to these additional arguments.
   It is assumed \code{func}  is a scalar value function. If a vector \code{x} 
   produces a scalar
   result then \code{grad} returns the numerical approximation of the gradient
   at the point \code{x} (which has the same length as \code{x}).
   If a vector \code{x} produces a vector result then the result must have the
   same length as \code{x}, and it is assumed that this corresponds to applying
   the function to each of its arguments (for example, \code{sin(x)}). 
   In this case \code{grad} returns the
   gradient at each of the points in \code{x} (which also has the same length 
   as \code{x} - so be careful). An alternative for vector valued functions is
   provided by \code{\link{jacobian}}.
  
   If method is "simple", the calculation is done using a simple epsilon
   difference. For this case, only the element \code{eps} of \code{methods.args}
   is used.

   If method is "Richardson", the calculation
   is done by Richardson's extrapolation (see e.g. Linfield and Penny, 1989,
   or Fornberg and Sloan, 1994.)
   This method should be used if accuracy, as opposed to speed, is important.
   For this case, 
   \code{methods.args=list(eps=1e-4, d=0.01, zero.tol=100*.Machine$double.eps, 
   r=4, show.details=FALSE)} 
   are used.
    \code{d} gives the fraction of \code{x} to use for the initial numerical 
      approximation. The default means the initial approximation uses
      \code{0.0001 * x}.
    \code{eps} is used instead of \code{d} for elements of \code{x} which are 
       zero (absolute value less than zero.tol).
    \code{zero.tol} tolerance used for deciding which elements of \code{x} are 
       zero.
    \code{r} gives the number of Richardson improvement iterations (repetitions
       with successly smaller \code{d}. The default \code{4} general provides 
       good results, but this can be increased to \code{6} for improved
       accuracy at the cost of more evaluations.
    \code{v} gives the reduction factor.
    \code{show.details} is a logical indicating if detailed calculations should 
        be shown.
   
  The general approach in the Richardson method is to iterate for \code{r} 
  iterations from initial 
  values for interval value \code{d},  using reduced factor \code{v}.
  The the first order approximation to the derivative with respect 
  to \eqn{x_{i}}{x_{i}} is

      \deqn{f'_{i}(x) = <f(x_{1},\dots,x_{i}+d,\dots,x_{n}) -
               f(x_{1},\dots,x_{i}-d,\dots,x_{n})>/(2*d)}{%
	    f'_{i}(x) = <f(x_{1},\dots,x_{i}+d,\dots,x_{n}) -
               f(x_{1},\dots,x_{i}-d,\dots,x_{n})>/(2*d)}
       
  This is repeated \code{r} times  with successively smaller \code{d}  and 
  then Richardson extraplolation is applied.
  
  If elements of \code{x} are near zero the multiplicative interval calculation
  using \code{d} does not work, and for these elements an additive calculation
  using \code{eps} is done instead. The argument \code{zero.tol} is used
  determine if an element should be considered too close to zero. 
  In the iterations, interval is successively reduced to eventual 
  be \code{d/v^r} and the square of this value is used in second derivative 
  calculations (see \code{\link{genD}}) so the 
  default \code{zero.tol=sqrt(.Machine$double.eps/7e-7)} is set to ensure the
  interval is bigger than \code{.Machine$double.eps} with the default \code{d},
  \code{r}, and \code{v}.
}
\references{ 
   Linfield, G. R. and Penny, J. E. T. (1989) \emph{Microcomputers in Numerical 
   Analysis}. New York: Halsted Press.

  Fornberg and Sloan (Acta Numerica, 1994, p. 203-267)
}
\seealso{
  \code{\link{jacobian}},
  \code{\link{hessian}},
  \code{\link{genD}},
  \code{\link[stats]{numericDeriv}}
   }
\examples{
  grad(sin, pi)
  grad(sin, (0:10)*2*pi/10)
  func0 <- function(x){ sum(sin(x))  }
  grad(func0 , (0:10)*2*pi/10)

  func1 <- function(x){ sin(10*x) - exp(-x) }

  curve(func1,from=0,to=5)

  x <- 2.04
  numd1 <- grad(func1, x)
  exact <- 10*cos(10*x) + exp(-x)
  c(numd1, exact, (numd1 - exact)/exact)


  x <- c(1:10)
  numd1 <- grad(func1, x)
  exact <- 10*cos(10*x) + exp(-x)
  cbind(numd1, exact, (numd1 - exact)/exact)
}
\keyword{multivariate}
