#   Support Vector Regression Template

#   Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#   Splitting the data into Training Set and Testing Set
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Salary, SplitRatio = 2/3)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#   Fitting the SVR to the dataset
install.packages('e1071')
library(e1071)
regressor  = svm(formula = Salary ~ .,
                 data = dataset,
                 type = 'eps-regression')


#   Predicting a new result with SVR Model
y_pred = predict(regressor, data.frame(Level = 6.5))

#   Visualizing the SVR Model Results
library(ggplot2)
ggplot() +
    geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') +
    geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)), colour = 'blue') +
    ggtitle('Truth or Bluff (Support Vector Regression Model') +
    xlab('Level') +
    ylab('Salary')


#   Visualizing the Regression Model results (Higher resolution and Smoother Curve)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)

ggplot() +
    geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') +
    geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))), colour = 'blue') +
    ggtitle('Truth or Bluff (Support Vector Regression Model with higher resolution and smoother curve') +
    xlab('Level') +
    ylab('Salary')