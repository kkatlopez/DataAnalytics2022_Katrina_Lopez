## Part 2, Exercise 2 - Multivariate

multivariate <- read.csv("data/multivariate.csv")
# View(multivariate)
attach(multivariate)

# help(lm) # linear models
mm <- lm(multivariate$Homeowners~multivariate$Immigrant)
mm # coefficients: (intercept) = 107495; multivariate$Immigrant = -6657
summary(mm)$coef # output shows estimate of regression beta coefficients (Estimate) and significance levels (Pr(>|t|))
# therefore, homeowners = 107494.898 + [(-6656.839) * Immigrant]

plot(multivariate$Homeowners~multivariate$Immigrant) # regression plot
help(abline)
abline(mm, col=2, lwd=3) # adds regression line to plot

newImmigrantdata <- data.frame(multivariate$Immigrant = c(0,  20))
mm %>% predict(newImmigrantdata)

## Part 2, Exercise 2 - ggplot examples

plot(mtcars$wt, mtcars$mpg)
library(ggplot2)
library(dplyr)
qqplot(mtcars$wt, mtcars$mpg)
qqplot(mtcars$wt, mtcars$mpg, data=mtcars)
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()

plot(pressure$temperature, pressure$pressure, type="l")
points(pressure$temperature, pressure$pressure)

lines(pressure$temperature, pressure$pressure/2, col="red")
points(pressure$temperature, pressure$pressure/2, col="blue")
qplot(pressure$temperature, pressure$pressure/2, geom="line")
qplot(pressure$temperature, pressure$pressure, data=pressure, geom="line")
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point()


## Bar graphs
barplot(BOD$demand, names.arg=BOD$time)
table(mtcars$cyl)
barplot(table(mtcars$cyl)) # generate table of counts
qplot(mtcars$cyl, binwidth=0.5) # changed bin width to 0.5
qplot(factor(mtcars$cyl)) # treat cyl as discrete/quantitative
# Bar graphs of counts
qplot(factor(cyl), data=mtcars)
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar()


## Histograms
hist(mtcars$mpg)
hist(mtcars$mpg, breaks=10) # specify approx. number of bins with breaks
hist(mtcars$mpg, breaks=5)
hist(mtcars$mpg, breaks=12)
qplot(mpg, data=mtcars, binwidth=4)
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth=4)
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth=5)


## Boxplots
plot(ToothGrowth$supp, ToothGrowth$len) # use plot() and pass it as factor of x-values and vector of y-values
boxplot(len ~ supp, data=ToothGrowth) # if 2 vector are in same dataframe, use this syntax --> combines 2 variables on x-axis
boxplot(len ~ supp + dose, data=ToothGrowth)
# can get the same results as above with qplot
qplot(ToothGrowth$supp, ToothGrowth$len, geom="boxplot")
qplot(supp, len, data=ToothGrowth, geom="boxplot") # if 2 vector are in same dataframe, use this syntax
ggplot(ToothGrowth, aes(x=supp, y=len)) + geom_boxplot() # equivalent of above with ggplot2
qplot(interaction(ToothGrowth$supp, ToothGrowth$dose), ToothGrowth$len, geom="boxplot") # using 3 separate vectors
qplot(interaction(supp, dose), len, data=ToothGrowth, geom="boxplot") # get columns from dataframe
ggplot(ToothGrowth, aes(x=interaction(supp, dose), y=len)) + geom_boxplot() # equivalent to above with ggplot()







