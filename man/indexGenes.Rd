% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deprecated.R
\name{indexGenes}
\alias{indexGenes}
\title{Index genes}
\usage{
indexGenes(obj, type, threads = 1, subset = NULL)
}
\arguments{
\item{obj}{Amethyst object containing paths to h5 files to be indexed}

\item{type}{What type of methylation to retrieve; i.e. gene body mCH, gene
body mCG, or promoter mCG. Must be passed as one of "CG", "CH", or "promoter".
The latter will do CG over TSS +/- 1500 bp}

\item{threads}{Optional threads parameter to use if parallelizing. Highly
recommended as even small datasets will take a long time to index.
Defaults to 10.}

\item{subset}{List of genes to index. Optional but recommended.See the
\code{fetchMarkers} function.}

\item{gtf}{Genome annotation file with chromosome, start, and end position
information for genes of interest. See the "makeRef" function.}
}
\value{
A list of data frames named by gene. The data frames contain the
coordinates in the hdf5 file corresponding to the gene's genomic location for
each cell.
}
\description{
If the whole hdf5 file had to be searched for relevant reads
every time gene-specific methylation information was needed, most functions
would take minutes to hours to run. The indexing process catalogs the
coordinates for each specified gene in every cell beforehand so the relevant
subset can quickly be retrieved for downstream processes. mCG, mCH, and the
mCG status of the promoter must be indexed separately. Providing a gene
subset is recommended due to memory and time constraints.
}
\examples{
index[["CH"]] <- indexGenes(
  hdf5 = "~/Downloads/test.h5",
  gtf = ref,
  type = "CH",
  threads = 10,
  subset = c("SATB2", "TBR1", "FOXG1")
)
}
