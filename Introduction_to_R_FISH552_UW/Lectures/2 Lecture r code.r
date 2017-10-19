#=====Subsetting vectors
x <- c(3,4,2,1,10,7)
x[1]
x[3]
x[1:5]
x[c(2,5)]
x[-c(2,4)]

#====Boolean logic: single values
x <- 3
x == 3
x < 10
x < -1
x > 0 & x < 10

#====Boolean logic: vector of values
x <- 1:5
x == 3
x < 10
x > 2 & x <= 4
x != 2

#====Umbrella logic
day <- c("Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat")
rain <- c("Yes","Yes", "Yes",  "Yes", "Yes",   "Yes", "No")
snow <- c("No", "No",  "No",   "Yes", "No",    "No",  "No")
rain == "Yes"
rain != "No"
snow == "Yes"
rain=="Yes" & snow=="Yes"
rain=="Yes" | snow=="Yes"

day[rain=="Yes"]
day[snow=="Yes"]
day[rain=="Yes" & snow=="Yes"]
day[rain=="Yes" | snow=="Yes"]

#=====What is TRUE and FALSE
rain <- c("Yes","Yes","Yes","Yes","Yes","Yes","No") 
sum(rain=="Yes")
as.numeric(rain=="Yes")

#=====Other logical operators
rain <- c("Yes","Yes","Yes","Yes","Yes","Yes","No")
which(rain=="Yes")
any(rain=="Yes")
all(rain=="Yes")

#=====Exercise 1
y <- c(3,2,15,-1,22,1,9,17,5)
y[1]  #first value
y[9]  #last value
y[length(y)]      #last value of vector of any length
y[y>mean(y)]      #values that are greater than the mean of y
which(y>mean(y))  #positions (indices) of values > mean of y
all(y>0)          #are all values positive?
any(y==mean(y))   #are any of the values equal to the mean
any(y==median(y)) #are any of the values equal to the median

#=====Data frames
nislands <- length(islands)
years <- seq(from=2013, length=nislands)
island.data <- data.frame(years, islands)
head(island.data)

names(island.data)
names(island.data) <- c("years","area")
head(island.data, n=2)
island.data <- data.frame(years=years, area=islands)

area
ls()
#rm(list=ls())
island.data$area

#==========extracting data from a data frame
tag <- c(2, 3, 5, 7, 8, 9, 15, 21, 23, 26)
weight <- c(14.8, 21, 19.7, 23.2, 16, 16.1, 20, 29.3, 17.8, 21.2)
condition <- c("good", "fair", "fair", "poor", "fair", "good", "good", "fair", "fair", "poor")
fishData <- data.frame(tag, weight, condition)
head(fishData, n=2)
fishData$weight
(weight <- rep(20,10))
fishData$weight
fishData[,2]
fishData[,-1]

fishData[1,]
fishData[c(1,4),]
fishData[1,2]
fishData$weight[1]

fishData[,2:3]
fishData[,c("tag","condition")]

fishData$weight
fishData$weight > 22
fishData[fishData$weight > 22,]

fishData[fishData$weight < 20 & 
         fishData$condition == "fair",]
fishData[fishData$weight < 15 | 
         fishData$weight > 25,]

#==========umbrella logic revisited
day <- c("Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat")
rain <- c("Yes","Yes", "Yes",  "Yes", "Yes",   "Yes", "No")
snow <- c("No", "No",  "No",   "Yes", "No",    "No",  "No")
day[rain=="Yes" & snow=="Yes"]
weather <- data.frame(day, rain, snow)
weather[weather$rain=="Yes" & weather$snow=="Yes",]

#========dimensions of data frames
length(fishData)
dim(fishData)
nrow(fishData)
ncol(fishData)

#==========Exercise 2
#fake patient data
patients <- data.frame(
   id = c(31, 62, 50, 99, 53, 75, 54, 58, 4, 74), 
   age = c(12, 18, 20, 17, 14, 8, 12, 24, 24, 21), 
   sex = c("M", "F", "F", "M", "F", "M", "M", "F", "F", "M") )
head(patients, n=2)

patients$age[patients$age > 20]   #patients over 20
patients[patients$age > 20,"age"] #another way of doing it
patients[patients$age > 20,]      #also show id age and sex
patients[patients$sex=="F",]      #only female observations
patients$age[7] <- 21             #change the 7th age from 12 to 21
patients  #check that it worked
sum(patients$age > 20)/nrow(patients)  #proportion over 20
sum(patients$age > 20 & patients$sex=="M")/nrow(patients)  #proportion over 20
patients <- patients[-10,]
patients

new.patients <- data.frame(
   id = c(101, 102, 103), 
   age = c(15, 18, 29), 
   sex = c("M", "F", "F") )
new.patients
patients <- rbind(patients, new.patients)
patients

#======missing values
humidity <- c(63.33, NA, 64.63, 68.38, NA, 79.1, 77.46)
humidity
mean(humidity)
mean(humidity, na.rm=T)

na.omit(humidity)
humidity[!is.na(humidity)]
