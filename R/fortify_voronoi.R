#' Create Data Frame from voronoi_polygons output
#' 
#' Allows output of \code{\link[ggvoronoi]{voronoi_polygon}} to be plotted using
#' \code{\link[ggplot2]{geom_polygon}}.
#' @param vor_spdf Output from \code{\link[ggvoronoi]{voronoi_polygon}} (\code{\link[sp]{SpatialPolygonsDataFrame}})
#' @import ggplot2
#' @export
#' @examples
#' set.seed(45056)
#' x <- sample(1:200,100)
#' y <- sample(1:200,100)
#' points <- data.frame(x, y,
#'                      distance = sqrt((x-100)^2 + (y-100)^2))
#' circle <- data.frame(x = 100*(1+cos(seq(0, 2*pi, length.out = 2500))),
#'                      y = 100*(1+sin(seq(0, 2*pi, length.out = 2500))),
#'                      group = rep(1,2500))
#' 
#' vor_spdf <- voronoi_polygon(data=points,x="x",y="y",outline=circle)
#' vor_df <- fortify_voronoi(vor_spdf)
#' 
#' ggplot(vor_df) +
#'     geom_polygon(aes(x=x,y=y,fill=distance,group=group))

fortify_voronoi = function(vor_spdf){
  data=vor_spdf@data
  data$id=rownames(vor_spdf@data)

  data$point.x=data[,1]
  data$point.y=data[,2]
  data[,1:2]=NULL
  data$group=NULL

  voronoi = suppressMessages(ggplot2::fortify(vor_spdf, data))

  voronoi = merge(voronoi,data,by="id",all.x=TRUE)

  voronoi$x=voronoi$long
  voronoi$y=voronoi$lat
  voronoi$long=NULL
  voronoi$lat=NULL

  voronoi
}
