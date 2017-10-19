# FISH 552  - Introduction to R programming - Fall 2013
# Homework 4
# Name: Emilio Vilanova
# Student ID: 1324780

#######################################################################

# Q1) Set a random seed to start the state of R's random number generator
# R code
set.seed(23424)

#Q1a) Generate 1000 random variables from a Cauchy distribution
# R code
random_Cauchy <- rcauchy(1000)
range(random_Cauchy)
mean(random_Cauchy)

# Q1b) Create a sequence of numbers from 0.01 to 0.985 in increments of 0.025.
# R code
x <- seq(from = 0.005, to = 0.995, by = 0.025)

# Q1c) Density
# R code
beta_Density <- dbeta(x, shape1 = 5, shape2 = 2)

# Q1d) Renormalize the vector betaDensity
# R code
betaDensity_Norm <- beta_Density / sum(beta_Density)
sum(betaDensity_Norm)

# Q1e) Sequence of integers from 12 to 90 in increments of 2 (vector lengths).
# R code
lengths <- seq(from = 12, to = 90, by = 2)

# Q1f) Create a random sample of 1000 lengths...
# R code
lengthsSample <- sample(x = lengths, size = 1000,
            prob = betaDensity_Norm, replace = TRUE)

# Q1g) Histogram from the vector lengthsSample.
# R code
hist(lengthsSample, freq = FALSE,
     xlab="Lengths (cm)",
     main="Histogram of simulated lengths from species x",
     col="darkgreen", border="black")
lines(density(lengthsSample), lwd = 1)

# Q2) Working with iris data
# R code
iris
head(iris, n = 3)

# Q2a) Testing for unequal variances in versicolor and virginica irises
# R code
var(iris$Sepal.Width,iris$Species == "versicolor")
var(iris$Sepal.Width,iris$Species == "virginica")
#and/or
var.test(iris$Sepal.Width[iris$Species == "versicolor"],
         iris$Sepal.Width[iris$Species == "virginica"])
# Conclussion: Variances can be assumed as equals (ratio of variances almost 1)

# Q2b) t-test to decide if versicolor and virginica irises have equal or unequal mean sepal widths
# R code
t.test(iris$Sepal.Width[iris$Species == "versicolor"],
       iris$Sepal.Width[iris$Species == "virginica"],
       conf.level = 0.99, var.equal = TRUE)
# Conclussion: mean sepal widths for versicolor and virginica are ´statiscally´ different

# Q2c) Check the normality assumption of the test
# R code
qqnorm(iris$Sepal.Width[iris$Species == "versicolor"])
qqline(iris$Sepal.Width[iris$Species == "versicolor"])
qqnorm(iris$Sepal.Width[iris$Species == "virginica"])
qqline(iris$Sepal.Width[iris$Species == "virginica"])

# Comments: By looking at both plots data seems normally distributed. We can
# say that basic assumptios were met. Yet, we can perform a Kolmogorov-Smirnov 
# (or other) to test for normality

# Q2d) Comparison of means without assuming normality
# R code
wilcox.test(iris$Sepal.Width[iris$Species == "versicolor"],
            iris$Sepal.Width[iris$Species == "virginica"],
            conf.level = 0.99)
# Conclussion: Same as 2b) that stated that mean sepal width for versicolor 
# and virginica are ´statiscally´ different

# Q2e) Plots

plot(iris$Petal.Length, iris$Petal.Width, pch=21, 
     bg=c("red","green3","blue")[unclass(iris$Species)], 
     main="Iris Data")

pairs(iris[1:4], main = "Iris Data", pch = 21, 
      bg = c("red", "green3", "blue")[unclass(iris$Species)])

par(mfcol=c(2,2))
plot(iris$Petal.Length, iris$Petal.Width, main = "Iris flowers data", pch = 21, 
     bg = c("red","green3","blue")[unclass(iris$Species)], 
     xlab = "Petal Lenght (cm)", ylab= "Petal Width (cm)")
plot(iris$Sepal.Length, iris$Sepal.Width, pch = 21, 
     bg = c("red","green3", "blue")[unclass(iris$Species)],
     xlab = "Sepal Lenght (cm)", ylab= "Sepal Width (cm)")
plot(iris$Petal.Length, iris$Sepal.Lenght, main = "Iris flowers data", pch = 21, 
     bg = c("red","green3", "blue")[unclass(iris$Species)],
     xlab = "Petal Lenght (cm)", ylab= "Sepal Lenght (cm)")
plot(iris$Petal.Width, iris$Sepal.Width, pch = 21, 
     bg = c("red","green3", "blue")[unclass(iris$Species)],
     xlab = "Petal Width (cm)", ylab= "Sepal Width (cm)")

