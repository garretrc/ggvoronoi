% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{ncdc_locations}
\alias{ncdc_locations}
\title{Locations and Elevation of NCDC Weather Stations}
\format{
A data frame with 65804 rows and 6 variables:
\describe{
  \item{ID}{ID number to connect the data back to other NCDC data}
  \item{country}{country that the site is in. USA, Canada or Mexico}
  \item{state}{two character state/province abbreviation that the site is in}
  \item{lat}{latitude coordinate}
  \item{long}{longitude coordinate}
  \item{elev}{site elevation in meters}
}
}
\source{
\href{https://www.ncei.noaa.gov/products/land-based-station}{National Climatic Data Center}
}
\usage{
ncdc_locations
}
\description{
A dataset containing identifying information as well as coordinates and elevation for each unique North American land-based weather station in the National Climatic Data Center.
Note that sites with a missing elevation in the raw data (recorded as -999.9) have been removed.
Some sites have a potentially erroneous recorded elevation of zero meters.
}
\keyword{datasets}
