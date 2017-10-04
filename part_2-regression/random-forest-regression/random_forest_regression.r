#  Random Forest Regression 

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

#   Fitting the Random Forest Regression to the dataset
#install.packages('randomForest')
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1],
                         y = dataset$Salary,
                         ntree = 500)

#   Predicting a new result with Random Forest Regression
y_pred = predict(regressor, data.frame(Level = 6.5))


#   Visualizing the Random Forest Regression results (Higher resolution and Smoother Curve)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)

ggplot() +
    geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') +
    geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))), colour = 'blue') +
    ggtitle('Truth or Bluff (Regression Model') +
    xlab('Level') +
    ylab('Salary')