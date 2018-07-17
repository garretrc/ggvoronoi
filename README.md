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

## Known Issues

When using a discrete value for fill, the polygons have undesired behavior. The fix here is to add group=NA to the aesthetic mapping:

```r
library(ggvoronoi)

points=data.frame(
  x=runif(n = 100,0,8.5),
  y=runif(n = 100,0,11),
  fill=as.factor(rep(1:2,50))
)

#erratic polygons
ggplot(points)+
  geom_voronoi(aes(x,y,fill=fill),color="black")

#the fix:
ggplot(points)+
  geom_voronoi(aes(x,y,fill=fill,group=NA),color="black")
```
