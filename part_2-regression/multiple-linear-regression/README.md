----------Multiple Linear Regression-----------

Problem Statement:

50 Start up companies data were given where investments are broadly divided into three categories:
R&D Spend, Administration and Marketing_Spend. These three sections are the independent variables of the given problem.

Now Company ultimately wants to get maximum Profit which is the dependent variable on the above three independent variables.

We need to find out which independent variable impacts more on the dependent variable 
ie) On which factor should the company invest more so as to get high profits.

To solve this problem, we use Multiple Linear Regression Model ( y = b0 + b1x1 + b2x2 + ---- + bnxn )

Another interesting thing while solving this problem:
	we need break the categorical variable 'State' which is also an independent variable into Dummy variables and should avoid Dummy variable trap.
	
	There are 5 methods to build a Multiple linear Regression model.
	1. All-in
	2. Backward Elimination
	3. Forward Selection
	4. BiDirectional Elimination
	5. Score Comparison
	
	
So, we use Backward Elimination method in building a model for this problem.

Once the model is built, infulence of independent variables on dependent variable will be calculated by p-value keeping the significance level = 0.5.
Less p-value is more statistically significant ie) it impacts more!

Upon Visualizing p-values we understand that R&D Spend has more importance on Profit.
Graphs are developed which shows us how well machine has understood by training_set and its performance on test_set.
