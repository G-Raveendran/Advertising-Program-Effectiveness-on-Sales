#A company, which sells medical supplies to hospitals, clinics, and doctor's offices, had considered the effectiveness of a new advertising program. 
#Management wants to know if the advertisement is related to sales. 
#This company intends to increase the sales with an effective advertising program.
#The company observes for 25 offices the yearly sales (in thousands) and the advertisement expenditure for the new program (in hundreds) 

getwd()

meddcor = read.table("meddcor-4.txt", sep="", header = FALSE)
#no of observation 
n= dim(meddcor)[1]
n
colnames(meddcor) = c("sales", "advertising", "bonuses", "marketshare", "largestcomp", "region")
str(meddcor)
meddcor$region<- as.factor(meddcor$region)
str(meddcor)

######### Estimation #########

# A.) Fit a linear regression. What are the estimated regression coefficients and the estimated regression line?
  
#creatting a linear regression model
model <- lm(sales~advertising, data = meddcor)
summary(model)

#Estimates (beta0,beta1) are (-157.33,2.77) and the regression equation is 
# sales =-157.33 +2.77*advertising

#B Interpret the coefficients.
#The sales increase by $2770 with each $100 additional expenditure in advertisement.
#Or the sales increase with $27.7 with each dollar invested in advertisement expenditure.

#c.) What does the model predict as the advertising expenditure increases for an additional $1,000?
#Solution: The increase in sales is 10×2.77 = 27.7 thousands.

#D.) What sales would you predict for an advertisement expenditure of $30,000? 
#Solution: The predicted sales is -157.33 + 300 × 2.77 = 673.67 thousands
# E.) What is the estimate of the error variance?
#Solution: Estimate σ2 with MSE =  10,281.96[101.4^2]

# F.) What could you say about the sales for an advertising expenditure of $100,000?  	
#Solution: An advertisement expenditure of $100,000 or 1000 units is outside of the observed range and thus we cannot predict the sales since this is extrapolation. 

############# Inference #########

#A.) What is the estimate of the coefficient 𝛽_1 and its variance? What is its sampling distribution? 
#The estimate for β1 is 2.7721. The variance estimate is (0.27942)^2. The sampling distribution is a t-distribution with 23 degrees of freedom.

# B.)What is the estimate of the coefficient 𝛽_0 and its variance?
#The estimate for β0 is -157.3301. The variance estimate is (145.19122)^2.

# C.)Is the coefficient 𝛽_1 statistically significant? What is the p-value of the test? Interpret. 
#The estimate for β1 is statistically significant, as evidenced by a p-value of 8.87×10-10

# D.)Is the coefficient 𝛽_1 statistically positive? What is the p-value of the test? Interpret. 
tvalue = 9.921
1- pt(tvalue, 23)
#𝛽_1 statistically positive: HA: 𝛽_1>0
#We accept the alternative hypothesis because p-value is 4.43×10-10. (The test statistic is 9.921.)


#E.) Obtain the 99% confidence interval for 𝛽_1.
confint(model, level=0.99)
#The the 99% confidence interval for 𝛽_1 is (1.988, 3.557)

#F.)What is the p-value of a hypothesis testing procedure?
#The p-value is a measure of how rejectable the null hypothesis is. The smaller the p-value, the more rejectable the null hypothesis is for the observed data.


###############Estimating Regression Line & Prediction################
#What inferences can be made on the prediction of the sales given a targeted advertisement expenditure?

#A.)What sales would you predict for an advertisement expenditure of $30,000?
#For advertising expenditure of $30,000, the predicted sales is:
#-157.33 + 300 × 2.77 = 673.67 thousand


#B.)What is the variance estimate of the estimated predicted sales for an advertisement expenditure of $30,000? 
#The variance of the predicted sales is 
#sigma^2(1+1/n +(x* -xbar)2/Sxx)=14286.16

xbar =mean(meddcor$advertising)
xbar
n=23+2
mse=(101.4)**2
mse
var.beta1 = (0.2794)**2
sxx = mse/var.beta1
pred.var = mse*(1+1/n+(xbar-300)^2/sxx)
pred.var
#c.)What are the lower and upper limits of predicted sales for an advertisement expenditure of $30,000 at 99% confidence level? How will the limits change if we lower the confidence level to 95%?
new = data.frame(advertising = 300)
predict.lm(model, new, interval = "predict", level = 0.99)

predict.lm(model, new, interval = "predict", level = 0.95)
#A 99% prediction interval at an advertisement expenditure of $30,000 is
#(338.712, 1009.897). A 95% interval is (427.014, 921.594).     


#D.)Compare the confidence intervals of the estimated regression line versus the predicted regression line. Interpret. 

predict.lm(model, new, interval = "confidence", level = 0.99)
predict.lm(model, new, interval = "confidence", level = 0.95)

#A 99% confidence interval at an advertisement expenditure of $30,000 
#is (496.649, 851.959). A 95% interval is (543.395, 805.214). 
#The confidence intervals are narrower than the prediction intervals because the prediction intervals have additional variance from the variation of a new measurement

#############Model Diagnostics#################
#Do the assumptions of the linear regression model hold? What is the explanatory power of the model?

#A.)What are the assumptions of linear regression?
#The assumptions are:Linearity, Constant Variance, Independence, and Normality.
#Note: We check uncorrelation in the residuals rather than  independence.



#B.)Do the assumptions hold? Provide the graphical displays needed to support the diagnostics. Interpret.
#Linearity: Response vs Predictor
plot(meddcor$advertising, meddcor$sales,xlab="Advertising Expenditure",ylab="Sales",pty=2,lwd=2)
#Constant Variance & Uncorelated errors
plot(model$fitted, model$residuals, xlab="Response Variable", ylab="Residuals", pty=2, lwd=2)
#Normality
library(car)
qqPlot(model$residuals, ylab="Residuals")
hist(model$residuals, xlab="Residuals")
#Based on the plots, the assumptions appear to hold.



#C.)Do you identify any outliers?
#Based on the plots, there appear to be no outliers.
#Why evaluate normality using the residuals not the response?
#Response may be multi-modal, e.g., when a qualitative predictor predicts well the response. 


#D.)How much variability in sales is explained by the advertising expenditure? Is the adjusted-R squared different? 
summary(model)$r.squared

summary(model)$adj.r.squared
#Around 81% of the variability in sales is explained by the advertising expenditure.
#Adjusted R-squared slightly lower than the R-squared – we use Adjusted R-squared only in model comparison!
  


