#import
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn import preprocessing
from sklearn import utils

#testing model
from sklearn.metrics import confusion_matrix
from sklearn.metrics import f1_score
from sklearn.metrics import accuracy_score
from sklearn.metrics import mean_squared_error
from sklearn.metrics import classification_report
import seaborn as sns

#testing model 

import numpy as np
import pandas as pd
import math
import matplotlib.pyplot as plt
import seaborn as sns


#import training data using specified path
df = pd.read_csv('/Users/nwilson/Documents/GitHub/cscd429/TitanicPrediction_Python/Data/train.csv')
print(df)

# get some info on data
df.shape()
df.head()



def knn(k, ):
    return

def euclideanDistance(p, q):

