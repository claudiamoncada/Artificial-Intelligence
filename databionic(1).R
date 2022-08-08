# Data Bionic Swarm
# Project 1

#librarys
library(DatabionicSwarm)
library(GeneralizedUmatrix)
library(ProjectionBasedClustering)

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






#____________Second Example: LSUN leucemia _________________________

#First Module: Projection of High-dimensional Data
data('Lsun3D')
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



#____________ Clustering Accuracy ____________________
ClusteringAccuracy(Hepta$Cls,Cls)
ClusteringAccuracy(Lsun3D$Cls,Cls)
