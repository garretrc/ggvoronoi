# ggvoronoi: Voronoi Diagrams and Heatmaps with 'ggplot2'

## Overview

['ggvoronoi']( https://CRAN.R-project.org/package=ggvoronoi) is an R package that allows for easy creation and manipulation of [Voronoi diagrams](https://en.wikipedia.org/wiki/Voronoi_diagram), which are tools for determining nearest neighbor regions for a given set of points. 
Voronoi diagram regions are calculated using the R package ['deldir']( https://CRAN.R-project.org/package=deldir) by Rolf Turner. 
The output from 'deldir' is converted to the spatial object format provided by the ['sp']( https://CRAN.R-project.org/package=sp) package from Edzer Pebesma and Roger Bivand.
This allows for additional functionality beyond what is provided in ['deldir']( https://CRAN.R-project.org/package=deldir): diagrams can now be extended to heatmaps and users can now specify a bounding region for the diagram.
From there, visualization capabilities are implemented using the framework of ['ggplot2']( https://CRAN.R-project.org/package=ggplot2), a popular graphics package for R created by Hadley Wickham, 
or the user can analyze the diagram using any of R's spatial data analysis packages.

## What is a Voronoi diagram?

A Voronoi diagram is a nearest neighbor diagram: given a set of generator points, the Voronoi diagram creates nearest neighbor cells. Each cell is formed around one generator point, and the set of points closest to that generator is fully contained in its cell. The resulting diagram can be used to find the nearest generator for an arbitrary point or to interpolate the blank space around each generator to create a heatmap.

Voronoi diagrams have a multitude of applications, but 'ggvoronoi' implements tools for data visualization and spatial data analysis in R. For data visualization, 'ggvoronoi' fits nicely within the ['ggplot2']( https://CRAN.R-project.org/package=ggplot2) framework, so R users experienced with the popular visualization package can create Voronoi diagrams and heatmaps around any point-level dataset within minutes. For spatial data analysis, R users can create a Voronoi diagram within the ['sp']( https://CRAN.R-project.org/package=sp) framework as a ``SpatialPolygonsDataFrame`` object. From there, the user can find the nearest generator point to each location in a new ``SpatialPoints`` object or use tools, such as those contained in ['rgeos']( https://CRAN.R-project.org/package=rgeos), to analyze the diagram.

## Installation

To install 'ggvoronoi' from [CRAN]( https://CRAN.R-project.org/package=ggvoronoi):

```r
install.packages("ggvoronoi")
```

Or install the latest development version from this repository:

```r
remotes::install_github("garretrc/ggvoronoi", dependencies = TRUE, build_opts = c("--no-resave-data"))
```

Finally, with either verison you can load the R package with the typical method:

```r
library(ggvoronoi)
```

## Getting Started

With the vignette, you can view some examples and create your first Voronoi diagram!

```r
vignette("ggvoronoi")
```

Alternatively, the vignette is available [here.](http://htmlpreview.github.io/?https://github.com/garretrc/ggvoronoi/blob/master/vignettes/ggvoronoi.html)

## Contact info

For questions about usage/syntax or for reporting bugs, email Robert Garrett at garretrc@miamioh.edu or raise an issue on this repository. 

To contribute to the package or see past contributions, see the [CONTRIBUTING.md](CONTRIBUTING.md) file

## Changes

v0.8.2: Added unit tests using ['testthat']( https://CRAN.R-project.org/package=testthat) and ['vdiffr']( https://CRAN.R-project.org/package=vdiffr). Minor improvements to vignette and README.md

v0.8.1: Fixed bug when using a discrete value for fill mapping. Removed google maps API call in the vignette.
