#' Voronoi Diagrams with ggplot2
#'
#' Use geom="polygon" for choropleth or geom="path" for region borders
#' @inheritParams ggplot2::layer
#' @inheritParams ggplot2::geom_point
#' @param outline data.frame with first column x/longitude, second column y/latitude, and a group column denoting islands or pieces.
#' @keywords voronoi, choropleth
#' @import ggplot2 sp deldir rgeos raster
#' @export
#' @examples ggplot(points)+stat_voronoi(aes(x=x,y=y,fill=fill))

stat_voronoi <-
  function(mapping = NULL,
           data = NULL,
           geom = "polygon",
           position = "identity",
           na.rm = FALSE,
           show.legend = NA,
           inherit.aes = TRUE,
           outline = NULL,
           ...) {
    layer(
      stat = StatVoronoi,
      data = data,
      mapping = mapping,
      geom = geom,
      position = position,
      show.legend = show.legend,
      inherit.aes = inherit.aes,
      params = list(na.rm = na.rm, outline = outline, ...)
    )
  }

#' @rdname stat_voronoi
#' @format NULL
#' @usage NULL
#' @export

StatVoronoi <- ggproto(
  "StatVoronoi",
  Stat,
  required_aes = c("x", "y"),

  compute_group = function(data, scales, outline = NULL) {
    voronoi_polygon(
      data,
      deparse(substitute(x)),
      deparse(substitute(y)),
      outline = outline,
      data.frame = TRUE
    )
  },
  default_aes = aes(fill = NA)
)
