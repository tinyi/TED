\name{learn.embedding.Kcls}
\alias{learn.embedding.Kcls}
\title{
TED Embedding learning module initialized by hirarchial clustering on tumor expression profiles.
}
\description{
Run EM to estimate tumor expression bases and their weights to approximate the tumor expression profiles, using hirarchial clustering on the estimated tumor expression to initialize eta0.
}
\usage{

learn.embedding.Kcls(ted.res,
							K.vec,
							EM.maxit=50,
							alpha=NULL,
							sigma=NULL,
							file.name=NULL,
							gibbs.control=NULL,
							opt.control=NULL,
							n.cores=NULL,
							print.accuracy=F,
							compute.posterior=F)
}
\arguments{
  \item{ted.res}{The object returned by TED deconvolution module.}
  \item{K.vec}{A numerical parameter or vector indicating the number of tumor pathways to be inferred.}
  \item{EM.maxit}{The number of maximum EM iterations. Default=50.}
  \item{alpha}{One positive numerical parameter or a numeircal vector of length equal the number of bases, denoting the dirichlet hyper-parameter. Default=NULL uses the same value used in the deconvolution. Note that alpha usually does not affect the results, due to the dominating likelihood term resulted from the high sequencing depth of bulk RNA-seq.}
  \item{sigma}{One positive numerical parameter or a numeircal vector of length equal number of genes (for gene-specific prior), denoting the prior of the standard deviation of log fold change between the true expression and the reference. Default=NULL uses the same value used in the deconvolution. User may provide their own sigma based on prior knowledge, such as differential expression analysis. }
  \item{file.name}{A file name if wants to write log to files. Default=NULL (print to scree). }
  \item{gibbs.control}{A list of parameters controling the Gibbs sampling. Default=NULL uses the same value used in the deconvolution.}
  \item{opt.control}{A list of parameters controling the optimization by Rcgmin. Default=NULL uses the same value used in the deconvolution.}
   \item{ncores}{Number indicating CPU cores in parallel computing.  Default (NULL) uses the value used in the deconvolution.}
  \item{print.accuracy}{A logical parameter indicating if the classification accuracy is to be computed and printed. The classification accuracy is defined as the percentage of samples of the most similar estimated expression profile (based on Naive Bayes classifier or correlation approaches) corresponds to the correct sample. Defaul=FALSE.}
  \item{compute.posterior}{A logical parameter indicating whether the posterior is to be computed for every EM cycle. Defaul=FALSE.}
}
\details{
}
\value{
A list of list is returned in this function. Each element of the list corresponds to each K speficied in K.vec. 
  \item{K.tum}{Number of tumor pathways to be inferred.}
  \item{theta.all}{The fractions associated with tumor bases (first K.tum columns) and stromal cells.}
  \item{opt.phi.hat.tum}{The inferred expression profile of each tumor pathways, referred to as eta in the TED paper}
  \item{log.posterior}{Log posterior of each EM cycle, if compute.posterior=T}
}
\examples{
}
\keyword{ TED }
