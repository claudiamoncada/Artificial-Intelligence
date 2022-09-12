# Data Bionic Swarm
# Project 1
# Moncada C, Garcia M, Almachi C

#library
library(DatabionicSwarm)
library(GeneralizedUmatrix)
library(ProjectionBasedClustering)
library(ggstatsplot)

# Delete outliers
Lsun3D$Data <- Lsun3D$Data[-c(401,402,403,404),]
Lsun3D$Cls <- Lsun3D$Cls[-c(401,402,403,404)]

# First Module
projection = Pswarm(Lsun3D$Data,
                    Cls = Lsun3D$Cls,
                    PlotIt = T,
                    Silent = T)

#Second Module: Generalized Umatrix
genUmatrixList = GeneratePswarmVisualization(
  Data = Lsun3D$Data,
  projection$ProjectedPoints,
  projection$LC)
GeneralizedUmatrix::plotTopographicMap(
  genUmatrixList$Umatrix, 
  genUmatrixList$Bestmatches)

#Third Module: Interactive Clustering
Cls = DBSclustering(
  k = 3,
  Lsun3D$Data,
  genUmatrixList$Bestmatches,
  genUmatrixList$LC,
  PlotIt = FALSE)
GeneralizedUmatrix::plotTopographicMap(
  genUmatrixList$Umatrix, 
  genUmatrixList$Bestmatches,
  Cls)


#  Clustering Accuracy Lsun3d
ClusteringAccuracy(Lsun3D$Cls,Cls)
