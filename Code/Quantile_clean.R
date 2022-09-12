# Data Bionic Swarm
# Project 1
# Moncada C, Garcia M, Almachi C

library(DatabionicSwarm)
library(GeneralizedUmatrix)
library(ProjectionBasedClustering)
library(ggstatsplot)


# Load the dataset 
data('Hepta')
# Create a boxplot of the dataset, outliers are shown as two distinct points
x<-boxplot(Hepta$Data)$out

#Create a boxplot that labels the outliers  
ggbetweenstats(Hepta$Data, outlier.tagging = TRUE)
Q <- quantile(Hepta$Data, probs=c(.25, .75), na.rm = FALSE)
iqr <- IQR(Hepta$Data)
up <-  Q[2]+1.5*iqr # Upper Range  
low<- Q[1]-1.5*iqr # Lower Range
eliminated<- subset(Hepta, Hepta$Data > (Q[1] - 1.5*iqr) & Hepta$Data < (Q[2]+1.5*iqr))
eliminated

