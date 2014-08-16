\name{mppa-package}
\alias{mppa-package}
\alias{mppa}
\docType{package}
\title{
  Statistics for analysing multiple simultaneous point processes on the real line
}
\description{
A procedure to test for dependence between point processes on the real
line, e.g. causal dependence, correlation, inhibition or anti-correlation. The package also provides a number of utilities for plotting simultaneous point processes, and combining p-values.
}
\details{
\tabular{ll}{
Package: \tab mppa\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-08-16\cr
License: \tab GPL (>= 2)\cr
Depends: \tab methods\cr
}
\code{corrtest}: testing for dependence between point processes (can be
causal dependence, correlation, inhibition or anti-correlation).

\code{\linkS4class{mproc}}: a class for plotting
multiple simultaneous point processes.

\code{TMT.test}, \code{F.test}, \code{simes.test}: methods for
  combining p-values.
}

\author{
Patrick Rubin-Delanchy <patrick.rubin-delanchy> and Nicholas Heard <n.heard@imperial.ac.uk>

Maintainer: Patrick Rubin-Delanchy <patrick.rubin-delanchy@bristol.ac.uk>
}
\references{
Patrick Rubin-Delanchy and Nicholas A Heard. ``A test for dependence between two point processes on the real line''.  arXiv:1408.3845.
}

\keyword{ package }
\examples{
A = runif(20)
B=runif(20)
##around ten B events are caused by A 
B=c(B, sample(A, 10)+abs(rnorm(10, 0,.01))); B = B[B>0&B<1]
\dontrun{plot(mp(list(A=A,B=B)))}
corrtest(A,B)
}
