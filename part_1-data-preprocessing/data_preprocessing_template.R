# Data Preprocessing

# To set the current working directory 
#  On the right side there is a file folder choose the appropriate folder where you want to execute R files
#   Click on More button then set as working directory.

# Importing the Dataset
dataset = read.csv('Data.csv')

# With missing data we do not delete the whole row of observation.
# because it may contain some important information.

# Instead of that we actually place the mean value of the column
# in the missing data.

#   Taking care of missing data

dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x,na.rm = TRUE)),
                     dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary, FUN = function(x) mean(x,na.rm = TRUE)),
                     dataset$Salary)
View(dataset)

?ave

#   Encoding categorical data

dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1,2,3))

dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0,1))

View(dataset)


#   Splitting the dataset into Training set and Test set

install.packages('caTools')
require(caTools)
library(caTools)

set.seed(123)
Split = sample.split(dataset$Purchased, SplitRatio = 0.8)

training_set = subset(dataset, Split == TRUE)
test_set = subset(dataset, Split == FALSE)

#   Feature Scaling

# training_set = scale(training_set)
# test_set = scale(test_set) errors come because it contain factor values but scaling to be done to numeric objects

training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])


