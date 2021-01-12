#Test cases involving the building of Voronoi diagrams
context("Voronoi Diagram Building")
library(ggvoronoi)

#use subsets of included data files to perform testing
test_data = list(ncdc_locations[1:10,c(5,4,6)],oxford_bikes[1:5,])

#Helper functions to ensure conditional usage
expect_identical <- function(object, expected, ...) {
  testthat::skip_if_not_installed("vdiffr")
  expect_identical(object, expected, ...)
}

expect_error <- function(oof, ...) {
  testthat::skip_if_not_installed("vdiffr")
  expect_error(oof, ...)
}


#Test: is the voronoi_polygon output in a SpatialPolygonsDataFrame?
test_that("voronoi_polygon outputs a SpatialPolygonsDataFrame by default",{
  for(i in 1:length(test_data)){
    expect_identical(class(voronoi_polygon(test_data[[i]],1,2))[1],"SpatialPolygonsDataFrame")
  }
})

#Test: does voronoi_polygon return a data.frame when asked to?
test_that("voronoi_polygon outputs a fortified data.frame when specified",{
  for(i in 1:length(test_data)){
    expect_identical(class(voronoi_polygon(test_data[[i]],1,2,data.frame = TRUE)),"data.frame")
  }
})

#Test: is the output identical when the user specifies strings instead of column indices?
#Note: this test is better done by mimicking user behavior for each individual test dataset
test_that("voronoi_polygon takes string column indices correctly",{
  expect_identical(voronoi_polygon(test_data[[1]],"long","lat"),
                   voronoi_polygon(test_data[[1]],1,2))
  expect_identical(voronoi_polygon(test_data[[2]],"x","y"),
                   voronoi_polygon(test_data[[2]],1,2))
})

#Test: does voronoi_polygon reject datasets with duplicate points?
test_that("voronoi_polygon rejects dataset with duplicate points",{
  for(i in 1:length(test_data)){
    expect_error(voronoi_polygon(rbind(test_data[[i]],test_data[[i]]),1,2))
  }
})

#Test: does voronoi_polygon reject an empty dataset?
test_that("voronoi_polygon rejects empty data.frame",{
  expect_error(voronoi_polygon(data.frame(),1,2))
})

#Test: does voronoi_polygon throw an error when an object other than a data.frame is supplied?
test_that("voronoi_polygon rejects empty data.frame",{
  fake_data = test_data[[1]]
  class(fake_data) = "data.lame"
  expect_error(voronoi_polygon(fake_data,1,2))
})

#Test: does the output from fortify_voronoi result in a data.frame?
test_that("fortify_voronoi returns a data.frame",{
  for(i in 1:length(test_data)){
    expect_identical(class(fortify_voronoi(voronoi_polygon(test_data[[i]],1,2))),"data.frame")
  }
})
