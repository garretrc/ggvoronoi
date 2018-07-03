#' Create Data Frame from voronoi_polygons output
#'
#' Use this before attempting to plot with geom_polygon
#' @param vor_spdf Output from voronoi_polygons (Spatial Polygons Data Frame)
#' @keywords voronoi, choropleth
#' @import ggplot2
#' @export
#' @examples fortify_voronoi(vor_spdf)
#' fortify_voronoi()

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
