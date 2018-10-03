# ggvoronoi: Voronoi Diagrams and Heatmaps with 'ggplot2'

## Overview

'ggvoronoi' allows for easy creation and manipulation of Voronoi diagrams. Nearest neighbor regions are calculated using 'deldir'. From there, visualization is provided with 'ggplot2', or the user can analyze the diagram using any of R's spatial packages.

## Getting started

```r
#installing ggvoronoi from CRAN
install.packages("ggvoronoi")

#view some examples and create your first Voronoi diagram!
vignette("ggvoronoi")
```

## Contact info

For questions about usage/syntax or for reporting bugs, email Robert Garrett at garretrc@miamioh.edu or raise an issue on this repository. 

## Changes

Version 0.8.1: Fixed bug when using a discrete value for fill mapping. Removed google maps API call in the vignette.