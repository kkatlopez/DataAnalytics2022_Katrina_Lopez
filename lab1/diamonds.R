# install.packages("ggplot")
# install.packages("ggplot2")
install.packages("dplyr")

# library(ggplot)
library(ggplot2)
library(dplyr)

data(diamonds)
View(diamonds)
# head(diamonds)

# length, width, height of diamonds?
fivenum(diamonds$x)
hist(diamonds$x)
boxplot(diamonds$x)
fivenum(diamonds$y)
hist(diamonds$y)
fivenum(diamonds$z)
hist(diamonds$z)

ggplot(data = diamonds, mapping = aes(x = x)) + geom_histogram(binwidth = 0.1)
ggplot(data = diamonds, mapping = aes(x = y)) + geom_histogram(binwidth = 0.5)
ggplot(data = diamonds, mapping = aes(x = z)) + geom_histogram(binwidth = 0.1)

# price - blank space at around price = $1300
fivenum(diamonds$price)
hist(diamonds$price)
boxplot(diamonds$price)
ggplot(data = diamonds, mapping = aes(x = price)) + geom_histogram(binwidth = 50)

# sum of diamonds with 0.99 vs. 1 carat
sum(diamonds$carat == 0.99) # 23
sum(diamonds$carat == 1)    # 1558


smaller <- diamonds %>% filter(carat < 3) ggplot(data = diamonds, mapping = aes(x = carat)) + geom_histogram(binwidth = 0.1)