# install.packages("tidyverse")
data1 <- read_xls("2010EPI_data.xls", sheet='EPI2010_onlyEPIcountries')
View(data1)

# install.packages("readxl")
library("readxl")
data2 <- read_excel("EPI_data.xls", sheet="EPI2010_all countries")
View(data2)