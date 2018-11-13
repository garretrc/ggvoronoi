#Visual tests for the outline argument
context("Voronoi Diagram Heatmaps: Outline")
library(ggvoronoi)

#use subset of included data file to perform testing
ncdc_test = ncdc_locations[1:10,4:6]

#create another data frame to test discrete case
ncdc_discrete = ncdc_test
ncdc_discrete$elev = as.character(ncdc_discrete$elev)

#create a border that we can visually check
border = data.frame(x = c(-123.6,-123.5,-122.9,-123),
                    y = c(48.2,48.8,48.9,48.3))

#Now we create the plots we want to test!

#Blank diagram
blank =      ggplot(ncdc_test)+
               geom_path(aes(long,lat),stat="voronoi", outline=border)

#Continuous case
continuous = ggplot(ncdc_test)+
               geom_voronoi(aes(long,lat,fill=elev),outline=border)

#Discrete case
discrete =   ggplot(ncdc_discrete)+
               geom_voronoi(aes(long,lat,fill=elev),outline=border)


#Finally, we test to test if the plots look correct
test_that("Voronoi diagram outlines work correctly with blank diagram",{
  vdiffr::expect_doppelganger("Border with blank diagram",blank,path="")
})

test_that("Voronoi diagram outlines work correctly with continuous fill",{
  vdiffr::expect_doppelganger("Border with Continuous Fill",continuous,path="")
})

test_that("Voronoi diagram outlines work correctly with discrete fill",{
  vdiffr::expect_doppelganger("Border with Discrete Fill",discrete,path="")
})
