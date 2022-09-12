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
Leukemia$DistanceMatrix <- Lsun3D$Data[-c(456),]
Leukemia$Cls <- Lsun3D$Cls[-c(456)]

#___________________________________________

# First Module
InputDistances = Leukemia$DistanceMatrix
projection = Pswarm(InputDistances)


# Second Module
genUmatrixList = GeneratePswarmVisualization(
  Data = Leukemia$DistanceMatrix, 
  projection$ProjectedPoints, 
  projection$LC)

GeneralizedUmatrix::plotTopographicMap(
  genUmatrixList$Umatrix, 
  genUmatrixList$Bestmatches, 
  NoLevels = 10)


# Third Module
Cls = DBSclustering(
  k = 4,
  Leukemia$DistanceMatrix,
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
ClusteringAccuracy(Leukemia$Cls,Cls)


