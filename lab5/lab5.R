#install libraries
install.packages('rpart')
install.packages('caret')
install.packages('rpart.plot')

#load libraries
library(rpart)
library(caret)
library(rpart.plot)

# step 1
# imported mushrooms into r
str(mushrooms)




# step 2
# veil type attribute only contains the letter p
# this attribute may not be useful for classification as it could
# introduce bias as there is only one choice for the attribute 
# one way we could handle it is to remove the attribute 
# as we dont know what the p is representing in the data set

# step 2.1 
df_mushrooms <- mushrooms[-c(17)]
str(df_mushrooms)

# step 2.2.1 
mushrooms_contingency_table <- table(df_mushrooms$type ,df_mushrooms$odor)
print(mushrooms_contingency_table)

# step 2.2.2
# from the contingency table it seems as though the variables are correlated
# when odor = a, l, or n there is a very small chance the class label will be p
# when odor = c, f, m, p, s, or y there is a very small chance the class label will be e
# step 2.2.2
chisq.test(mushrooms_contingency_table)

# chi square test validates that there is correlation between the two 
# variables as the chisqr val >>>>>> and the probability the two values are independent
# is extremely low 

# step 2.2.3
dt = sort(sample(nrow(df_mushrooms), nrow(df_mushrooms)*.8))
train_mushroom <-data[dt,]
test_mushroom <-data[!dt,]


