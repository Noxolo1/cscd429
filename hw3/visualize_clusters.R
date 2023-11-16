# import plotting tools
install.packages("GGally")
library(ggplot2)
library(GGally)

# import data
cluster_1 <- read.table("C:/Users/Nate/Documents/GitHub/cscd429/hw3/cluster_1.txt", header = FALSE)
cluster_2 <- read.table("C:/Users/Nate/Documents/GitHub/cscd429/hw3/cluster_2.txt", header = FALSE)
cluster_3 <- read.table("C:/Users/Nate/Documents/GitHub/cscd429/hw3/cluster_3.txt", header = FALSE)
cluster_4 <- read.table("C:/Users/Nate/Documents/GitHub/cscd429/hw3/cluster_4.txt", header = FALSE)
cluster_5 <- read.table("C:/Users/Nate/Documents/GitHub/cscd429/hw3/cluster_5.txt", header = FALSE)
cluster_6 <- read.table("C:/Users/Nate/Documents/GitHub/cscd429/hw3/cluster_6.txt", header = FALSE)


ggparcoord(data = cluster_1[, c(1:60)], 
           columns = 1:60,
           showPoints = FALSE,
           title = "Plot for Cluster 1",
           scale = "globalminmax",
           mapping = aes(color = "red")) +
  scale_x_discrete(labels = paste(" ", 1:60)) +
  labs(x = "Time", y = NULL) 

ggparcoord(data = cluster_2[, c(1:60)], 
           columns = 1:60,
           showPoints = FALSE,
           title = "Plot for Cluster 2",
           scale = "globalminmax",
           mapping = aes(color = "red")) +
  scale_x_discrete(labels = paste(" ", 1:60)) +
  labs(x = "Time", y = NULL) 

ggparcoord(data = cluster_3[, c(1:60)], 
           columns = 1:60,
           showPoints = FALSE,
           title = "Plot for Cluster 3",
           scale = "globalminmax",
           mapping = aes(color = "red")) +
  scale_x_discrete(labels = paste(" ", 1:60)) +
  labs(x = "Time", y = NULL) 

ggparcoord(data = cluster_4[, c(1:60)], 
           columns = 1:60,
           showPoints = FALSE,
           title = "Plot for Cluster 4",
           scale = "globalminmax",
           mapping = aes(color = "red")) +
  scale_x_discrete(labels = paste(" ", 1:60)) +
  labs(x = "Time", y = NULL) 

ggparcoord(data = cluster_5[, c(1:60)], 
           columns = 1:60,
           showPoints = FALSE,
           title = "Plot for Cluster 5",
           scale = "globalminmax",
           mapping = aes(color = "red")) +
  scale_x_discrete(labels = paste(" ", 1:60)) +
  labs(x = "Time", y = NULL) 

ggparcoord(data = cluster_6[, c(1:60)], 
           columns = 1:60,
           showPoints = FALSE,
           title = "Plot for Cluster 6",
           scale = "globalminmax",
           mapping = aes(color = "red")) +
  scale_x_discrete(labels = paste(" ", 1:60)) +
  labs(x = "Time", y = NULL) 
