# First Set the working directory
# Second import the preprocessing data


# Importing the Dataset
dataset = read.csv('Salary_Data.csv')

#   Splitting the dataset into Training set and Test set

#  install.packages('caTools')
require(caTools)
library(caTools)

set.seed(123)
Split = sample.split(dataset$Salary, SplitRatio = 2/3)

training_set = subset(dataset, Split == TRUE)
test_set = subset(dataset, Split == FALSE)

#   Feature Scaling

# training_set = scale(training_set)
# test_set = scale(test_set) errors come because it contain factor values but scaling to be done to numeric objects

# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])

#   Fitting the Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience, 
               data = training_set)

#   Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

y_pred

#   Visualizing the Training set
library(ggplot2)

ggplot() +
    geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), colour = 'red') +
    geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), colour = 'blue') +
    ggtitle('Salary vs Years of Experience (Training set)') +
    xlab('Years of Experience') +
    ylab('Salary')

#   Visualizing the Test set
ggplot() +
    geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), colour = 'red') +
    geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), colour = 'blue') +
    ggtitle('Salary vs Years of Experience (Test set)') +
    xlab('Years of Experience') +
    ylab('Salary')