#Test cases involving the plotting of Voronoi diagrams with discrete coloring
context("Voronoi Diagram Heatmaps: Discrete")
library(ggvoronoi)

#use subset of included data file to perform testing
oxford_test = oxford_bikes[1:5,]

#Now we create the plots we want to test. 
#Each of these should have identical output despite having different function calls.
plots = list()

#Mappings in the geom/stat
plots[[1]] = ggplot(oxford_test)+
  geom_voronoi(aes(x,y,fill=name),color="black")

plots[[2]] = ggplot(oxford_test)+
  stat_voronoi(aes(x,y,fill=name),color="black")

#Mappings in ggplot statement
plots[[3]] = ggplot(oxford_test,aes(x,y,fill=name))+
  geom_voronoi(color="black")

plots[[4]] = ggplot(oxford_test,aes(x,y,fill=name))+
  stat_voronoi(color="black")

#Mixture of the above tests
plots[[5]] = ggplot(oxford_test,aes(x))+
  geom_voronoi(aes(y=y,fill=name),color="black")

plots[[6]] = ggplot(oxford_test,aes(fill=name))+
  stat_voronoi(aes(x,y),color="black")

#Finally, we test to see if all of these plots are the same
test_that("Voronoi diagram heatmaps work correctly with discrete fill",{
  for(i in 1:length(plots)){
    vdiffr::expect_doppelganger("Heatmap with Discrete Fill",plots[[i]],path="")
  }
})
