mtcars
head(mtcars)
str(mtcards)

model1 <- lm(mpg ~ cyl + wt, data = mtcars) # linear regression model where mpg is the dependent variable
model1

plot(model1, pch = 18, col = 'red', which = c(4))
cooks.distance(model1)
CooksDistance <- cooks.distance(model1)
round(CooksDistance, 5) # round values to 5 decimal points
sort(round(CooksDistance, 5)) # sort in ascending order


## outlier detection
library(ISLR)
library(dplyr)
head(Hitters)
dim(Hitters)
is.na(Hitters) # check for missing values
data <- na.omit(Hitters) # remove NA values
dim(data)
head(data)
# predict model of player:
SalaryPredictModel <- lm(Salary ~., data = data)
summary(SalaryPredictModel)
# Cook's distance:
cooksD <- cooks.distance(SalaryPredictModel)
influential <- cooksD[(cooksD > (3 * mean(cooksD, na.rm = TRUE)))]
influential # 18 players have a Cook's Distance greater than 3 times the mean
names_influential <- names(influential)
names_influential
outliers <- data[names_influential,] # excluding those 18 players
hitters_no_outliers <- data %>% anti_join(outliers)

SalaryPredictModel2 <- lm(Salary ~., data = hitters_no_outliers) # new linear model w/o those 18 players
summary(SalaryPredictModel2) # improved R-squared values!
