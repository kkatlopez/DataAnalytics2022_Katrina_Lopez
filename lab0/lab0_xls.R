# install.packages("tidyverse")
data <- read_xls("2010EPI_data.xls", sheet='EPI2010_onlyEPIcountries')
View(data)

# install.packages("readxl")
library("readxl")
data <- read_excel("2010EPI_data.xls", sheet="EPI2010_onlyEPIcountries")
View(data)