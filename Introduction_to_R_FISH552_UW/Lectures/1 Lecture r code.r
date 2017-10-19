#======Exercise 1
1+2*(3+4)
log(4^3+3^(2+1))
sqrt((4+3)*(2+1))
((1+2)/(3+4))^2
answer <- log(2.5)
(myName <- "Trevor Branch")

#=======random class workings
answer <- log(2.718282)
answer
mode(answer)
is.numeric(answer)
typeof(answer)
answer <- as.integer(answer)
typeof(answer)

answer <- 3.345452
answer <- as.integer(answer)
answer

answer <- 3.345452
(myName <- "Trevor Branch")
is.character(answer)
is.character(myName)
typeof(myName)
mode(myName)

lengths <- c(7.8, 9.0, 7.1, 8.8, 8.8)
lengths
1:10
seq(from=1, to=10, by=2)
seq(1,10,2)
seq(from=1, to=10,length.out=5)

rep(3,times=10)
y <- 1:3
rep(y,times=4)
rep(y,length=10)
rep(y,length=30)

(x <- 1:3)
log(x)
x+1
x*2
y <- 4:6
x + y
y - x
x / y
x * y

#======Exercise 2
?rep
1:99
seq(1,99,2)
#long way around
x <- rep(1,3)
c(x,x+1,x+2)
#short answer
rep(1:3, each=3)
c(1:5,4:0)
1/1:10         #note that : has precedence over /
paste("1/",1:10,sep="")  #if you want the fractions! 
(1:6)^3        #note that ^ has precedence over :

#==========Arithmetic functions
library(help = "datasets")
min(islands)
max(islands)
mean(islands)
median(islands)
quantile(islands)
var(islands)
sd(islands)
range(islands)

length(islands)
nislands <- length(islands)
1:nislands
years <- seq(from=2013, length=nislands)
years