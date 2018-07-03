#' Voronoi Diagrams with ggplot2
#'
#' Convenience function for use with stat_voronoi
#' @inheritParams ggplot2::layer
#' @inheritParams ggplot2::geom_point
#' @keywords voronoi, choropleth
#' @import ggplot2 sp deldir rgeos raster
#' @export
#' @examples ggplot(points)+geom_voronoi(aes(x=x,y=y,fill=fill)))

geom_voronoi = function (mapping = NULL, data = NULL, stat = StatVoronoi, position = "identity", 
                         ...,na.rm = FALSE, show.legend = NA, inherit.aes = TRUE, outline = NULL) 
{
  layer(data = data, mapping = mapping, stat = stat, geom = GeomPolygon, 
        position = position, show.legend = show.legend, inherit.aes = inherit.aes, 
        params = list(na.rm = na.rm, outline = outline,...))
}
