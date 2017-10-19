#=====Lecture 6 r code: 
#which code runs the fastest? Why? From in-class exercise
X <- sample(1:100, size=10000000, replace=T)
system.time( unique(X)                     )
system.time( X[!duplicated(X)]             )  
system.time( X[!duplicated(X) == TRUE]     )  
system.time( X[duplicated(X) == FALSE]     )  
system.time( X[which(!duplicated(X))]      )   
system.time( as.numeric(levels(factor(X))) )

#===merge()
station1 <- cbind(time1=1:100, data=rnorm(100))

#note: a common mistake when using seq is to get 
#the length of the resulting vector wrong. Here it is 
#length 21.
station2 <- cbind(time2=seq(0,100,5), 
                  category=sample(1:3,replace=T,size=21))
station1
station2

merge(station1, station2, by.x="time1", by.y="time2")

#behind the scenes of merge()
intersect(1:10, 7:20)
match(1:10, c(1,3,5,9))

##=======Hands-on exercise 1
x <- 1:10
y <- c(1,3,5,9)

x %in% y
!is.na(match(x,y))
match(x,y, nomatch=0) > 0
is.element(x,y)
as.logical(match(x,y,nomatch=F))

#four different solutions
!is.na(match(x,y))                    #TRUE whenever there are not NAs
x %in% y                              #from ?match, VERY useful
!!match(x,y, nomatch=FALSE)           #what on earth is this doing?
as.logical(match(x,y, nomatch=FALSE)) #0=FALSE, all other numbers=TRUE

#side note: this code converts numbers into boolean T/F values
as.logical(c(-2,-1,0,1,2, NA))

#speed testing
x <- 100000000
y <- sample(x, size=1000000)
system.time(!is.na(match(x,y)))
system.time(as.logical(match(x,y, nomatch=FALSE)))
system.time(x %in% y)

#====Using dates in R
as.Date("2013/10/15")

as.Date("9/22/1983", format = "%m/%d/%Y")
as.Date("September 22, 1983", format = "%B %d, %Y")
as.Date("22SEP83", format = "%d%b%y")
as.Date("22sep83", format = "%d%b%y")

weekdays(as.Date("2013/10/15"))
months(as.Date("2013/10/15"))
quarters(as.Date("2013/10/15"))
julian(as.Date("2013/10/15"), origin=as.Date("2013/01/01"))

#====POSIX dates
as.POSIXlt("1983-9-22 23:20:05")
aDate <- as.POSIXlt("1983-9-22 23:20:05")
as.POSIXct("1983-9-22 23:20:05")
aDate <- as.POSIXct("1983-9-22 23:20:05")

#===common functions
min(c(as.Date("2013/10/15"), as.Date("2010/06/15")))
max(c(as.Date("2013/10/15"), as.Date("2010/06/15")))
mean(c(as.Date("2013/10/15"), as.Date("2010/06/14")))

difftime(as.Date("2013/10/15"), as.Date("2010/06/14"))

#Dates as factors
everyday <- seq(from=as.Date("2013-01-01"), 
                to=as.Date("2013-12-31"), by="day")
month <- months(everyday)
month <- factor(month, levels=unique(month), ordered=TRUE)
table(month)


#=========Hands on exercise 2
x <- as.Date("2013/10/15")
y <- as.Date("1918/07/18")
weekdays(c(x,y))
months(c(x,y))
difftime(x,y)

#==vignettes and packages
vignette(all=FALSE)   #vignettes for all installed *and* loaded packages 
vignette(all=TRUE)    #vignettes for all installed packages
vignette("googleVis") #package googleVis that does Hans Rosling GapMinder plots
edit(vignette("hcl-colors"))