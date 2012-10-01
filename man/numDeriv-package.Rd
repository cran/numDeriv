\name{numDeriv-package}
\alias{numDeriv-package}
\alias{numDeriv.Intro}
\docType{package}

\title{Accurate Numerical Derivatives}

\description{Calculate (accurate) numerical approximations to derivatives.}

\details{
The main functions are
\preformatted{
grad	  to calculate the gradient (first derivative) of a scalar 
  	  real valued function (possibly applied to all elements 
  	  of a vector argument).

jacobian  to calculate the gradient of a real m-vector valued
  	  function with real n-vector argument.

hessian   to calculate the Hessian (second derivative) of a scalar 
  	  real valued function with real n-vector argument.

genD	  to calculate the gradient and second derivative of a
  	  real m-vector valued function with real n-vector 
	  argument.
}

}
\author{Paul Gilbert, based on work by Xingqiao Liu, and Ravi Varadhan (who wrote complex-step derivative codes)}
\references{
   Linfield, G. R. and Penny, J. E. T. (1989) \emph{Microcomputers in Numerical 
   Analysis}. New York: Halsted Press.

  Fornberg, B. and Sloan, D, M. (1994) ``A review of pseudospectral methods 
  for solving partial differential equations.'' \emph{Acta Numerica}, 3, 203-267.

  Lyness, J. N. and Moler, C. B. (1967) ``Numerical Differentiation of Analytic 
   Functions.'' \emph{SIAM Journal for Numerical Analysis},
    4(2), 202-210.
}
\keyword{package}

