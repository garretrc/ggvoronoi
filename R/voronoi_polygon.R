#' Voronoi Diagram from Data Frame
#'
#' Create a Voronoi diagram for analysis or plotting with geom_polygon.
#' @param data data.frame containing a set of points to make voronoi regions and any additional desired columns.
#' @param x numeric vector (for example longitude).
#' @param y numeric vector (for example latitude).
#' @param outline data.frame with first column x/longitude, second column y/latitude, and a group column denoting islands or pieces.
#' @param data.frame output as data.frame? You will lose information if you do this. For use in StatVoronoi.
#' @keywords voronoi, choropleth
#' @import ggplot2 sp deldir rgeos raster
#' @export
#' @examples 
#' vor_spdf = voronoi_polygon(data=points,x="x",y="y",outline=circle)
#' vor_df = fortify_voronoi(vor_spdf)
#' ggplot(vor_df)+geom_polygon(aes(x=x,y=y,fill=fill,group=group))

voronoi_polygon = function(data, x = 'x', y = 'y', outline = NULL, data.frame=FALSE) 
{
  if(class(data) != "data.frame"){
    stop('"Data" must be of class data.frame')
  }
  xname = x
  yname = y
  x = data[,x]
  y = data[,y]
  if(!is.null(outline)){
    if(class(outline)=="SpatialPolygons"){
      outline = SpatialPolygonsDataFrame(outline,data.frame(rep(NA,length(outline))))
    }
    if(class(outline) != "data.frame" & class(outline) != "SpatialPolygonsDataFrame"){
      outline = NULL
      warning("Outline must be of class data.frame or SpatialPolygonsDataFrame. No outline will be used.")
    }
    else if(class(outline) == "data.frame"){
      if(!is.numeric(outline[,1]) | !is.numeric(outline[,2])){
        warning("Columns 1 and 2 of Outline must be numeric. No outline will be used.")
        break
      }
      if(is.null(outline$group)){
        outline$group = rep(1, nrow(outline))
      }
      outline_polygons = lapply(unique(outline$group), function(group){
        poly = Polygon(outline[outline$group == group,1:2])
        Polygons(list(poly), ID = as.character(group))
      })
      outline_spdf = SpatialPolygonsDataFrame(SpatialPolygons(outline_polygons), 
                                              data = data.frame(group = unique(outline$group),
                                                                row.names = unique(outline$group)))
    }else if(class(outline) == "SpatialPolygonsDataFrame"){
      outline_spdf = outline
    }
  }
  if(!is.null(outline)){
    extent = extent(outline_spdf) 
    rw = c(min(extent@xmin, min(x)), 
           max(extent@xmax, max(x)),
           min(extent@ymin, min(y)),
           max(extent@ymax, max(y)))
  }else{
    rw = NULL
  }
  pts = SpatialPointsDataFrame(cbind(x, y), data, match.ID = T)
  vor_desc = tile.list(deldir(pts@coords[, 1], pts@coords[, 2], 
                              rw = rw,suppressMsge = TRUE))
  vor_polygons <- lapply(1:(length(vor_desc)), function(i) {
    tmp <- cbind(vor_desc[[i]]$x, vor_desc[[i]]$y)
    tmp <- rbind(tmp, tmp[1, ])
    Polygons(list(Polygon(tmp)), ID = i)
  })
  rownames(pts@data) = sapply(slot(SpatialPolygons(vor_polygons), 
                                   "polygons"), slot, "ID")
  vor_spdf = SpatialPolygonsDataFrame(SpatialPolygons(vor_polygons), 
                                      data = pts@data)
  if(!is.null(outline)){
    vor_spdf = rgeos::intersect(gBuffer(vor_spdf, byid=TRUE, width=0), gBuffer(outline_spdf, byid=TRUE, width=0))
  }
  
  if(data.frame==FALSE){
    return(vor_spdf)
  }else{
  
  voronoi = suppressMessages(ggplot2::fortify(vor_spdf, data)) 
  
  names(voronoi)[1:2] = names(data[,c(xname, yname)])
  
  for(name in names(data)){
    if(!(name %in% names(voronoi))){
      voronoi[,name] = unlist(lapply(1:length(vor_spdf@polygons), function(i){
        unlist(lapply(1:length(slot(vor_spdf@polygons[[i]], 'Polygons')), function(j){
          rep(vor_spdf@data[i,name], nrow(slot(slot(vor_spdf@polygons[[i]], 'Polygons')[[j]], 'coords')))
        }))
      }))
    }
  }
  
  return(voronoi)
  }
}
