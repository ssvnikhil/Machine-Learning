#   Multiple Linear Regression

# 1.    Working Directory
# 2.    Data Preprocessing Template


# Importing the Dataset
dataset = read.csv('50_Startups.csv')


#   Encoding categorical data

dataset$State= factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1,2,3))

View(dataset)

#   Splitting the dataset into Training set and Test set

#  install.packages('caTools')
require(caTools)
library(caTools)

set.seed(123)
Split = sample.split(dataset$Profit, SplitRatio = 0.8)

training_set = subset(dataset, Split == TRUE)
test_set = subset(dataset, Split == FALSE)

#   Feature Scaling

# training_set = scale(training_set)
# test_set = scale(test_set) errors come because it contain factor values but scaling to be done to numeric objects

# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])

#   Fitting the Simple Linear Regression to the Training set
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, 
               data = training_set)
summary(regressor)

regressor = lm(formula = Profit ~ ., data = training_set) # Same as above line
# We can infer from the coefficients that R.D.Spend will have high significant impact on dependent variable Profit

#   Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)


#   Building the optimal model using Backward Elimination method

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, 
               data = dataset) # Here we can use dataset or training_set it is just to see the P-value
summary(regressor)

# So we see state2 and state3 will have very high p-values and can be eliminated
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, 
               data = training_set)
summary(regressor)

# So we see Administration will have very high p-values and can be eliminated
regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend, 
               data = training_set)
summary(regressor)

# So we see Marketing.Spend will have very high p-values and can be eliminated
regressor = lm(formula = Profit ~ R.D.Spend, 
               data = training_set)
summary(regressor)



