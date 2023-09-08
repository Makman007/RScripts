### Code to explore and load the IRIS data set

# Method 1
# Use the inbuilt datasets package in R 

library(datasets)
data("iris")

iris <- datasets::iris

# Method 2 via a repository
# RCurl used for url client interface
# install.packages("RCurl")

# library(RCurl)
# iris <- read.csv(text = getURL("https://raw.githubusercontent.com/dataprofessor/data/master/iris.csv"))

# View the data
View(iris)

### Summary statistics of the data

head(iris,5)
tail(iris, 5)

summary(iris)
# Look at a particular attribute
summary(iris$Sepal.Length)
plot(iris$Sepal.Length,type = 'h')

# Check for missing values in data set; 0 means there are no missing values in the dataframe
sum(is.na(iris))

# skimr() - expands on summary() with more stats
# install.packages('skimr')

library(skimr)
# Perform skim and display summary stats
skim(iris)

# Group data by Species and perfrom skim
# Utilize %>% piping operator to avoid additional temp variables
iris %>%
  dplyr::group_by(Species) %>%
  skim()

### Basic visualizations
plot(iris)
plot(iris, col = "red")

# Scatter plot
plot(iris$Sepal.Width, iris$Sepal.Length, col = "red")
# Specify axis labels
plot(iris$Sepal.Width, iris$Sepal.Length, col = "red",
     xlab = "Sepal Width",ylab = "Sepal Length")

# Histograms
hist(iris$Sepal.Width)
hist(iris$Sepal.Width, col = "blue", xlab = "Sepal Width",labels = TRUE)

# Feature plots
install.packages("caret")
library(caret)

featurePlot(x = iris[,1:4],
            y= iris$Species,
            plot = "box",
            strip = strip.custom(par.strip.text=list(cex=.7)),
            scales = list(x = list(relation ="free"),
                          y= list(relation = "free")))


