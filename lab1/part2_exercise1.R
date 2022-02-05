## Part 2, Exercise 1

# Example from lecture
EPI_data <- read.csv('data/2010EPI_data.csv', header=TRUE)

plot(ecdf(EPI_data$EPI), do.points=FALSE, verticals=TRUE) 
plot(ecdf(EPI_data$EPI), do.points=TRUE, verticals=TRUE) # points are visible on the plot.
par(pty="s")
help("qqnorm")
help("qqplot")
qqnorm(EPI_data$EPI)
qqline(EPI_data$EPI) # adding the line on the Q-Q plot
x <- seq(30,95,1)
x
x2 <-seq(30,95,2)
x2
x2 <-seq(30,96,2)
x2
qqplot(qt(ppoints(250),df=5),x, xlab = "Q-Q plot")
qqline(x)


# Exercise:
plot(ecdf(EPI_data$WATER_H), do.points=TRUE, verticals=TRUE) 
qqnorm(EPI_data$WATER_H)
qqline(EPI_data$WATER_H)
qqplot(EPI_data$DALY, EPI_data$EPI)
plot(boxplot(EPI_data$EPI, EPI_data$DALY))

# Intercomparing EPI data values
plot(qqnorm(EPI_data$AIR_H))
plot(qqnorm(EPI_data$WATER_H))
boxplot(EPI_data$WATER_H, EPI_data$AIR_H) # similar boxplots here

plot(qqnorm(EPI_data$AIR_H))
qqline(EPI_data$AIR_H, col="blue") # some outliers here, but data is fairly consistent

# comparing WATER_H and AIR_H
plot(qqplot(EPI_data$WATER_H, EPI_data$AIR_H))
qqline(EPI_data$WATER_H, col="red")
qqline(EPI_data$AIR_H, col="blue")

