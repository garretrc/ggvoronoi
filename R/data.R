#' Bike Rack Locations in Oxford, Ohio.
#'
#' A dataset with the location of bike racks in Oxford, Ohio. Includes Miami University's campus and Uptown Oxford.
#'
#' @format A data frame with 205 rows and 3 variables:
#' \describe{
#'   \item{x}{longitude coordinate}
#'   \item{y}{latitude coordinate}
#'   \item{name}{location name, if recorded}
#' }
#' @source Miami University
"bikes"

#' Random Points.
#'
#' A random set of points intended to demonstrate geom_voronoi().
#'
#' @format A data frame with 200 rows and 3 variables:
#' \describe{
#'   \item{x}{random integer between 1 and 100}
#'   \item{y}{random integer between 1 and 100}
#'   \item{fill}{distance of point from (50,50)}
#' }
#' @source Robert Garrett
"points"

#' A circle
#'
#' A code-generated circle that intersects the points dataset.
#'
#' @format A data frame with 2500 rows and 3 variables:
#' \describe{
#'   \item{x}{x coordinate of the circle}
#'   \item{y}{y coordinate of the circle}
#'   \item{group}{value for use in spatial methods}
#' }
#' @source Robert Garrett
"circle"
