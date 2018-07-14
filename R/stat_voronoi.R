#' Voronoi Diagrams with ggplot2
#'
#' Use geom="polygon" for choropleth heatmap or geom="path" for region borders.
#' @inheritParams ggplot2::layer
#' @inheritParams ggplot2::geom_point
#' @param outline data.frame with first column x/longitude, second column y/latitude, and a group column denoting islands or pieces.
#' @keywords voronoi, choropleth
#' @import ggplot2 sp deldir rgeos raster
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
#'     stat_voronoi(aes(x=x,y=y,fill=distance))
#'
#' ggplot(points) +
#'     stat_voronoi(aes(x=x,y=y),geom="path")
#'
#' ggplot(points) +
#'     stat_voronoi(aes(x=x,y=y,fill=distance),outline=circle)

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
