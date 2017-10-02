----------Polynomial Regression-----------

Problem Statement:

A Human Resource team working for a big company wants to hire a new employee. 
So, while negotiating with the employee for his future salary he says he had more than 10 years of experience and was paid $160,000.
Now the H.R guy acts as a detective agent to check whether the employee is providing the true data or not. 
So, he calls to employee's previous company and asks about his details. All the company provides is a data called 'Position_Salaries'
and says the employee worked as a Region Manager for 2 years and it takes 4 years for a Region Manager to become a Partner.
With this set of details the H.R guy builds a Machine Learning Model and tries to predict the employee's salary.


To solve this problem, we use Polynomial Regression Model ( y = b0 + b1x1 + b2(x1^2) + b3(x1^3) + ---- + bn(x1^n) )
Polynomial Regression is a non-linear Regression.

While plotting the values of the dataset we can clearly see the pattern is an exponential model which straight away rules out Linear Regression.

To Understand this problem we keep Linear Regression model as a reference model and we compare it with Polynomial Regression 

Once the model is built, we visualize it through graphs and conclude that Linear Regression is not suitable for this method.

Note: More the number of degrees we take in to account for polynomial regression better the results are displayed.

It can easily seen in graphs which had degrees = 2, 3 and 4.

Now, coming back to the problem once we built both Linear and Polynomial Regressions.
We try to predict the employee salary based on these two regressions.

Linear Regression displays the outcome to be $330,000 where as Polynomial Regression shows $158,000.

Therefore, He feels happy as the employee was truthful towards Salary information and hires him.
