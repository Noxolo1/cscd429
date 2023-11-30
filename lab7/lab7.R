# import data
data <- read.csv("~/Downloads/data.csv")
View(data)

# install packages
install.packages("arules")
library(arules)

# Assuming data is a data frame with TRUE/FALSE values
transactions <- as(data, "transactions")

# Use the Apriori algorithm to find frequent itemsets
frequent_itemsets <- apriori(transactions, parameter = list(support = 0.4, confidence = 1))

# Extract association rules from frequent itemsets
association_rules <- as(frequent_itemsets, "rules")

# Display frequent itemsets
inspect(frequent_itemsets)

# Display association rules
inspect(association_rules)
