#Test cases involving the plotting of Voronoi diagrams with continuous coloring
context("Voronoi Diagram Heatmaps: Continuous")
library(ggvoronoi)

#use subset of included data file to perform testing
ncdc_test = ncdc_locations[1:10,4:6]

#Now we create the plots we want to test. 
#Each of these should have identical output despite having different function calls.
plots = list()

#Mappings in the geom/stat
plots[[1]] = ggplot(ncdc_test)+
               geom_voronoi(aes(long,lat,fill=elev))

plots[[2]] = ggplot(ncdc_test)+
               stat_voronoi(aes(long,lat,fill=elev))

#Mappings in ggplot statement
plots[[3]] = ggplot(ncdc_test,aes(long,lat,fill=elev))+
               geom_voronoi()

plots[[4]] = ggplot(ncdc_test,aes(long,lat,fill=elev))+
               stat_voronoi()

#Mixture of the above tests
plots[[5]] = ggplot(ncdc_test,aes(long))+
               geom_voronoi(aes(y=lat,fill=elev))

plots[[6]] = ggplot(ncdc_test,aes(fill=elev))+
               stat_voronoi(aes(long,lat))

#Helper to ensure conditional usage of vdiffr
expect_doppelganger <- function(title, fig, path = NULL, ...) {
  testthat::skip_if_not_installed("vdiffr")
  vdiffr::expect_doppelganger(title, fig, path = path, ...)
}

#Finally, we test to see if all of these plots are the same
test_that("Voronoi diagram heatmaps work correctly with continuous fill",{
  for(i in 1:length(plots)){
    expect_doppelganger("Heatmap with Continuous Fill",plots[[i]],path="")
  }
})
  