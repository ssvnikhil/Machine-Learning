#   Decision Tree Regression

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
# training_set = scale(dataset)
# test_set = scale(test_set)

#   Fitting the Decision Tree Regression to the dataset
install.packages('rpart')
require(rpart)
regressor = rpart(formula = Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 1))

#   Predicting a new result with Decision Tree Regression Model
y_pred = predict(regressor, data.frame(Level = 6.5))

#   Visualizing the Decision Tree Regression Model Results
# library(ggplot2)
# ggplot() +
#     geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') +
#     geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)), colour = 'blue') +
#     ggtitle('Truth or Bluff (Decision Tree Regression Model') +
#     xlab('Level') +
#     ylab('Salary')



#   Visualizing the Decision Tree Regression Model results (Higher resolution and Smoother Curve)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)

ggplot() +
    geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') +
    geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))), colour = 'blue') +
    ggtitle('Truth or Bluff (Decision Tree Regression Model)') +
    xlab('Level') +
    ylab('Salary')