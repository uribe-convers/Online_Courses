#=====Lecture 3 r code
x <- matrix(data=1:6, 
            nrow=3, ncol=2, 
            byrow=FALSE) 
nislands <- length(islands)
years <- seq(2013, length.out=nislands)
isl.mat <- matrix(c(years, islands), ncol=2, nrow=nislands)
head(isl.mat, n=2)

#fast way to create a matrix using cbind
isl.mat <- cbind(years, islands)
head(isl.mat, n=2)

#rbind and t() transpose
isl.row.mat <- rbind(years, islands)
head(isl.row.mat)
t(isl.row.mat)

#Functions for extracting dimensions
dim(isl.mat)
dim(isl.row.mat)
nrow(isl.mat)
ncol(isl.mat)

#what is this?
is.matrix(isl.mat)
mode(isl.mat)
typeof(isl.mat)
is.array(isl.mat)

#===Using arrays
nislands <- length(islands)
years <- seq(2013, length.out=nislands)
isl.array <- array(data=c(years, islands), dim=c(nislands,2))
head(isl.array, n=3)

is.array(isl.array)
is.array(isl.mat)

#3-D array
array(1:24, dim=c(3,4,2))
x<-array(1:24, dim=c(3,4,2),dimnames=list(1:3,1:4,c("Area","Year")))
x[,,"Area"]
matrix(
#===Using lists
description <- "Year of visit, island area (thousand sq miles)"
isl.list <- list(meta=description, nislands=nislands, data=isl.mat)
isl.list

isl.list$meta
isl.list$nislands
isl.list$data[1:3,]

#converting data frames to lists
patients <- data.frame( 
   id = c(31, 62, 50, 99, 53, 75, 54, 58, 4, 74), 
   age = c(12, 18, 20, 17, 14, 8, 12, 24, 24, 21), 
   sex = c("M", "F", "F", "M", "F", "M", "M", "F", "F", "M") )
pat.list <- as.list(patients)
pat.list

#using [[]]
pat.list[[1]]
pat.list$id
pat.list[[1]][1]
pat.list$id[1]

#more complicated lists
pat.list$id <- matrix(pat.list$id, ncol=2)
pat.list
pat.list[[1]][1,1]
pat.list[[1]][1,]

#====Factors and categorical variables
zone <- c("demersal", "pelagic", "reef", "demersal")
is.factor(zone)
zone.fac <- factor(zone)
zone.fac
is.factor(zone.fac)

#Using the labels argument
zone <- c(1, 1, 1, 2, 2, 2, 1, 2, 2, 1)
zone.fac <- factor(zone, labels=c("demersal", "pelagic"))
zone.fac

#the levels function
levels(zone.fac)

#============Hands-on exercise 1
Amat <- matrix(data=1:4,nrow=2,ncol=2)
Amat
Bmat <- matrix(data=5:10,nrow=2,ncol=3)
Bmat
Cmat <- cbind(Amat,Bmat)                  #note: C is a reserved word for a function
Cmat
Dmat <- t(Cmat) #the easiest way is to transpose the matrix Cmat
Dmat
Dmat <- rbind(Amat,t(Bmat))  #or transpose matrix Bmat then bind rows
Dmat
sex <- c(1,1,2,1,2,2,2,1,1,1)
Xfactor <- factor(sex,labels=c("female","male"))
Xfactor
data <- list(Amat, Bmat, Xfactor)
data
data <- list(Name1=Amat, Name2=Bmat, Name3=Xfactor)
data

C:\Users\Trevor Branch\Documents\FISH552 Intro R\Lectures\Data

data[[1]][1,]
data$Name1[1,]
data[[2]][1,1] <- NA
data

#======Reading in data
#manual reading in from the keyboard
co2 <- scan()  #press <enter> twice to stop reading in
co2

#===read.table() good data file
read.table(file="Data\\dat_df1.dat", header=T)      #pathway from current place
read.table(file="Data/dat_df1.dat", header=T)      #pathway from current place
read.table(file="C:\\Data\\dat_df1.dat", header=T)  #full pathway
read.table("http://courses.washington.edu/fish552/data/dat_df1.dat", header=TRUE)

#no column names
x <- read.table(file="Data/dat_df2.dat")
read.table(file="Data/dat_df2.dat", header=T) #removes first line!
read.table(file="Data/dat_df2.dat", col.names=c("id","age","sex"))

#comments preceding the data
read.table(file="Data/dat_df3.dat", header=T)

#error in comments
read.table(file="Data/dat_df4.dat", header=T)
read.table(file="Data/dat_df4.dat", header=T, skip=3)

#data not separated by white space
read.table(file="Data/dat_df5.dat", sep="/", header=T) #sep by /
read.table(file="Data/dat_df1.csv", sep=",", header=T) #sep by ,

#reading in .csv file
read.csv(file="Data/dat_df1.csv", header=T)

#========Hands-on exercise 2
read.table(file="Data/dat_df6.dat", header=F,
           skip=2,na.strings=c(NA,-999,-99),
           col.names=c("id","age","sex")) #sep by /

#reading in as characters and not factors
x <- read.csv(file="Data/dat_df1.csv", header=T)
x$sex
x <- read.csv(file="Data/dat_df1.csv", header=T, 
              stringsAsFactors=F)
x$sex

