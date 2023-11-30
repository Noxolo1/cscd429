# import data
data <- read.csv("~/Downloads/data.csv")
View(data)

# install packages
install.packages("arules")
library(arules)

install.packages("devtools")

# Install fim4r package
devtools::install_github("mhahsler/arules", force = TRUE)
library(arules)

transactions <- as(data, "transactions")

# Apply FP-Growth algorithm
frequent_itemsets <- apriori(transactions, support = 0.4, 
                           confidence = 1.0, verbose = TRUE)

# Extract Closed Frequent Itemsets
closed_itemsets <- is.closed(frequent_itemsets)

# Display frequent itemsets
inspect(frequent_itemsets)

# Display closed frequent itemsets
inspect(closed_itemsets)