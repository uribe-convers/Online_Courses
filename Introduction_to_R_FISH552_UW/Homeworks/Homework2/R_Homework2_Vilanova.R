# FISH 552  - Introduction to R programming - Fall 2013
# Homework 2
# Name: Emilio Vilanova
# Student ID: 1324780

#######################################################################

# Question 1
# Run the command head(beaver1)
# R code
head(beaver1)
?beaver1

#Q1a: compute the mean temperature for inside and outside the retreat
# R code
means <- tapply(beaver1$temp, beaver1$activ, mean)
means

#Q1b: Recreate the following plot
# R code
plot (1:nrow(beaver1), beaver1$temp, type = "l", xlab = "Observation #", ylab = "Temperature", xaxt = 'n', main = "Beaver 1 body temperature")
xlim = c(1, seq(from = 20, to = 100, by = 20),nrow(beaver1))
axis(side = 1, at = xlim, labels = xlim)
lines(x = c(1, nrow(beaver1)), y = rep(means[1], 2), col = "gray", lty = 2 )
lines(x = c(1, nrow(beaver1)), y = rep(means[2], 2), col = "gray", lty = 3 )
points( x = which(beaver1$activ == 1 ), y = beaver1$temp[beaver1$activ == 1],col = "green", pch = 20, cex = 2)
legend( "topleft", legend = c("inside mean temperature","ouside mean temperature"), lty = 2:3, col = "gray", bty = 'n')

#Q1c: Create a new data frame...
# R code
beaver1_new <- rbind(beaver1, c(346, 2220, 37.3, 1))

#Q1d: How much did the mean temperature during periods of activity outside the retreat change?
# R code
mean2 <- tapply(beaver1_new$temp, beaver1_new$activ, mean)
mean_change <- means - mean2
mean_change

#Question 2: Using the Library crabs
# R code
library(MASS)
head(crabs)

#Q2a: Compute the mean of frontal lobe size for blue and orange purple rock crabs. Compute the standard deviation of frontal lobe size for blue and orange purple rock crabs.
# R code
tapply(crabs$FL, crabs$sp, mean)
tapply(crabs$FL, crabs$sp, sd)

#Q2b) Run this line of code

# Explain what is going on here
# This command created a factor for each unique combination of the levels of the two individual factor (color and sex). 
# crabs is a data frame that contains information on 200 observations on frontal lobe size for two different
# species of crabs (blue and orange) as well data on sex for each individual. When we use the code crabs$sp:crabs$sex
# R is compiling each observation into pairs of data (i.e Data1 = Blue/Male or Data106 Orange/male)
# R code 
crabs$sp:crabs$sex
spsex <- crabs$sp:crabs$sex

#Q2c: Change the levels of spsex so that they are more informative.
# R code
levels(spsex) <- c("Blue female", "Blue male","Orange female", "Orange male")
spsex

#Q2d: function to compute the mean of frontal lobe size for each sex and color combination of purple rock crab.
# R code
tapply(crabs$FL, spsex, mean)

#Q2e: function with the vector spsex to compute the total number of each sex and color combination of purple rock crab. Call this vector crab.counts.
# R code
crab.counts <- table(spsex)
crab.counts

#Q2f: Informative plot
# R code
plot(x=)