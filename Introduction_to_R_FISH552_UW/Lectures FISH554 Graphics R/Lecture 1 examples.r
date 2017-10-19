###R refresher
print("Hello world")  #prints values contained in object or string
?print

#vectors and number sequences
x1 <- 3:12            #store sequence of numbers from 1 to 10 in vector x1
LETTERS               #upper case alphabet
letters               #lower case alphabet
x1 <- letters         
x1[1:3]               #print the first three letters
x1[-2]                #exclude the second letter
y <- c(2,7,9)         #vector containing letters 2,7,9
y                     #print values
x1[c(1,4,6)]          #include only elements 1,4,6 
x1[-c(1,4,6)]         #exclude elements 1,4,6
x1[-y]                #exclude elements contained in vector y                 
x3 <- seq(from=2,to=30,by=3)     #sequence of numbers starting at 2, ending at 30, every 3rd number 
x3
rev(x3)               #reverses a vector
typeof(x3)            #is this integer, double, character?
x3[x3>15] <- "a"      #sets all elements of x3 that are greater than 15 to "a"
typeof(x3)
x3

#matrix manipulations
x1 <- 1:10            #vector containing numbers from 1 to 10
x2 <- 10:1            #vector containing numbers from 10 to 1 
xmat <- cbind(x1,x2)  #matrix combining two vectors in columns "c" for column
xmat
t(xmat)               #transposes matrix (turns rows into columns)
ymat <- rbind(x1,x2)  #matrix combining two vectors in rows "r" for rows
ymat
xmat[1:3,1]           #first three rows, and first column
xmat[c(2:3),]         #rows 2-3 and all columns, note the gap denoting all columns
xmat[,2]              #all rows, but only column 2
xmat==5               #matrix with T where 5 and F elsewhere
xmat[xmat==5] <- -99  #!!set all positions that are 5 to be -99
xmat

#dimensions of matrices and vectors
dim(xmat)             #number of rows and columns 
dim(ymat)
nrow(xmat)            #number of rows
ncol(xmat)            #number of columns
ncol(x1)              #!! returns NULL for vector (common mistake in coding)
nrow(x1)              #!! returns NULL for vector
NROW(x1)              #number of rows for matrix OR a vector [note capital letters]
NCOL(x1)              #number of columns for matrix OR a vector [note capital letters]
length(x1)            #length of a vector 
length(xmat)          #!!total number of elements in a matrix

#lists
xlist <- list()       #create an empty list
xlist[[1]] <- x1      #first element of list is x1
xlist[[2]] <- xmat    #second element is xmat
xlist                 #display list
xlist[[2]][1:5,]      #first five rows and all columns of element 2 of the list
ylist <- hist(1:100)  #lists are returned by many R commands, e.g. plotting command "hist"  
ylist
ylist$mids            #return the x values of the midpoints of each bar in the histogram [very useful for overplotting]
ylist[[5]]            #lists can be accessed by name or element number
length(ylist)         #number of elements contained within list

#functions: why? easy to see everything that goes into a function, easy to reuse code, no global variables
sumxmy2 <- function(x,y) {  #return sum of square of differences between numbers (or vectors)
  return(sum((x-y)^2))
}
sumxmy2(1,2)                      #works for individual values
sumxmy2(4,2)
sumxmy2(c(1,1,1,1),c(1,2,3,4))    #works for two vectors

pointfunc <- sumxmy2              #can set something else equal to a function
pointfunc(c(1,1,1,1),c(1,2,3,4))

#if-then-else statements
x <- 10
if(x==10) { print("yes") } else { print("no") }
x <- 9
if(x==10) { print("yes") } else { print("no") }

#switch statements (very seldom used but quite useful when needed
#require(stats)
centre <- function(x, type) {            #if (type=="mean") {}  if (type=="median") {}, etc.
  switch(type,
         mean = mean(x),
         median = median(x),
         trimmed = mean(x, trim = .1))
}
x <- log(1:1000)
centre(x, "mean")
centre(x, "median")
centre(x, "trimmed")

#"for" loops
for(i in 1:5) {       #there are five elements in the vector 1:5, so do everything in the loop 5 times
  print(i)            #Each time in the loop i gets the value of the next element in 1:5 
}
for(i in 5:1) {       #print 5:1 in reverse order
  print(i)             
}
for(i in c(1,4,1,99)) {       #print 5:1 in reverse order
  print(i)             
}
for(i in 5:1) {       #add 10 to the value of i in each loop
  print(i+10) 
}
for(i in c("a",1,"Great!")) {   #you can loop over any set of values in a vector
  print(i)            
}

##"while" loops: need not evaluate the loop any times at all
i <- 100
while(i<100) {
  print(i)
  i<-i*2
}

#"repeat" loops: ends as soon as a "break" is encountered; discouraged. 
i <- 100
repeat {     #to get out of an infinite loop, go to the console window and hit the ESC key
  print(i)
  i<-i*2
  if(i>100) {break}
}

###plot (lines and points)
ls()                  #list of all objects in current R environment
rm(list=ls())         #!!deletes all objects
x <- rnorm(1000)      #generate 1000 random normal numbers (mean 0, sd 1), store in x
print(x)
y <- rnorm(1000)                   #generate 1000 more and store in y
plot(y)                            #default plot for a single vector
plot(x=x,y=y)                      #plot x against y:bivariate normal 
plot(x=1:1000,y=y,type="l")        #plot lines
plot(x=1:1000,y=y,type="p")        #plot points
plot(x=1:100,y=y[1:100],type="b")  #plot lines and points: very ugly

###barplot
UWenroll <- read.csv(file="UWenrollment.csv")                 #data file containing average UW enrollment
UWenroll
names(UWenroll)                                               #find out names of the columns
barplot(height=UWenroll$Enrollment, names.arg=UWenroll$Year)  #plot year against enrollment
barplot(height=UWenroll[,2], names.arg=UWenroll[,1])          #same as above using column numbers but harder to interpret

###hist
x1 <- rnorm(30)                 #generate 30 random normal numbers
hist(x1)                        #default histogram
x2 <- rnorm(1000)               #1000 random normals
hist(x2)
x3 <- rnorm(1000000)            #10 million random normals
hist(x3)
hist(x3,breaks=seq(-6,6,0.05))  #refining the bin widths
hist(x3,breaks="Scott")         #different methods of specifying bin width
hist(x3,breaks="FD")  
hist(x3,breaks="Sturges")       #default method
hist(x3,breaks=c(-6,-1,0,1,6))  #varying bin widths
data <- c(1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4)
hist(data)                      #!!unintuitive behavior when applied to whole numbers
hist(data,breaks=seq(0.5,4.5,1))  #specify breaks in between whole numbers

###boxplot
catches <- read.csv("FAO catch.csv")    #read in catch data from Branch et al. (2010) Nature 468:431-435
boxplot(catches[catches$Lmax<10,]$TL)   #boxplot of trophic level for small taxa <10cm
boxplot(catches$TL~catches$Habitat)     #trophic level by groups
boxplot(catches$Lmax~catches$TL)        #max length by trophic level 
boxplot(catches$Lmax~round(catches$TL,1))  #max length by trophic level in 0.1 bin groups
boxplot(catches$Lmax~round(catches$TL,1),log="y")  #logged y axis
boxplot(catches$Lmax~round(log(catches$MeanCatch,10),0),log="y")  #max length for species of different average catch

###piechart
pie(1:10, col=heat.colors(10))   #better to use a barchart, especially ordered horizontal bars!

###image plot (heat map)
google.num <- read.csv("GoogleNumbers00to99.csv",header=F)  #number of hits in Google when typing in numbers "00" to "99"
image(x=0:9, y=0:9, z=as.matrix(google.num),col=rev(heat.colors(1000)), ann=F, axes=F)
for (i in 0:9) {
  for (j in 0:9) {
     text(i,j,paste(i,j,sep=""))
  }
}
mtext(side=3,line=1, "Billions of hits in Google (red=lots,white=little)", cex=1.3)

#same heatmap but for 1900 to 1999
google.num <- read.csv("GoogleNumbers1900to1999.csv",header=F)  #number of hits in Google when typing in numbers "1900" to "1999"
image(x=0:9, y=0:9, z=as.matrix(google.num),col=rev(heat.colors(1000)), ann=F, axes=F)
for (i in 0:9) {
  for (j in 0:9) {
    text(i,j,paste(19,i,j,sep=""))
  }
}
mtext(side=3,line=1, "Billions of hits in Google (red=lots,white=little)", cex=1.3)
