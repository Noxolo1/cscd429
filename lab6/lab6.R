# import data
synthetic_control_data <- read.csv("~/Downloads/synthetic_control_data.csv", header=FALSE)
View(synthetic_control_data)

# perform clustering with kmeans and k = 6
kmeans_result <- kmeans(synthetic_control_data, centers = 6)
print(kmeans_result)

# add clusters back to the original data
synthetic_control_data$cluster <- kmeans_result$cluster
View(synthetic_control_data)

cluster1_data <- subset(synthetic_control_data, cluster == 1)
cluster2_data <- subset(synthetic_control_data, cluster == 2)
cluster3_data <- subset(synthetic_control_data, cluster == 3)
cluster4_data <- subset(synthetic_control_data, cluster == 4)
cluster5_data <- subset(synthetic_control_data, cluster == 5)
cluster6_data <- subset(synthetic_control_data, cluster == 6)
View(cluster1_data)

# import ggplot
library(ggplot2)
library(tidyr) 
library(MASS)

parcoord(cluster1_data[,c(1:60)] )
parcoord(cluster1_data[,c(1:60)] , col= "red", ylim = c(0, 1))

