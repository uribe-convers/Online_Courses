#=====Lecture 8 r code
possum <- read.csv(file="Data\\possum.csv")
head(possum,n=3)

#DESCRIPTION of possum data
#case - observation number
#site - one of seven locations where possums were trapped
#Pop - a factor which classifies the sites as Vic Victoria, other New South Wales or Queensland
#sex - a factor with levels f female, m male 
#age - age
#hdlngth - head length
#skullw - skull width
#totlngth - total length
#taill - tail length
#footlgth - foot length
#earconch - ear conch length
#eye - distance from medial canthus to lateral canthus of right eye
#chest - chest girth (in cm)
#belly - belly girth (in cm)

#=====Using mfrow and mfcol
names(possum) #get the names right... 

#I use a function here so I don't need to repeat the same commands
#over and over again
#The "..." means anything I put there will go wherever a "..."
#appears inside the function
plot.possum <- function(possum, ...) {
   par(mfcol=c(2,3))
   plot(possum$totlngth, possum$footlgth, xlab="Total length (cm)", ylab="Foot length (cm)", ...)
   plot(possum$totlngth, possum$hdlngth, xlab="Total length (cm)", ylab="Head length (cm)", ...)
   plot(possum$skullw, possum$footlgth, xlab="Skull width (cm)", ylab="Foot length (cm)", ...)
   plot(possum$skullw, possum$hdlngth, xlab="Skull width (cm)", ylab="Head length (cm)", ...)
   plot(possum$chest, possum$footlgth, xlab="Chest girth (cm)", ylab="Foot length (cm)", ...)
   plot(possum$chest, possum$hdlngth, xlab="Chest girth (cm)", ylab="Head length (cm)", ...)
}
possum <- read.csv(file="Data\\possum.csv")
plot.possum(possum=possum)

#show the data-ink in blue
plot.possum(possum=possum, col="blue", pch=19)

#effects of changing the margins
par(mar=c(0,0,0,0), oma=c(5,5,1,1))
plot.possum(possum=possum)


#=====IN-CLASS Exercise 1
#===base case to start with
#possum <- read.csv(file="possum.csv")
par(mfcol=c(2,3))
plot(possum$totlngth, possum$footlgth)
plot(possum$totlngth, possum$hdlngth)
plot(possum$skullw, possum$footlgth)
plot(possum$skullw, possum$hdlngth)
plot(possum$chest, possum$footlgth)
plot(possum$chest, possum$hdlngth)

#===final answer to Exercise 1
#first change the margins
par(mfcol=c(2,3), mar=c(0,0,0,0), oma=c(5,5,4,1))
#get rid of the xaxis
plot(possum$totlngth, possum$footlgth, xaxt="n")
#add text for the y-axis label
mtext(text="Foot length (cm)", side=2, line=3)
plot(possum$totlngth, possum$hdlngth)
#add test for x and y (since this is the bottom left plot)
mtext(text="Head length (cm)", side=2, line=3)
mtext(text="Total length (cm)", side=1, line=3)
plot(possum$skullw, possum$footlgth, xaxt="n", yaxt="n")
plot(possum$skullw, possum$hdlngth, yaxt="n")
mtext(text="Skull width (cm)", side=1, line=3)
plot(possum$chest, possum$footlgth, xaxt="n", yaxt="n")
plot(possum$chest, possum$hdlngth, yaxt="n")
mtext(text="Chest girth (cm)", side=1, line=3)

mtext("My nice plot", outer=T, line=2, side=3)
#====Using layout()
#first "Clear All" from the Plots window
mat <- matrix(c( 1, 2, 3, 4, 5,
                 6, 7, 8, 9,10,
                 11,12,13,14,15), nrow=3, ncol=5, byrow=T)
layout(mat=mat, widths = c(1,3,5,1,3), heights = c(2,2,1) )
par(oma=c(2,2,2,2), cex=1.5)  #make some space around the edges
layout.show(n=15)

#complex arrangement
mat <- matrix(c( 1, 1, 3, 4, 5,
                 1, 1, 3, 6, 7,
                 2, 2, 2, 2, 7), nrow=3, ncol=5, byrow=T)
layout(mat=mat, widths = c(1,3,5,1,3), heights = c(2,2,1) )
par(oma=c(2,2,2,2), cex=1.5)  #make some space around the edges
layout.show(n=7)

#layout matrix for Worm et al. 2009 Figure 3, note byrow=F
layout.matrix <- matrix(c(11,1,2,3,4,5,11,6,7,8,9,10,
                          0,0,0,0,0,0,13,12,12,12,12,12), 
                        nrow=6, ncol=4, byrow = F)
layout.matrix
layout(layout.matrix, widths=c(2.5,2.5,1.6,5),heights=c(0.5,rep(1,5)))
par(oma=c(2,2,2,2), cex=1.5)  #make some space around the edges
layout.show(n=13)

#====plot with histograms, not perfect
#CLEAR the plot area! 
lay4.mat <- matrix(c(2,0,1,3),nrow = 2,byrow=TRUE)
lay4.mat

layout(lay4.mat, c(3,1), c(1,3), respect=TRUE)
hdlngth.hist <- hist(possum$hdlngth, plot = FALSE)
totlngth.hist <- hist(possum$totlngth, plot = FALSE)
par(mar = c(3,2.5,1,1))
plot(possum$hdlngth ~ possum$totlngth, main = "")
par(mar = c(0,3,1,1))
barplot(totlngth.hist$counts, xaxs="i", yaxs="i")
par(mar = c(3,0,1,1))
barplot(hdlngth.hist$counts, horiz = TRUE, yaxs="i", xaxs="i")

#==========BOXPLOTS
#CLEAR ALL PLOTS
catches <- read.csv("data\\FAO catch.csv")    #read in catch data from Branch et al. (2010) Nature 468:431-435
names(catches)
boxplot(catches$TL~catches$Habitat)     #trophic level by groups
boxplot(catches$Lmax~round(catches$TL,1))  #max length by trophic level in 0.1 bin groups
boxplot(catches$Lmax~round(catches$TL,1),log="y", col="darkgreen",
        xlab="Trophic level", ylab="Maximum length (cm)")  #logged y axis

#=========BARPLOTS
VADeaths
par(mfrow=c(1,2))
barplot(VADeaths, legend=TRUE, ylab="Death rate")
barplot(VADeaths, legend=TRUE, ylab="Death rate", beside=TRUE)

par(mfrow=c(1,2))
barplot(t(VADeaths), legend=TRUE, ylab="Death rate", beside=TRUE, args.legend=list(x="topleft"))
barplot(t(VADeaths), legend=TRUE, ylab="Death rate", beside=TRUE, args.legend=list(x="bottomright"), horiz=T)

#======Hands-on exercise 2
head(iris)
names(iris)
iris
par(mfrow=c(1,2))
boxplot(Petal.Length~Species, data=iris)
#boxplot(iris$Petal.Length~iris$Species)

mtext(side=3,"Petal length")
boxplot(Petal.Width~Species, data=iris)
mtext(side=3,"Petal width", line=0)
par()

measure <- rep(names(iris[1:4]),each=nrow(iris))
data <- c(iris[,1], iris[,2], iris[,3], iris[,4])
length(measure)
length(data)
newiris <- data.frame(measure, data)
newiris
boxplot(data~measure, data=newiris)


x <- matrix(nrow=10,ncol=10)
x[] <- sample(1:10,size=100,replace=T) 

x[x==10] <- NA
x