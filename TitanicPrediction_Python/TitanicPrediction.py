import pandas as pd
import numpy as np
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
import operator

# load the training and test data

##### THESE WILL NEED TO BE MODIFIED DEPENDING ON WHERE THE DATA IS STORED #####
##### FOR PROGRAM TO RUN COPY PATH OF DATA IN LEFT SIDE FILE DIRECTORY AFTER UPLOADING DATA #####
### SHOULD BE df_train = pd.read_csv('train.csv') AND df_test = pd.read_csv('test.csv') ###
df_train = pd.read_csv('/Users/nwilson/Documents/GitHub/cscd429/TitanicPrediction_Python/Data/train.csv')
df_test = pd.read_csv('/Users/nwilson/Documents/GitHub/cscd429/TitanicPrediction_Python/Data/test.csv')

# drop unwanted columns and handle categorical variables
df_train.drop(labels=["Cabin", "Embarked", "Name", "PassengerId", "Ticket"], inplace=True, axis=1)
df_train['Sex'].replace(['male', 'female'], [0, 1], inplace=True)
# fill missing age values with the average
df_train['Age'].fillna(df_train['Age'].mean(), inplace=True)

# drop unwanted columns and handle categorical variables
df_test.drop(labels=["Cabin", "Embarked", "Name", "PassengerId", "Ticket"], inplace=True, axis=1)
df_test['Sex'].replace(['male', 'female'], [0, 1], inplace=True)
# fill missing age values with the average
df_test['Age'].fillna(df_test['Age'].mean(), inplace=True)

# split data and class label
X_train_data = df_train.drop("Survived", axis=1).values
Y_train_data = df_train["Survived"].values
X_test_data = df_test.drop("Survived", axis=1).values
Y_test_data = df_test["Survived"].values

### define knn algorithm ### 
class k_nearest_neighbors:

    def __init__(self, k):
        self.k=k

    def train_data(self, X_train_data, Y_train_data):
        self.X_train_data = X_train_data
        self.Y_train_data = Y_train_data

    def euclidean_distance(self, x, y):
        return np.linalg.norm(x - y)
    
    def find_nearest_neighbors(self, tupl):
        
        # want to find the nearest neighbors 
        # for each data point

        dist = []

        # calculate distances using i as an index 
        # for each distance
        for i in range(len(self.X_train_data)):
            dist.append((i, self.euclidean_distance(self.X_train_data[i], tupl)))
    
        # sort by distance 
        dist.sort(key=operator.itemgetter(1))

        # want to find top k neighbors and return them
        # these will be the nearest k neighbors
        k_nearest = []
        for i in range(self.k):
            k_nearest.append(dist[i])
        
        return k_nearest
   
    def predict_class_label(self, X_test_data):

        predicted_values = []

        # iterate over every test tuple
        for i in range(len(X_test_data)):
            
            # find the nearest neighbors of each test tuple
            neighbors = self.find_nearest_neighbors(X_test_data[i])
            
            y_values = []
            for j in neighbors:
                y_values.append(self.Y_train_data[j[0]])
            
            # calculate prediction 
            prediction = (sum(y_values) / self.k)

            if(prediction <= 0.5):
                prediction = 0
            else:
                prediction = 1

            predicted_values.append(prediction)
            
        return predicted_values
    

# use knn on test data 
model = k_nearest_neighbors(k=7)
model.train_data(X_train_data, Y_train_data)
predictions = model.predict_class_label(X_test_data)

### print results without adding to csv ###
#for i in range(0, len(predictions)):
    #print(f"Passenger ID {i+1}, Survived = {predictions[i]}, Actual = {Y_test_data[i]}")

### check confusion matrix and accuracy of classification algorithm ###
print("Confusion Matrix:")
print(confusion_matrix(Y_test_data, predictions))

accuracy = accuracy_score(Y_test_data, predictions)
print(f"Accuracy: {accuracy_score(Y_test_data, predictions)}")

### code for printing to csv ###
#output_data = pd.DataFrame({"Passenger ID": range(1, len(predictions) + 1), "Survived": predictions })
#output_data.to_csv('/Users/nwilson/Documents/GitHub/cscd429/TitanicPrediction_Python/Data/output.csv', index=False)