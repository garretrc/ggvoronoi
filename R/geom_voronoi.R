#' Voronoi Diagrams with ggplot2
#'
#' Convenience function for use with \code{\link[ggvoronoi]{stat_voronoi}}.
#' Uses \code{\link[ggplot2]{geom_polygon}} as the default geom and \code{\link[ggvoronoi]{stat_voronoi}} as the default stat.
#' To plot region borders instead of a choropleth map, use \code{\link[ggvoronoi]{stat_voronoi}} with \code{geom="path"},
#' or use \code{fill=NA} with \code{color="black"}.
#' @inheritParams ggplot2::layer
#' @inheritParams ggplot2::geom_point
#' @param outline \code{data.frame} with first column x/longitude, second column y/latitude, and a group column denoting islands or pieces.
#' @import ggplot2 sp deldir raster terra
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
#' ggplot(points) +
#'     geom_voronoi(aes(x=x,y=y,fill=distance))
#'
#' ggplot(points) +
#'     geom_voronoi(aes(x=x,y=y,fill=distance),outline=circle)
#'
#' ggplot(points) +
#'     geom_voronoi(aes(x=x,y=y,fill=distance),fill=NA,color="black")

geom_voronoi = function (mapping = NULL, data = NULL, stat = StatVoronoi, position = "identity",
                         ...,na.rm = FALSE, show.legend = NA, inherit.aes = TRUE, outline = NULL)
{
  if(is.null(mapping)){
    mapping = aes(group=NA)
  }else{
    mapping$group=NA
  }
  layer(data = data, mapping = mapping, stat = stat, geom = GeomPolygon,
        position = position, show.legend = show.legend, inherit.aes = inherit.aes,
        params = list(na.rm = na.rm, outline = outline,...))
}
