\name{numDeriv-package}
\alias{numDeriv-package}
\alias{numDeriv.Intro}
\docType{package}

\title{Accurate Numerical Derivatives}

\description{Calculate (accurate) numerical approximations to derivatives.}

\details{
\tabular{ll}{
Package: \tab numDeriv\cr
Depends: \tab R (>= 1.8.1)\cr
License: \tab GPL Version 2. (See LICENSE file.)\cr
}
The main functions are
\preformatted{
grad	  to calculate the gradient (first derivative) of a scalar 
  	  real valued function (possibly applied to all elements 
  	  of a real vector argument).

jacobian  to calculate the gradient of a real m-vector valued
  	  function with real n-vector argument.

hessian   to calculate the Hessian (second derivative) of a scalar 
  	  real valued function with real n-vector argument.

genD	  to calculate the gradient and second derivative of a
  	  real m-vector valued function with real n-vector 
	  argument.
}

}
\author{Paul Gilbert, based on work by Xingqiao Liu}
\references{
  Linfield, G. R. and Penny, J. E. T. (1989) \emph{Microcomputers in Numerical 
  Analysis}. New York: Halsted Press.

  Fornberg and Sloan, (1994) \emph{Acta Numerica}, p. 203-267; Table 1, page 213)
}
\keyword{package}

