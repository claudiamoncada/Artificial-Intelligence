# Data Bionic Swarm
# Project 1
# Moncada C, Garcia M, Almachi C

#library
library(DatabionicSwarm)
library(GeneralizedUmatrix)
library(ProjectionBasedClustering)
library(ggstatsplot)
library(FCPS)

# Delete outliers
Tetra$Data <- Tetra$Data [-c(399,400),]
Tetra$Cls <- Tetra$Cls[-c(399,400)]

#___________________________________________

# First Module
data('Tetra')
InputDistances = as.matrix(dist(Tetra$Data))
projection = Pswarm(InputDistances)


# Second Module
genUmatrixList = GeneratePswarmVisualization(
  Data = Tetra$Data, 
  projection$ProjectedPoints, 
  projection$LC)

GeneralizedUmatrix::plotTopographicMap(
  genUmatrixList$Umatrix, 
  genUmatrixList$Bestmatches, 
  NoLevels = 10)


# Third Module
Cls = DBSclustering(
  k = 4,
  Tetra$Data,
  genUmatrixList$Bestmatches,
  genUmatrixList$LC,
  PlotIt = FALSE
)
GeneralizedUmatrix::plotTopographicMap(
  genUmatrixList$Umatrix,
  genUmatrixList$Bestmatches,
  Cls,
  NoLevels = 10)

#____________ Clustering Accuracy ____________
ClusteringAccuracy(Tetra$Cls,Cls)

