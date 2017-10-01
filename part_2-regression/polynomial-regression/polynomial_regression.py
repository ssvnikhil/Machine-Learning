# Setting Working Directory
# Import Data Preprocessing Template

import numpy as np

# matplotlib is used for plotting charts, ... etc
import matplotlib.pyplot as plt

# pandas are used for importing datasets and managing them.
import pandas as pd 

dataset = pd.read_csv('Position_Salaries.csv')

X = dataset.iloc[:, 1:2].values
# In Python Upper bound is excluded and Inner bound is included

y = dataset.iloc[:, 2].values


#Splitting the dataset into Training set and Test set
"""from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X,y, test_size = .2, random_state =0)"""

#   Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)"""

#   Fitting Linear Regression to the dataset
from sklearn.linear_model import LinearRegression
lin_reg = LinearRegression()
lin_reg.fit(X, y)

#   Fitting Polynomial Regression to the dataset
from sklearn.preprocessing import PolynomialFeatures
poly_reg = PolynomialFeatures(degree = 2)
X_poly = poly_reg.fit_transform(X)

# Till now we have been able to create X_poly variable which contains polynomial variable terms
lin_reg_2 = LinearRegression()
lin_reg_2.fit(X_poly, y)

#   Visualizing the Linear Regression Results
plt.scatter(X, y, color = 'red')
plt.plot(X, lin_reg.predict(X), color = 'blue')
plt.title('Truth or Bluff (Linear Regression)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()

#   Visualizing the Polynomial Regression Results

#   To get a smooth continuous curve we use arrange and reshape function

#   X_grid = np.arange(min(X), max(X), 0.1)
#   X_grid = X_grid.reshape((len(X_grid), 1))

plt.scatter(X, y, color = 'red')
#   plt.plot(X_grid, lin_reg_2.predict(poly_reg.fit_transform(X_grid)), color = 'blue')
plt.plot(X, lin_reg_2.predict(poly_reg.fit_transform(X)), color = 'blue')
plt.title('Truth or Bluff (Polynomial Regression with degree 2)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()

#   Predicting a new result with Linear Regression
lin_reg.predict(6.5)

#   Predicting a new result with Polynomial Regression
lin_reg_2.predict(poly_reg.fit_transform(6.5))





