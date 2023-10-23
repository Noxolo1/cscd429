# import
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn import preprocessing
from sklearn import utils

# testing model
from sklearn.metrics import confusion_matrix
from sklearn.metrics import f1_score
from sklearn.metrics import accuracy_score
from sklearn.metrics import mean_squared_error
from sklearn.metrics import classification_report
import seaborn as sns

# testing model 

import numpy as np
import pandas as pd
import math
import matplotlib.pyplot as plt
import seaborn as sns


# import training data using specified path
df_train = pd.read_csv('/Users/nwilson/Documents/GitHub/cscd429/TitanicPrediction_Python/Data/train.csv')
print(df_train)

#df_test = pd.read_csv('/Users/nwilson/Documents/GitHub/cscd429/TitanicPrediction_Python/Data/test.csv')
#print(df_test)

# drop useless attributes for now
df_train.drop(labels = ["Cabin", "Embarked", "Name", "PassengerId", "Ticket"], inplace = True, axis = 1)
#print(df_train)



def knn(k, ):
    
    return


# function to calculate euclidean distance between 2 points
def euclidean_distance(p,q):
    
    # subtract 2 vectors
    result = p - q

    # transpose array and dot product with original array, to get 
    # sum of squared terms, then sqrt
    return np.sqrt(np.dot(result.tranpose, result))


