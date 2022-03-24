# iris data
data('iris')
head(iris)

iris_data <- iris[, 1:4]
iris_data
head(iris_data)

principal_components <- princomp(iris_data, cor = TRUE, score = TRUE)
summary(principal_components)
plot(principal_components)
plot(principal_components, type = "l")
biplot(principal_components)


# wine data
wine_data <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", sep = ",")
head(wine_data)
nrow(wine_data) # number of rows in wine_data

colnames(wine_data) <- c("Cvs", "Alcohol", "Malic_Acid", "Ash", "Alkalinity_of_Ash",
                         "Magnesium", "Total_Phenols", "Flavanoids", "NonFlavanoid_Phenols", 
                         "Proanthocyanins", "Color_Intensity", "Hue", "OD280/OD315_of_Diluted_Wine", "Proline")
head(wine_data)
heatmap(cor(wine_data), Rowv = NA, Colv = NA) # darker colors = strong correlations

cultivar_classes <- factor(wine_data$Cvs)
cultivar_classes
wine_data_PCA <-  prcomp(scale(wine_data[, -1]))
summary(wine_data_PCA)
