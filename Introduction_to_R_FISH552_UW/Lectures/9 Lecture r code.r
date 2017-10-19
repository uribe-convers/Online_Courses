#=====Lecture 9 r code: statistics
help.search("negative binomial")
x <- seq(-4,4,0.001)
plot(x=x, y=dnorm(x), type="l", lwd=2, col="blue",yaxs="i", ylim=c(0,0.45),
     xlab="Value of x", ylab="Density")
quants <- qnorm(c(0.01,0.025,0.05,0.95,0.975,0.99))
round(quants,2)

pnorm(quants)

dnorm(quants)
rnorm(n=10)

#===random numbers
?.Random.seed
?set.seed
.Random.seed[1:4]
rnorm(1)
.Random.seed[1:4]
rnorm(1)
.Random.seed[1:4]

set.seed(100)
rnorm(3)
rnorm(3)
set.seed(100)
rnorm(3)
rnorm(3)

2^31-1
-2^31
rnorm(5)

#=====using the sample function
#roll some dice 10 times
sample(1:6,size=10,replace=T)

#flip a coin 10 times
sample(c("H","T"), size=10, replace=T)

#select five cards from a deck
cards <- paste(rep(c("A",2:10,"J","Q","K"),4),
               c("Club","Diamond","Heart","Spade"))
sort(cards)  #check that this worked! 
sample(cards,5)

#times out of 10000 you select 0,1,2,3,4,5 hearts
x <- vector(length=10000)
for (i in 1:10000) {
   x[i] <- length(grep("Heart", sample(cards,5)))
}
table(x)

#first two cards both Aces
x <- vector(length=10000)
for (i in 1:10000) {
   x[i] <- 2==length(grep("A", sample(cards,2)))
}
table(x)

#4 aces out of 7 cards (Texas hold 'em)
x <- vector(length=100000)
for (i in 1:100000) {
   x[i] <- length(grep("A", sample(cards,7)))>=4
}
table(x)

#=======Hands-on exercise 1
x <- rnorm(mean=80, sd=10, n=100)
x
sum(x >= 100 | x <= 60) / 100

#jackpot
sample(x=1:56, size=6, replace=F)

#find P(-z<=Z<=z)=0.24
#create the plot
x <- seq(-4,4,0.001)
plot(x=x, y=dnorm(x), type="l", lwd=2, col="blue",yaxs="i",
     ylim=c(0,0.45),xlab="Value of x", ylab="Density")
lines(x=x[x>=-1 & x<1], y=dnorm(x[x>=-1 & x<1]),
      type="h", col="#77777777")
axis(at=c(-1,1),lab=c("-x","+x"),side=1)

#find the solution
qnorm(0.5)  #50% of the curve is between -inf and 0
#need to go from 0.38 quantile to 0.62 to add to 0.24
#under the curve on either side
round(qnorm(0.38),3) #this is the answer!
round(qnorm(0.62),3)
#So we need -0.305 < X < 0.305
#check
round(pnorm(0.305)-pnorm(-0.305),3)
      
#=====exploratory data analysis
summary(iris)
boxplot(iris)
fivenum(iris[,3]) #min, lower quart, mean, upper q, max

pairs(iris[,1:4])

pairs(iris[,1:4], main = "Edgar Anderson's Iris Data", pch = 19,
      col = rep(c("#FF000055", "#00FF0055", "#0000FF55"), c(50,50,50)))
pairs(iris[,1:4], main = "Edgar Anderson's Iris Data", pch = 21,
      bg = rep(c("red", "green3", "blue"), table(iris$Species)))

#====histogram
hist(iris$Petal.Length, main="", col="gray", xlab="Petal length (cm)")
table(iris$Species)
table(iris$Petal.Length)
par(mfrow=c(1,3))
hist(iris[iris$Species=="setosa",]$Petal.Length, ylim=c(0,50),
     breaks=seq(1,7,0.5), main="setosa", col="gray", xlab="Petal length (cm)")
hist(iris[iris$Species=="versicolor",]$Petal.Length, ylim=c(0,50), 
     breaks=seq(1,7,0.5), main="versicolor", col="gray", xlab="Petal length (cm)")
hist(iris[iris$Species=="virginica",]$Petal.Length,  ylim=c(0,50),
     breaks=seq(1,7,0.5), main="virginica", col="gray", xlab="Petal length (cm)")

#==adding density curves
par(mfrow=c(1,1))
hist(iris$Petal.Length, main="", col="gray", xlab="Petal length (cm)",
     freq=F)
lines(density(iris$Petal.Length), lwd=2, col="red")
lines(density(iris$Petal.Length,adjust=0.4), lwd=2, col="blue")
lines(density(iris$Petal.Length,adjust=2), lwd=2, col="green3")

#====other types of plots
#from help files for image()
x <- y <- seq(-4*pi, 4*pi, len = 100)
r <- sqrt(outer(x^2, y^2, "+"))
image(z = z <- cos(r^2)*exp(-r/6), col  = gray((0:32)/32),
      axes = FALSE, main = "Math can be beautiful ...",
      xlab = expression(cos(r^2) * e^{-r/6}))


x <- y <- seq(-4*pi, 4*pi, len = 500)
r <- sqrt(outer(x^2, y^2, "+"))
image(z = z <- cos(r^2)*exp(-r/6), col  = gray((0:32)/32),
      axes = FALSE, main = "Math can be beautiful ...",
      xlab = expression(cos(r^2) * e^{-r/6}))

x <- y <- seq(-4*pi, 4*pi, len = 1000)
r <- sqrt(outer(x^2, y^2, "+"))
image(z = z <- cos(r^2)*exp(-r/6), col  = gray((0:32)/32),
      axes = FALSE, main = "Math can be beautiful ...",
      xlab = expression(cos(r^2) * e^{-r/6}))

#=====using t-test
methodA <- c(79.982, 80.041, 80.018, 80.041, 80.03, 80.029, 80.038, 79.968, 80.049, 80.029, 80.019, 80.002, 80.022)
methodB <- c(80.02, 79.939, 79.98, 79.971, 79.97, 80.029, 79.952, 79.968)

#briefly examine assumptions
boxplot(methodA, methodB, names = c("A", "B"))
par(mfrow = c(1,2))
qqnorm(methodA)
qqline(methodA)
qqnorm(methodB); qqline(methodB)

t.test(methodA, methodB)
resultsAB <- t.test(methodA, methodB)
names(resultsAB)
resultsAB$p.value

var(methodA)
var(methodB)

#test of equal variances
var.test(methodA, methodB)

#use equal variances
t.test(methodA, methodB, var.equal = TRUE)

#Mann-Whitney test
wilcox.test(methodA, methodB)

#======Hands-on Exercise 2



#====Ex 2 follow on
#this function randomly generates qqplots from different distributions
#so that you can test yourself! 
require(sm)
qqTester <- function(n, k = 30)
{
   require(sm)
   actual <- vector("numeric", length = n)
   
   for(i in 1:n)
   {
      z <- sample(1:4, 1, prob = c(0.4, 0.2, 0.2, 0.2))
      if (z == 1)
      {
         actual[i] <- "Normal"
         mu <- rnorm(1, 0, 15)
         y <- rnorm(k, mu, 10)
      }
      else if (z == 2)
      {
         actual[i] <- "Student t"
         y <- rt(k, 2)
      }
      else if (z == 3)
      {
         actual[i] <- "Exponential"
         y <- rexp(k, 1/4)
      }
      else
      {
         actual[i] <- "Cauchy"
         y <- rcauchy(k, 0, 5)
      }
      qqnorm(y)
      qqline(y)
      pause()
   }
   return(actual)
}
qqTester(n=10,k=30) #n is num of plots, k is num of points to generate

