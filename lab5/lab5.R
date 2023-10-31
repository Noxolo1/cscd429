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
dt <- sample(nrow(df_mushrooms), nrow(df_mushrooms)*0.8, replace=FALSE)
train_mushroom <- df_mushrooms[dt, ]
test_mushroom <- df_mushrooms[-dt, ]
str(train_mushroom)
str(test_mushroom)

# step 3.1
decision_tree <- rpart(type~., data=train_mushroom)
rpart.plot(decision_tree)

# step 3.2
predictions <- predict(decision_tree, newdata = test_mushroom, type = "class") 

# convert characters to factors
test_mushroom$type <- as.factor(test_mushroom$type)

# make sure both vars have same level of class label
# should be e and p
levels(test_mushroom$type)
levels(predictions)

confusion_matrix <- confusionMatrix(predictions, test_mushroom$type)
print(confusion_matrix)

















