## Exercise 2
data <- read.csv('data/2010EPI_data.csv', header=TRUE)
# View(data)

# filtering out landlock
EPILand <- data$EPI[!data$Landlock]
EPILand
EPILand2 <- EPILand[!is.na(EPILand)]
EPILand2

hist(EPILand)
hist(EPILand2)
hist(EPILand2, seq(30., 95., 1.0), prob=TRUE)

# filtering on high pop. density
EPIPopDensity <- data$EPI[!data$High_Population_Density]
EPIPopDensity
EPIPopDensity2 <- data$EPI[!is.na(EPIPopDensity)]
EPIPopDensity2

hist(EPIPopDensity)
hist(EPIPopDensity2)

# filter on EPI regions - strings/characters, not numbers
EPISouthAsia <- data$EPI[]
EPISouthAsia
