# Advertising-Program-Effectiveness-on-Sales

# Overview
This project investigates the effectiveness of a new advertising program for a company that sells medical supplies to hospitals, clinics, and doctor's offices. The company wants to determine if there is a relationship between advertising expenditure and sales. The data set includes yearly sales (in thousands) and advertising expenditures (in hundreds) for 25 offices.

# Objective
The main goal is to analyze the impact of advertising expenditure on sales and provide management with insights to guide future decisions. Key objectives include:

Estimating the linear relationship between advertising expenditure and sales.

Interpreting the regression coefficients.

Making predictions about future sales based on different levels of advertising expenditure.

Conducting hypothesis testing and constructing confidence intervals.

Performing model diagnostics to ensure the validity of the linear regression assumptions.

# Data
The data is provided in the meddcor-4.txt file with the following columns:

sales: Yearly sales (in thousands)

advertising: Advertisement expenditure (in hundreds)

bonuses, marketshare, largestcomp, region: Other factors that may influence sales.

# Conclusion
The analysis suggests that the advertising program is significantly related to sales. However, predictions should be made cautiously when extrapolating beyond the observed range of advertising expenditure.

# Requirements
R
Libraries: car for residual diagnostics

# How to Run
Load the data file meddcor-4.txt into your R environment.

Run the script to fit the regression model and generate results.

Visualize diagnostic plots to validate model assumptions.

# License
This project is licensed under the MIT License.
