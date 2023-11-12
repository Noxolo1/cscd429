# import data
synthetic_control_data <- read.csv("~/Downloads/synthetic_control_data.csv", header=FALSE)
View(synthetic_control_data)

# perform clustering with kmeans and k = 6
kmeans_result <- kmeans(synthetic_control_data, centers = 6)
print(kmeans_result)

# Add cluster assignments back to the original data
synthetic_control_data$cluster <- kmeans_result$cluster
View(synthetic_control_data)

cluster1_data <- subset(kmeans_result, cluster == 1)
cluster2_data <- subset(kmeans_result, cluster == 2)
cluster3_data <- subset(kmeans_result, cluster == 3)
cluster4_data <- subset(kmeans_result, cluster == 4)
cluster5_data <- subset(kmeans_result, cluster == 5)
cluster6_data <- subset(kmeans_result, cluster == 6)



# import ggplot
library(ggplot2)

library(ggplot2)

# Plot for Cluster 1
ggplot(data = cluster1_data, aes(x = x_variable, y = y_variable)) +
  geom_line() +
  ggtitle("Cluster 1")




