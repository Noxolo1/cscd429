# import data
data <- read.csv("C:/Users/Nate/Downloads/data.csv")
View(data)

# install packages
install.packages("arules")
library(arules)

# Assuming data is a data frame with TRUE/FALSE values
transactions <- as(data, "transactions")

# Use the Apriori algorithm to find frequent itemsets
frequent_itemsets <- apriori(transactions, parameter = list(support = 0.4, confidence = 1),
                             target = "frequent itemsets")
association_rules <- apriori(transactions, parameter = list(support = 0.4, confidence = 1),
                             target = "rules")

# Display frequent itemsets
inspect(frequent_itemsets)

# Display association rules
inspect(association_rules)

