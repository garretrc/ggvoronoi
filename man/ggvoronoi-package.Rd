\docType{package}
\name{ggvoronoi-package}
\alias{ggvoronoi}
\alias{ggvoronoi-package}
\title{ggvoronoi: Voronoi Diagrams and Heatmaps with 'ggplot2'}
\description{
A Voronoi diagram is a nearest neighbor diagram: given a set of generator points, the Voronoi diagram creates nearest neighbor cells. Each cell is formed around one generator point, and the set of points closest to that generator is fully contained in its cell. The resulting diagram can be used to find the nearest generator for an arbitrary point or to interpolate the blank space around each generator to create a heatmap.

Voronoi diagrams have a multitude of applications, but \code{ggvoronoi} implements tools for data visualization and spatial data analysis in R. For data visualization, \code{ggvoronoi} fits nicely within the \code{\link[ggplot2]{ggplot2}} framework, so R users experienced with the popular visualization package can create Voronoi diagrams and heatmaps around any point-level dataset within minutes. For spatial data analysis, R users can create a Voronoi diagram within the \code{\link[sp]{sp}} framework as a \code{\link[sp]{SpatialPolygonsDataFrame}} object. From there, the user can find the nearest generator point to each location in a new \code{\link[sp]{SpatialPoints}} object or use tools, such as those contained in \code{rgeos} such as \code{\link[rgeos]{gArea}}, to analyze the diagram.
}


\author{
\strong{Maintainer}: Robert Garrett \email{garretrc@miamioh.edu}

Authors:
\itemize{
  \item Austin Nar
  \item Thomas Fisher
}

Other contributors:
\itemize{
  \item Karsten Maurer
}

}
\keyword{internal}