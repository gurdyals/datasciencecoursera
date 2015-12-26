rm(list = ls())
##### Question 001
##### Take a look at the 'iris' dataset that comes with R. The data can be loaded 
##### with the code: 
library(datasets)
data(iris)

##### A description of the dataset can be found by running 
?iris

##### There will be an object called 'iris' in your workspace. In this dataset, 
##### what is the mean of 'Sepal.Length' for the species virginica? 
##### (Please only enter the numeric result and nothing else.)
##### Testing play Start
class(iris)  ##### [1] "data.frame"
iris 
head( iris )
names(iris) ##### [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"
class(iris$Sepal.Length) ##### [1] "numeric"
class(iris$Sepal.Width)  ##### [1] "numeric"
class(iris$Petal.Length) ##### [1] "numeric"
class(iris$Petal.Width)  ##### [1] "numeric"
class(iris$Species)      ##### [1] "factor"
iris$Species
unique(iris$Species)
##### [1] setosa     versicolor virginica 
##### Levels: setosa versicolor virginica
table(iris$Species)
##### setosa versicolor  virginica 
##### 50         50         50 

levels(iris$Species[iris$Species])
as.numeric(levels(iris$Species[iris$Species]))
as.character(iris$Species)
unique(as.numeric(iris$Species)) ##### [1] 1 2 3

iris$Sepal.Length
iris$Species == 1
sum(iris$Species == "setosa")
sum(as.numeric(iris$Species) == 1)
(as.numeric(iris$Species) == 1)
##### Testing play End
iris$Sepal.Length[iris$Species == "virginica"]
mean( iris$Sepal.Length[iris$Species == "virginica"] ) ##### [1] 6.588

##### or try tapply as suggested in the Quiz suggestion :
tapply(iris$Sepal.Length, iris$Species, mean)

##### Your Answer 		Score 	Explanation
##### 6.588 	Correct 	1.00 	To get the answer here, you can use 'tapply' to 
##### calculate the mean of 'Sepal.Length' within each species.
##### Total 		1.00 / 1.00 	


##### Question 2
##### Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
##### colMeans(iris)
##### apply(iris[, 1:4], 2, mean)
##### apply(iris, 1, mean)
##### apply(iris, 2, mean)
##### Testing play Start
colMeans(iris[, 1:4])
colMeans(iris[1:4])
apply(iris[, 1:4], 2, mean)
apply(iris, 1, mean)
apply(iris, 2, mean)
iris[, 1:4]
iris[1:4, ]
iris[c(1:3, 5, 4, 2) ]
iris[c(1:3)]
head(iris[c(1:3)])
head(iris[c(1:3, 5, 4, 2) ])
?sapply
apply(iris[, 1:4],  2, mean)
sapply(iris[, 1:4], mean)
vapply(iris[, 1:4], mean, 0)
lapply(iris[, 1:4], mean)
tapply(iris[, 1:4], mean)  ##### wrong syntax
##### Testing play End

apply(iris[, 1:4], 2, mean)



##### Question 3
##### Load the 'mtcars' dataset in R with the following code
library(datasets)
data(mtcars)

##### There will be an object names 'mtcars' in your workspace. You can find 
##### some information about the dataset by running

?mtcars

##### How can one calculate the average miles per gallon (mpg) by number of 
##### cylinders in the car (cyl)?
with(mtcars, tapply(mpg, cyl, mean))
split(mtcars, mtcars$cyl)
apply(mtcars, 2, mean)
tapply(mtcars$cyl, mtcars$mpg, mean)
##### Testing play Start
mtcars
class(mtcars)
head(mtcars)
nrow(mtcars)
unique(mtcars$cyl) ##### [1] 6 4 8
table(mtcars$cyl)
mtcars$mpg [ mtcars$cyl == 4 ]
length(mtcars$mpg [ mtcars$cyl == 4 ])
i4<-mean(mtcars$mpg [ mtcars$cyl == 4 ])
i6<-mean(mtcars$mpg [ mtcars$cyl == 6 ])
i8<-mean(mtcars$mpg [ mtcars$cyl == 8 ])
mtcars$cyl == 4

with(mtcars, tapply(mpg, cyl, mean))
split(mtcars, mtcars$cyl)
split(mtcars$mpg, mtcars$cyl)
apply(mtcars, 2, mean)
tapply(mtcars$cyl, mtcars$mpg, mean)
length(tapply(mtcars$cyl, mtcars$mpg, mean) )

i[[1]] <- split(mtcars$mpg, mtcars$cyl)
class(i)
dim(i)
names(i)
sapply(i[[1]], mean)
split(mtcars$mpg, mtcars$cyl)

tapply(mtcars$mpg, mtcars$cyl, mean)

##### Testing play End
with(mtcars, tapply(mpg, cyl, mean))


##### Question 4
##### Continuing with the 'mtcars' dataset from the previous Question, what is 
##### the absolute difference between the average horsepower of 4-cylinder cars 
##### and the average horsepower of 8-cylinder cars?

##### Testing play Start
with(mtcars, tapply(mpg, cyl, mean))
mtcars
head(mtcars)
with(mtcars, tapply(hp, cyl, mean))
i <- with(mtcars, tapply(hp, cyl, mean))
class(i)
i[1]
i[2]
i[3]
i[3] - i[1]
##### Testing play End
i <- with(mtcars, tapply(hp, cyl, mean))
i[3] - i[1]  ##### 126.5779 
8 
126.5779 



##### Question 5
##### If you run

debug(ls)

##### what happens when you next call the 'ls' function?
##### The 'ls' function will return an error.
##### Execution of the 'ls' function will suspend at the 4th line of the 
##### function and you will be in the browser.
##### Execution of 'ls' will suspend at the beginning of the function and 
##### you will be in the browser.
##### The 'ls' function will execute as usual.

##### Testing play Start
ls()
##### Testing play End
ls()
undebug(ls)
