#=====Lecture 5 r code: 
nums <- c(12,9,8,14,7,16,3,2,9)
any(nums > 10)
all(nums > 10)
which(nums > 10)
nums[which(nums > 10)]
nums[nums > 10]

#unique and duplicated
plates <- c("WA","WA","OR","RI","WA","WA","CA","WA","WA")
unique(plates)

duplicated(plates)

#testing modes
y <- rnorm(6)
x <- sample(factor(1:6))
(xy <- data.frame(x,y))
is.numeric(xy$x)
is.factor(xy$x)
attributes(xy$x)

#using cut to create a new factor
ages <- c(47,14,24,33,74)
cut(ages, breaks=c(0,18,65,Inf), 
    labels=c("Kid","Adult","Senior"))

#constants in R
pi    #constant 3.141593...
letters
LETTERS
month.abb
month.name

#unknowns and errors and missings
Inf    #e.g. 1/0
-Inf   
NaN    #e.g. sqrt(-1)
sqrt(-1)
NULL   #nothing there, empty, blank
NA     #missing data, error in data, wrong number
x <- NA
(x <- c(x,1,2,3))
x <- NULL
(x <- c(x,1,2,3))



#subsetting when NAs are present
x <- data.frame(a=c(11,13,12,15,17,20),
                b=c(8,NA,6,4,NA,15))
x[x$b>5,]
subset(x, b>5)
subset(x, b>7, a)

###======Hands-on exercise 1
temp <- c(1,2,3,1,2,3,1,2,6)
unique(temp)
temp[!duplicated(temp)]  #solution to part 1

temp[!duplicated(temp) == TRUE]  #long-winded solution to part 1
temp[duplicated(temp) == FALSE]  #???

temp[which(!duplicated(temp))]  #long-winded solution to part 1

!duplicated(temp)
!duplicated(temp) == TRUE
which(!duplicated(temp))

as.numeric(levels(factor(temp)))  #very creative

x <- data.frame(a=c(11,13,12,15,17,20),
                b=c(8,NA,6,4,NA,15))
subset(x, b>5)
x[!is.na(x$b) & x$b>5,]  #solution to part 2
x[!is.na(x$b) & x$b>5,]  #solution to part 2

na.omit(x[x$b>5,])  #elegant and creative
na.exclude(x[x$b>5,])  #elegant and creative

#
attributes(na.omit(x[x$b>5,]))  
attributes(na.exclude(x[x$b>5,]))  

x[which(x$b > 5),]       #also works since which() removes NAs

#using apply()
m <- matrix(1:12,nrow=3)
apply(X=m, MARGIN=2, FUN=mean)
apply(X=m, MARGIN=1, FUN=mean)
quantile(m[1,], c(0.05,0.5,0.95))  #5%, 50%, 90% of first row
apply(X=m, MARGIN=1, FUN=quantile, c(0.05,0.5, 0.95))
apply(X=m, MARGIN=2, FUN=quantile, c(0.05))

#more using apply()
rownm <- paste("Patient",1:20)
colnm <- paste("Yr",1:5)
subj <- matrix(rnorm(n=100),ncol=5,dimnames=list(rownm,colnm))
round(subj,3)
round(apply(subj, MARGIN=1, mean),3)
round(apply(subj, MARGIN=2, mean),3)

round(rowMeans(subj),3)
round(colMeans(subj),3)

#using tapply
(lengths <- sample(1:100,size=20, replace=T))
(genders <- sample(c("Male","Female","Unknown"), 
              size=20, replace=T))
tapply(X=lengths, INDEX=genders, FUN=mean)

(weights <- sample(200:250, size=20, replace=T))
tapply(X=lengths, INDEX=weights, FUN=mean)
(tapply(X=weights, INDEX=lengths, FUN=mean)
 ?tapply
 

XX <- data.frame(lengths, genders)
XX
tapply(X=XX$lengths, INDEX=list(XX$genders,weights), FUN=max)

#ordering elements in vectors
(cards <- sample(1:10))
sort(cards)
rev(sort(cards))  #reverse the order
order(cards)

#reordering a matrix
cards[order(cards)]
YY <- data.frame(ID=sample(1:10),dev=round(rnorm(10),3))
YY[order(YY$ID),]

#ordering within sub-ordering
ZZ <- data.frame(laws=sample(1:3,replace=T, size=10),
                 year=sample(2010:2012,replace=T,size=10),
                 state=c("WA","OR","CA","VT","NY","RI","FL","UT","AZ","TX"))
ZZ
ZZ[order(ZZ$laws, ZZ$year, ZZ$state),]

#Hands-on exercise 2
head(PlantGrowth) #first explore to see what this looks like
unique(PlantGrowth[,2])
#mean of treatment and controls
tapply(PlantGrowth$weight,INDEX=PlantGrowth$group,FUN=mean)
#sd of treatment and controls
tapply(PlantGrowth$weight,INDEX=PlantGrowth$group,FUN=sd)
PlantGrowth$weight
plot(PlantGrowth$weight) 
#create a factor for small and large based on weights
(weight.fac <- cut(PlantGrowth$weight, breaks=2,
                   labels=c("small","large"))) 
#another way of doing the factor
(weight.fac <- cut(PlantGrowth$weight,breaks=c(0,5,Inf),
                   labels=c("small","large"))) 
#extract the control data
newdata <- PlantGrowth[PlantGrowth$group=="ctrl", ]  
newdata
sort(PlantGrowth$weight)   #report the sorted weights
PlantGrowth[order(PlantGrowth$weight),]  #sort whole data frame 
 #by weights