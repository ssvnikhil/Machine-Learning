#   Multiple Linear Regression
# To set the working directory save this .py file where we have the Data.csv file 
# and then press the Run button.  This will automatically set the working directory.
#   Importing the data from preprocessing data
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd 

dataset = pd.read_csv('50_Startups.csv')

# iloc integer location based [rows, columns] : means all rows :-1 all columns except last one
X = dataset.iloc[:, :-1].values

# In python indexes are started from 0 and R starts from 1
y = dataset.iloc[:, 4].values

#   Categorical Data
#   Encoding Independent Data
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_X = LabelEncoder()
X[:,3] = labelencoder_X.fit_transform(X[:,3])
onehotencoder = OneHotEncoder(categorical_features= [3])
X = onehotencoder.fit_transform(X).toarray()

#   Avoiding Dummy Variable Trap
X = X[:, 1:] 
#In the above thing it The above column will start from 1 to end.

#Splitting the dataset into Training set and Test set
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X,y, test_size = 0.2, random_state =0)

#   Feature Scaling
# For multi-comment line use """ This will not be executed """ 
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)"""

#   Fitting Multiple Linear Regression to the Training set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, y_train)

#   Predicting the Test set results
y_pred = regressor.predict(X_test)

#   Building the model using Backword Elimination
import statsmodels.formula.api as sm
X = np.append(arr = np.ones((50,1)).astype(int), values = X, axis = 1)
X_opt = X[:, [0,1,2,3,4,5]]
regressor_OLS = sm.OLS(endog = y, exog = X_opt).fit()
regressor_OLS.summary()

#   Omit the variables which have prob more than .95
X_opt = X[:, [0,1,3,4,5]]
regressor_OLS = sm.OLS(endog = y, exog = X_opt).fit()
regressor_OLS.summary()

#   Omit the variables until you have P < SL
X_opt = X[:, [0,3,4,5]]
regressor_OLS = sm.OLS(endog = y, exog = X_opt).fit()
regressor_OLS.summary()

X_opt = X[:, [0,3,5]]
regressor_OLS = sm.OLS(endog = y, exog = X_opt).fit()
regressor_OLS.summary()

X_opt = X[:, [0,3]]
regressor_OLS = sm.OLS(endog = y, exog = X_opt).fit()
regressor_OLS.summary()

# End of Backward ELimination Algorithm

# I would like to visualize the performance of R&D vs Profit scale


