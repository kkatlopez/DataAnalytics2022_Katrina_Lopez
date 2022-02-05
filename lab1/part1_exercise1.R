## Part 1, Exercise 1
data <- read.csv('data/2010EPI_data.csv', header=TRUE)
# View(data)

# EPI
summary(data$EPI)
fivenum(data$EPI, na.rm=TRUE)
stem(data$EPI)
hist(data$EPI)
lines(density(data$EPI,na.rm=TRUE,bw=1.))
rug(data$EPI)

plot(ecdf(data$EPI), do.points=FALSE, verticals=TRUE)
par(pty="s")
qqnorm(data$EPI)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

# Land Area
summary(data$Landarea)
fivenum(data$Landarea, na.rm=TRUE)
stem(data$Landarea)
boxplot(data$Landarea)
qqnorm(data$Landarea)

# Biodiversity
summary(data$BIODIVERSITY)
fivenum(data$BIODIVERSITY, na.rm=TRUE)
stem(data$BIODIVERSITY)
boxplot(data$BIODIVERSITY)

# Land Area vs. Biodiversity:
plot(ecdf(data$BIODIVERSITY), do.points=FALSE, verticals=TRUE)
par(pty="s")
qqnorm(data$BIODIVERSITY)

# Some other comparisons:
qqplot(data$AIR_H, data$WATER_H)
boxplot(data$AIR_H, data$WATER_H)