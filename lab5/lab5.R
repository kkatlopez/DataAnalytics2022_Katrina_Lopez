mtcars
head(mtcars)
str(mtcars)

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


## Titanic data
titanic_data <- data.frame(Titanic)
# random forest
library(randomForest)
head(titanic_data)
levels(titanic_data$Class) # 4 classes: 1st, 2nd, 3rd, Crew
set.seed(100)
train <- sample(nrow(titanic_data), 0.7 * nrow(titanic_data), replace = FALSE)
titanic_train <- titanic_data[train, ]
titanic_valid <- titanic_data[-train, ]
summary(titanic_train)
summary(titanic_valid)

titanic_model1 <- randomForest(Class ~ ., data = titanic_data, importance = TRUE)
titanic_model1

titanic_model2 <- randomForest(Class ~ ., data = titanic_train, importance = TRUE)
titanic_model2

titanic_pred <- predict(titanic_model2, titanic_train, type = "class")
table(titanic_pred, titanic_train$Class)
titanic_pred_valid <- predict(titanic_model2, titanic_valid, type = "class")
titanic_pred_valid
table(titanic_pred_valid, titanic_valid$Class)

importance(titanic_model2)
varImpPlot(titanic_model2)

a=c()
i=5
for (i in 3:8) {
  titanic_model3 <- randomForest(Class ~ ., data = titanic_train, ntree = 500, mtry = i, importance = TRUE)
  titanic_pred_valid <- predict(titanic_model3, titanic_valid, type = "class")
  a[i - 2] = mean(titanic_pred_valid == titanic_valid$Class)
}
plot(3:8, a)

library(rpart)
library(caret)
library(e1071)

dt_model <- train(Class ~ ., data = titanic_train, method = "rpart")
dt_model1 <- predict(dt_model, data = titanic_train)
table(dt_model1, titanic_train$Class)
mean(dt_model1 ==titanic_train$Class)

dt_vs_model <- predict(dt_model, newdata = titanic_valid)
table(dt_vs_model, titanic_valid$Class)
mean(dt_vs_model == titanic_valid$Class) # no matches
