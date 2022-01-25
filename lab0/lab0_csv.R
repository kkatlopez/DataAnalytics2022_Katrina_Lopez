# help("read.csv") # read.csv documentation

data1 <- read.csv(file.choose(), header=T) # opens file browser to choose file
# data1 # prints portion of data1 data
dim(data1) # 231 rows, 160 columns --> dimensions of data
View(data1) # loads data as table in new tab

# summary(EPI) --> shows an error: Error in summary(EPI) : object 'EPI' not found
summary(data1$EPI) # --> five number summary for EPI column in data1 data frame + number of NA's

# boxplot(EPI) --> Error in boxplot(EPI) : object 'EPI' not found
boxplot(data1$EPI) # --> box plot for EPI

fivenum(data1$EPI, na.rm=TRUE) # runs five number summary and removes NA values
hist(data1$EPI)

shapiro.test(data1$DALY) # W, p-value

hist(data1$EPI, seq(30., 95., 1.0), prob=TRUE)