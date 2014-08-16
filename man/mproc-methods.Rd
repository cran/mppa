\name{plot-methods}
\docType{methods}
\alias{plot-methods}
\alias{plot,mproc-method}

\title{Methods for function \code{plot} in package 'mproc'}
\description{
  Plot objects of class \code{\linkS4class{mproc}}.
}
\section{Methods}{
\describe{
\item{\code{signature(x = "mproc")}}{
}
}}
\usage{
\S4method{plot}{mproc}(x, period=NA, id=1, mks=NULL, palette=rainbow, cols=NULL, xlab="Time", ylab="",\ldots)
}
\arguments{
  \item{x}{an object of class \code{\linkS4class{mproc}}.}
  \item{period}{if given, will wrap the data into periods, and plot each period
    on a horizontal line. See example.}
  \item{id}{the vector id to be plotted in periods. Ignored if period is
    not given.}
  \item{mks}{a vector or a list of vectors of marks. Points with the same
    mark will be shown in the same colour.}
  \item{palette}{a colour palette. Ignored if \code{mks} is \code{NULL}
    or \code{cols} is given.}
  \item{cols}{a vector or a list of vectors of colours for the
    points.}
  \item{xlab}{the label for the x-axis.}
  \item{ylab}{the label for the y-axis.}
    \item{\dots}{further arguments passed on to \code{plot}.}
}

\author{
  Patrick Rubin-Delanchy <patrick.rubin-delanchy@bristol.ac.uk>
}
\examples{
A = c(.1, .2, .3)
B = c(.1, .2, .3)
##Giving the last point in B a different colour from the rest
\dontrun{plot(mp(list(A=A,B=B)), mks=list(c(1,1,1), c(1,1,2)))}

#### A and B have a common daily pattern:
### their intensity is a sinusoidal curve lambda(t) = 1+sin(2*pi*t)
start=0; end=365 #A year
##the cumulative intensity is 
F=function(t){
    t\%/\%1+t\%\%1+(1-cos(2*pi*t\%\%1))/(2*pi)
}
##Dropping 365 A and B points according to F
A=sapply(runif(365), function(u){uniroot(function(x) F(x)/365-u, interval=c(0,365))$root})
B=sapply(runif(365), function(u){uniroot(function(x) F(x)/365-u, interval=c(0,365))$root})
##This plots A and B
\dontrun{plot(mp(A,B, start=start, end=end), pch=".")
}
##This plots B, one day represented on each horizontal line
\dontrun{plot(mp(A,B, start=start, end=end), period=1, id=2)
}
##Same as above, but now colouring the seventh day of every week differently:
\dontrun{plot(mp(A,B, start=start, end=end), period=1, id=2,mks=round(B\%\%7)==6)}
##Now A and B are in the same plot, different colour
lA=length(A); lB=length(B); 
\dontrun{plot(mp(c(A,B),start=start,end=end),period=1,mks=c(rep(1,lA), rep(2,lB)))}
}
\keyword{methods}
\concept{Multiple point processes}
