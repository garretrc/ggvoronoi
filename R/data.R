#' Bike Rack Locations in Oxford, Ohio.
#'
#' A dataset with the location of bike racks in Oxford, Ohio. Includes Miami University's campus and Uptown Oxford. 
#' GPS coordinates were measured for each bike rack via handheld GPS receivers. 
#' Off-campus data were gathered for a Miami University GIS class project and 
#' On-campus data were gathered for a Miami University Kinesiology research project.
#' 
#' @format A data frame with 205 rows and 3 variables:
#' \describe{
#'   \item{x}{longitude coordinate}
#'   \item{y}{latitude coordinate}
#'   \item{name}{location name, if recorded}
#' }
#' @source Madeline Maurer (Miami University Department of Geography); 
#' Justin Hopkins, Dr. Helaine Alessio and Amanda Meiering (Miami University Department of Kinesiology)
"oxford_bikes"

#' Locations and Elevation of NCDC Weather Stations
#'
#' A dataset containing identifying information as well as coordinates and elevation for each unique North American land-based weather station in the National Climatic Data Center.
#' Note that sites with a missing elevation in the raw data (recorded as -999.9) have been removed.
#' Some sites have a potentially erroneous recorded elevation of zero meters.
#'
#' @format A data frame with 65804 rows and 6 variables:
#' \describe{
#'   \item{ID}{ID number to connect the data back to other NCDC data}
#'   \item{country}{country that the site is in. USA, Canada or Mexico}
#'   \item{state}{two character state/province abbreviation that the site is in}
#'   \item{lat}{latitude coordinate}
#'   \item{long}{longitude coordinate}
#'   \item{elev}{site elevation in meters}
#' }
#' @source \href{https://www.ncei.noaa.gov/products/land-based-station}{National Climatic Data Center}
"ncdc_locations"

#' Google Map of Oxford, Ohio.
#'
#' A ggmap object containing a static google map image of Oxford, Ohio. Zoomed in to show the Uptown Oxford and Miami University campus areas.
#'
#' @format Large ggmap object
#' @source Google Maps static map api (accessed from 'ggmap' package)
"oxford_map"
