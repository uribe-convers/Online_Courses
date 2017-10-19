#=====Lecture 3 r code
primates <- read.csv(file="Data/primates.csv", header=T)
primates
#===base graphics
plot(x=primates$Bodywt, y=primates$Brainwt)

plot(Brainwt~Bodywt, data=primates)

attach(primates)
plot(x=Brainwt, y=Bodywt)
detach(primates)

#changing the labels
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlab = "Body weight (kg)", 
     ylab = "Brain weight (g)")
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400))
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400),
     xaxs="i", yaxs="i")

#colors of points
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400),
     xaxs="i", yaxs="i", col="blue")

#=========IN-CLASS EXERCISE 1
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400), 
     cex=2, pch=19, col="blue")
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400), 
     cex=2, pch=19, col="red")
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400), 
     cex=2, pch=19, col=1)
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400), 
     cex=2, pch=19, col=c(2,4))
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400), 
     cex=1, pch=19, col=c(2,4))
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400), 
     cex=2, pch=3, col=c(2,4))

#Named colors
colors()
point.colors <- c("red", "orange", "green", "blue", "magenta")
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400), 
     cex=2, pch=19, col=point.colors)

#point types
?points  #useful help for different point types, with code

plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400), 
     cex=2, pch=1, col="red")
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400), 
     cex=2, pch=21, col="black", bg="salmon")

#using par()
?plot
?par
par()

#using par for global changes
old.par <- par()   #save current values in par()
par(col.axis="red")
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400), 
     cex=2, pch=21, col="black", bg="salmon")
plot(1:3)
par(old.par)   #restore defaults of par()
plot(1:3)

#symbols as initial letters
primates[,1]
pch <- substr(primates[,1],1,1) #vector of first letter of each species
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400), 
     cex=1, pch=pch)

#size of circle proportional to data
primates[,2]
cex <- sqrt(primates[,2])/5 #vector of first letter of each species
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim=c(0,300), ylim=c(0,1400), 
     cex=cex, pch=19)

#Adding legends
legend(x="topright", 
       legend=primates[,1],
       pt.bg=1:5,
       pch=21:25,
       bty="n")

#changing the axis labels
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim = c(0,300), ylim = c(0,1500),
     xaxs = "i", yaxs = "i",
     cex = 2, pch = 19, col = 1:5,
     xlab = "Body weight (kg)", 
     ylab = "Brain weight (g)",
     yaxp = c(0, 1500, 3),
     main = "Primate body and brain weights")
legend(x = "topright", legend = primates[,1],
       pt.cex = 2, pch = 19, col = 1:5, bty = "n")

#using the axis() command
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim = c(0,300), ylim = c(0,1500),
     xaxs = "i", yaxs = "i",
     cex = 2, pch = 19, col = 1:5,
     xlab = "Body weight (kg)", 
     ylab = "Brain weight (g)",
     yaxp = c(0, 1500, 3),
     yaxt = "n")
axis(side=2, at=seq(0,1500,300), 
     labels=c(0,300,600,900,1200,">1500"))
     

#adding text using locator()
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim = c(0,300), ylim = c(0,1500),
     xaxs = "i", yaxs = "i",
     cex = 2, pch = 19, col = 1:5,
     xlab = "Body weight (kg)", 
     ylab = "Brain weight (g)",
     yaxp = c(0, 1500, 3))
locator(1)
text(x=207, y=306, label="Gorilla")  #use the values returned by locator()

#adding text using text()
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim = c(0,300), ylim = c(0,1500),
     xaxs = "i", yaxs = "i",
     cex = 2, pch = 19, col = 1:5,
     xlab = "Body weight (kg)", 
     ylab = "Brain weight (g)",
     yaxp = c(0, 1500, 3))
#pos=1 below, 2 left, 3 top, 4 right
text(x = primates$Bodywt, y = primates$Brainwt,
     labels = primates[,1], pos=4)

#using identify()
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim = c(0,300), ylim = c(0,1500),
     xaxs = "i", yaxs = "i",
     cex = 2, pch = 19, col = 1:5,
     xlab = "Body weight (kg)", 
     ylab = "Brain weight (g)",
     yaxp = c(0, 1500, 3))
identify(x = primates$Bodywt, y = primates$Brainwt,
         labels = primates[,1], n = 2)

#adding more lines to the plot
plot(x = primates$Bodywt, y = primates$Brainwt,
     xlim = c(0,300), ylim = c(0,1500),
     xaxs = "i", yaxs = "i",
     cex = 2, pch = 19, col = 1:5,
     xlab = "Body weight (kg)", 
     ylab = "Brain weight (g)",
     yaxp = c(0, 1500, 3))
lines(x=seq(50,200,50), y=c(200,450,500,300),
      type="b", lwd=3, lty=2)
points(x=seq(100,250,50), y=seq(100,250,50), 
       cex=3, pch=17)

####=========Hands-on exercise 3
x <- seq(-3,3,length.out=500)
y <- exp(-(x^2))/sqrt(2*pi)
plot(x,y, type="l", lwd=2, col="blue", 
     xlab="x", ylab="density",
     main="Standard normal density \n mean=0, sd=1",
     xaxt="n")
lines(x[x> -1.96 & x<1.96],y[x> -1.96 & x<1.96], type="h")
text(x=0,y=0.15,"95% of density", col="white")
axis(side=1, at=c(-3,-1.96,0,1.96,3))