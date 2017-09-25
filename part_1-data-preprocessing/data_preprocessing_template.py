# Data Preprocessing

# Importing the Libraries

# library is a tool that you can use to make a specific job.

# numpy is used for mathematical tools
import numpy as np

# matplotlib is used for plotting charts, ... etc
import matplotlib.pyplot as plt

# pandas are used for importing datasets and managing them.
import pandas as pd 

# To set the working directory save this .py file where we have the Data.csv file 
# and then press the Run button.  This will automatically set the working directory.


dataset = pd.read_csv('Data.csv')

# iloc integer location based [rows, columns] : means all rows :-1 all columns except last one
X = dataset.iloc[:, :-1].values

# In python indexes are started from 0 and R starts from 1
# 0 column for country; 1 - Age; 2 - Salary; 3 - Purchased
y = dataset.iloc[:, 3].values


# sklearn means scikit-learning. preprocessing data so preprocessor
# Imputer class allows us to handle missing data
from sklearn.preprocessing import Imputer

# Press ctrl + i for help box axis = 0 for columns
imputer = Imputer(missing_values = 'NaN', strategy = 'mean', axis = 0)

# fit to make the mean values fit in the missing columns
# 1:3 upper bound will be 3. In python indexes start from 0.
# Though 2nd is the column we have we need to add 1 and keep it as upper bound
imputer = imputer.fit(X[:, 1:3])

# To transform the values into X matrix we use the below function
X[:, 1:3] = imputer.transform(X[:, 1:3])



#   Categorical Data
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_X = LabelEncoder()
X[:,0] = labelencoder_X.fit_transform(X[:,0])
onehotencoder = OneHotEncoder(categorical_features= [0])
X = onehotencoder.fit_transform(X).toarray()

labelencoder_y = LabelEncoder()
y = labelencoder_y.fit_transform(y)


#Splitting the dataset into Training set and Test set
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X,y, test_size = .2, random_state =0)

#   Feature Scaling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)

# Here y does not need a feature scaling because it contains only two values yes and no 0 ,1 




