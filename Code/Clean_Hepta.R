# Data Bionic Swarm
# Project 1
# Moncada C, Garcia M, Almachi C

#library
library(DatabionicSwarm)
library(GeneralizedUmatrix)
library(ProjectionBasedClustering)
library(ggstatsplot)
library(FCPS)

# Data set has no outliers

#____________ First Example: HEPTA _________________________
# First Module
data('Hepta')
InputDistances = as.matrix(dist(Hepta$Data))
projection = Pswarm(InputDistances)


# Second Module
genUmatrixList = GeneratePswarmVisualization(
  Data = Hepta$Data, 
  projection$ProjectedPoints, 
  projection$LC)

GeneralizedUmatrix::plotTopographicMap(
  genUmatrixList$Umatrix, 
  genUmatrixList$Bestmatches, 
  NoLevels = 10)


# Third Module
Cls = DBSclustering(
  k = 7,
  Hepta$Data,
  genUmatrixList$Bestmatches,
  genUmatrixList$LC,
  PlotIt = FALSE
)
GeneralizedUmatrix::plotTopographicMap(
  genUmatrixList$Umatrix,
  genUmatrixList$Bestmatches,
  Cls,
  NoLevels = 10)

#____________ Clustering Accuracy Hepta ____________
ClusteringAccuracy(Hepta$Cls,Cls)

