# FISH552 - Fall Quarte2013

# Name: Emilio Vilanova
# Homework 1

#==Question 1: Create vectors of data with the following characteristics, using rep() and seq() when possible.
# Q1a: 100 regularly spaced values from -1 to 1. Call this vector x.

# R code
x<-seq(from=-1, to=1,length.out=100)

# Q1b== The function y = exp(x/2), evaluated for all the values in vector x created in (a). Call this vector y.
# R code
y<-exp(x/2)

#Q1c:How many values in y created in (b) are above 1?
# R code
which(y>1)

# or R code
sum(y>1)

#Q1d: 5 entries each of "Small", "Medium", "Large", encoded as a factor. Call this vector size.
# R code
size<-c("Small", "Medium", "Large")
rep(size,times=5)
size<-factor()
size.fac<-factor()
is.factor(size.fac)

# or R code
size <- factor(rep(c("small", "medium", "large"), each = 5))
size

#Q1e: Take the results of (d) and append 2 entries of "Unknown". Call this vector observedSize
# R code
observedSize <- factor(c(as.character(size), rep("unknown", 2)))
observedSize

########################################################################

#Question2: Reading and working with fishPassage file

#Q2a: Read the data into R as an object named fishPassage
#R code
fishPassage <-read.csv("C:/Users/Emilio Vilanova/Documents/Doctorado UW/FISH552_Introduction to R/Homeworks/Homework1/fishPassage.csv", header=TRUE)

#Q2b: Calculate the maximum and minimum number of wild steelhead to pass Bonneville Dam (BON) and specify in which year each occurred.
#R code
minPassage <- min(fishPassage$Wild.Steelhead[fishPassage$Dam == "BON"], na.rm = TRUE)
minPassage

maxPassage <- max(fishPassage$Wild.Steelhead[fishPassage$Dam == "BON"], na.rm = TRUE)
maxPassage

#Q2c: Calculate the total number of fish counted at Bonneville Dam (BON) in 2007.
#R code
sum(fishPassage[fishPassage$Year == 2007 & fishPassage$Dam =="BON",3:13])

#Q2d: Create a new data frame called fishPassage1995BON that contains only observations from Bonneville Dam (BON) from 1995 onwards.
# R code
fishPassage1995BON <- fishPassage[fishPassage$Year >= 1995 & fishPassage$Dam == "BON",]
fishPassage1995BON

#Q2e: Create a matrix with 3 columns from the data fishPassage1995BON that contains counts of Coho adults, Coho jacks and the proportion of Coho jacks to adults. Name this matrix cohoPassage.
#R code
cohoPassage <- cbind(fishPassage1995BON$Coho.Adult,fishPassage1995BON$Coh.Jack,fishPassage1995BON$Coho.Jack / fishPassage1995BON$Coho.Adult)
cohoPassage

#Q2f: Compute the mean of each of the variables in cohoPassage. Be careful with missing values (NA).
#R code
colMeans(cohoPassage, na.rm = TRUE)

#Q2g: Round the output in f) to two decimal places. You may need to search the help files.
#R code
?round
round(colMeans(cohoPassage, na.rm = TRUE), digits = 2)

#Q2h: Display all the observations associated with the largest Chinook adult count from the fishPassage data.
# R code
?which
?which.max
fishPassage[which.max(fishPassage$Chinook.Adult),]