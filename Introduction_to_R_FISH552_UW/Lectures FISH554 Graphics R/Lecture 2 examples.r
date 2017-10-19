###piecharts vs. horizontal barplots
acc <- read.csv("Accidents.csv")     #read in data
pie(x=acc$Number, labels=acc$Type)   #default unordered piechart
temp <- order(acc$Number)            #get sort order from largest to smallest
acc.sort <- acc[temp,]               #sort the data and store in a new variable
pie(x=acc.sort$Number, labels=acc.sort$Type, main="DANGERS: indexed by the number of \nGoogle results for\n\"Died in a ____ accident\"")

#**DO EXERCISE 1
#**DO EXERCISE 2

####using par to change system attributes everywhere
par()                           #what values are contained in par? 
old.par <- par()                #store current par values
par()$col                       #current default color for ALL plots
plot(1:10, cex=3, pch=19)       #plot some circles with current default color
par(col="red")                  #change default color to red
plot(1:10, cex=3, pch=19)       #for plot changes border and point colors
barplot(1:10)                   #no effect on barplot
boxplot(1:10)                   #changes border color for boxplot
par(col="black")                #restore to black 
plot(1:10, cex=3, pch=19)       #check that color returns to black

####Adding a fitted trendline to a plot
x <- runif(20,1,10)  #generate 20 values from a uniform between 1 and 10
y <- x + rnorm(20)  #add some normal random numbers to the x values
plot(x, y, col="gray", pch=16)   #plot the points
lmfit <- lm(y~x)                 #find the best fit using a linear model lm, store result in object lmfit
abline(lmfit)                    #use the linear model object as input to abline

####lines and ablines
abline(h=6)                      #draw a horizontal line at 6
abline(v=4, lty=2)                      #draw a dashed vertical line at 4


#**DO EXERCISE 3: sparklines
WC <- read.csv("WCcatches.csv")
par(oma=c(1,1,1,8), mar=c(1,1,1,1))
plot(1,type="n",axes=F,ann=F, xlim=c(1950,2005),ylim=c(0,11), yaxs="i", xaxs="i")   #ensure axes go to the edge of the data points (remove gap between 0 and x and y axes)                            
#hint: use "lines" command and some loops
#if you want to change colors, use command arrows

####overplotting, using and adjusting symbols
par(oma=c(0,0,0,0), mar=c(5,4,1,1))
OF <- read.csv("OldFaithfulSmall.csv")        #time between eruptions of the Old Faithful geyser in Yellowstone National Park
plot(x=OF)                                    #default points
par()[c("pch","cex","col","bg")]              #what are current default symbol type, size, color, background color?
plot(x=OF, cex=3)                             #large size points
plot(x=OF, cex=seq(from=1,to=4.8,by=0.2))     #recycle through sizes from 1 to 4.8
plot(x=OF, cex=(OF$Minutes-40)/20)            #recycle through sizes, according to height on y axis
plot(x=OF, cex=2, pch=1:25)                   #cycle through symbol types
plot(x=OF, cex=2, col=1:25)                   #cycle through foreground colors
plot(x=OF, cex=2, col="black", bg=1:25, pch=21)       #cycle through background colors
plot(x=OF[1:25,], cex=3, col="red", bg="gray", pch=1:25)    #effect on different symbols of col and bg
plot(x=OF, cex=3, col=rainbow(80), pch=19)                  #different colors for circles using symbol 19, using col
plot(x=OF, cex=3, col="black", bg=rainbow(80), pch=21)      #different colors for symbol 21, using bg
plot(x=OF[1:26,], cex=2, col="red", pch=letters[1:26])      #use letters as symbols
plot(x=OF[1:26,], cex=2, col="green", pch=LETTERS[1:26])    #use upper case letters as symbols
plot(x=OF[1:26,], cex=2, col="red", pch=c("*","}","]","{")) #use other characters
plot(x=rnorm(100000),y=rnorm(100000),pch=".")               #single pixel dots using "."

#full Old Faithful data
par(oma=c(0,0,0,0),mar=c(5,5,1,1))
OF <- read.csv(file="OldFaithful2011.csv")
plot(OF)
hist(OF$Minutes,breaks=seq(50.05,125.05,0.1))
nn <- nrow(OF)
plot(x=OF[-nn,"Minutes"],y=OF[-1,"Minutes"],pch=19)
plot(x=OF[-nn,"Minutes"],y=OF[-1,"Minutes"], xlab="This interval",ylab="Next interval",pch=19)

#**DO EXERCISE 4: solving overplotting with full data for Old Faithful eruptions
OF <- read.csv(file="OldFaithful2011.csv")
plot(x=OF[-nn,"Minutes"],y=OF[-1,"Minutes"], xlab="This interval",ylab="Next interval",pch=19)


####Area plots using stackpoly
#library(plotrix)   #installs plotrix package which includes "stackpoly" 
require(plotrix)   #on running code multiple times this installs plotrix if not installed otherwise gives error message
testx<-t(matrix(abs(rnorm(100))+1,nrow=5))
testx
stackpoly(x=testx, stack=TRUE, staxx=FALSE, border=NA, axis4=F)
stackpoly(x=testx, stack=TRUE, staxx=T, border=NA, axis4=F, xaxlab=1950:1969)

####Using polygons to demonstrate fill shading
testvec<-rowSums(matrix(abs(rnorm(1000)),nrow=50))   #generate some data
plot(1,type="n",ann=F, xlim=c(1950,1999),ylim=c(0,25), yaxs="i", xaxs="i")   #blank plot
polygon(x=c(1950:1999,1999:1950), y=c(testvec,rep(0,50)), col="gray", border="black")
polygon(x=c(1950:1999,1999:1950), y=c(testvec,rep(0,50)), col="black", border="black", angle=c(45), density=20)
testvec

####Using polygons for quantile plots
testx<-t(matrix(rnorm(1000),nrow=50))   #generate some data
CIs <- apply(testx,MARGIN=1,quantile,c(0.05,0.15,0.3,0.5,0.7,0.85,0.95))  #apply function quantile to rows
plot(1,type="n",ann=F, xlim=c(1950,1969),ylim=c(-3,3), yaxs="i", xaxs="i")   #blank plot
polygon(x=c(1950:1969,1969:1950), y=c(CIs[1,],rev(CIs[7,])), col="gray80", border=NA)
polygon(x=c(1950:1969,1969:1950), y=c(CIs[2,],rev(CIs[6,])), col="gray40", border=NA)
polygon(x=c(1950:1969,1969:1950), y=c(CIs[3,],rev(CIs[5,])), col="gray10", border=NA)
lines(x=1950:1969,y=CIs[4,],col="white",lwd=3)
lines(x=1950:1969,y=CIs[4,],col="white",lwd=3, type="p")

#**DO CHALLENGE EXERCISE: university salaries
sal <- read.csv("UnivSalaries.csv")

#**DO CHALLENGE EXERCISE: line widths and types
####different types of lines
par(oma=c(0,0,0,0), mar=c(5,4,1,1))
plot(1,type="n",axes=F,ann=F, xlim=c(0,10),ylim=c(0,10), yaxs="i", xaxs="i")   #blank plot with axes from 0-10, 0-10
