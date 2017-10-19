####################################
#Lecture 6, Trevor Branch, FISH 507H
#Fall 2011
#Using color in R
#The essential pdf document describing all 657 named colors in R is found at:
#http://research.stowers-institute.org/efg/R/Color/Chart
#download this and save it somewhere easily accessible, e.g. on desktop or Libraries\Documents\Rcolors.pdf
####################################

colors()                         #numbered and named colors in R 
barplot(1:10,col=9)              #does NOT access the colors in "colors()"
barplot(1:10,col=colors()[9])    #these are three ways of plotting with the same (rather ugly) color
barplot(1:10,col="aquamarine1")  #name
barplot(1:10,col="#7FFFD4")      #hexadecimal code: F0 (red) F8 (green) FF (blue). 
#Note: base-16 (hexadecimal) not base-10 (decimal).
#in decimal, 765 means 7*10*10 + 6*10 + 5*10^0 = 765       [10^0 = 1]
#in hexadecimal, 765 means 7*16*16 + 6*16 + 5*16^0 = 1893  [16^0 = 1]  
#but hexadecimal also has letters encoding for numbers 10-15: A (10), B(11), C(12), D(13), E(14), F(15)
#Thus 6FA means 6*16*16 + 15*16 + 10*1 = 1786


col2rgb("yellow")  #return the red, green, blue components of a color
rgb(1.0, 1.0, 0.0) #convert RGB colors scaled from 0 to 1 into a hexadecimal number  
rgb(255, 255, 0, maxColorValue=255)  #convert RGB integers between 0 and 255 into hexadecimal
colors()[grep("red",colors())]       #return all named colors with "red" in their names
                                     #'grep' is a very useful command to return locations of matches of strings

#Automatic function to decide whether to make text black or white when plotting it over a color. 
#if average of red, blue, green is >127 (half of 255) then the background is light, needing black text
SetTextContrastColor <- function(color)
{
  ifelse( mean(col2rgb(color)) > 127, "black", "white")  #high RGB values indicate darkness
}      #ifelse is shorthand way of writing if-then-else statement

####generate color key
plot(1,ann=F,xlim=c(0,10),ylim=c(0,10),xaxs="i",yaxs="i", type="n",axes=F)
for (i in 1:10) {
   for (j in 1:10) {
      temp.num <- 10*(i-1)+j
      plot.color <- colors()[temp.num]
      rect(xleft=j-1,xright=j,ybottom=10-i,ytop=11-i,col=plot.color, border=NA)
      text(x=j-0.5,y=10-i+0.5,labels=temp.num)
   }
}
box()

#change color of text depending on darkness of background, make it 5X20 
plot(1,ann=F,xlim=c(0,5),ylim=c(0,20),xaxs="i",yaxs="i", type="n",axes=F)
for (i in 1:20) {
   for (j in 1:5) {
      temp.num <- 5*(i-1)+j
      plot.color <- colors()[temp.num]
      rect(xleft=j-1,xright=j,ybottom=20-i,ytop=21-i,col=plot.color, border=NA)
      text.color <- SetTextContrastColor(plot.color)  #use the function defined above to make text white or black
      text(x=j-0.5,y=20-i+0.5,labels=plot.color, col=text.color)
   }
}
box()

#add color, make the array generalizable, plot every single named color but use the number
par(oma=c(0.5,0.5,0.5,0.5), mar=c(0,0,0,0))
ymax <- 33
xmax <- 20
plot(1,ann=F,xlim=c(0,xmax),ylim=c(0,ymax),xaxs="i",yaxs="i", type="n",axes=F)
for (i in 1:ymax) {
   for (j in 1:xmax) {  #change to 5 to make the widths wider
      temp.num <- xmax*(i-1)+j
      if (temp.num <= length(colors())) {   #only plot named colors, as soon as exceeded, stop plotting
         plot.color <- colors()[temp.num]
         rect(xleft=j-1,xright=j,ybottom=ymax-i,ytop=ymax-i+1,col=plot.color, border=NA)
         text.color <- SetTextContrastColor(plot.color)  #use the function defined above to make text white or black
         text(x=j-0.5,y=ymax-i+0.5,labels=temp.num, col=text.color, cex=0.7)
      }
   }
}
box()

######different amounts of transparency (an ugly example, yes)
par(bg=colors()[19])   #change the background color of the plotting region
plot(1,ann=F,xaxs="i",yaxs="i", type="n",axes=F)
hex.color <- rgb(t(col2rgb("green")), maxColorValue=255) #t() changes column to vector
trans.col <- paste(hex.color, c("00", "22","44","66","88","AA","CC","EE", "FF"), sep="")
barplot(1:9,col=trans.col)
par(bg="white")

########R color brewer package
require(RColorBrewer)
display.brewer.all()
display.brewer.all(type="div")
display.brewer.all(type="seq")
display.brewer.all(type="qual")

#display a divergent palette
display.brewer.pal(7,"BrBG")

## display a qualitative palette
display.brewer.pal(7,"Accent")

#display several palettes simultaneously
display.brewer.all(n=10, exact.n=FALSE)

#create a sequential palette for usage and show colors
mypalette<-brewer.pal(7,"Greens")
image(1:7,1,as.matrix(1:7),col=mypalette,xlab="Greens (sequential)",
      ylab="",xaxt="n",yaxt="n",bty="n")

#print out all names, maximum number of colors, and divergent qualities
brewer.pal.info


#####example of using a color brewer palette
XX <- runif(10000, min=0,max=0.9999999)
YY <- runif(10000, min=0,max=0.9999999)
plot(XX, YY)
mypalette<-brewer.pal(7,"RdYlGn") #note, a lower case L "l" not a capital i "I"
XXnumbers1to7 <- floor(XX*7)+1    #convert values to numbers 1 through 7, coding for the 7 palette colors
table(XXnumbers1to7)              #check to see if math done right
colors <- mypalette[XXnumbers1to7]   
plot(x=XX, y=YY, col="transparent", bg=colors,pch=21)

#overlay some transparency
XX <- runif(10000, min=0,max=0.9999999)
YY <- runif(10000, min=0,max=0.9999999)
mypalette<-brewer.pal(7,"RdYlGn") #note, a lower case L "l" not a capital i "I"
XXnumbers1to7 <- floor(XX*7)+1    #convert values to numbers 1 through 7, coding for the 7 palette colors
YYnumbers1to7 <- floor(YY*7)+1    #convert values to numbers 1 through 7, coding for the 7 palette colors
XXcolors <- mypalette[XXnumbers1to7]   
YYcolors <- mypalette[YYnumbers1to7]   
XXtrans <- paste(XXcolors,"77",sep="")
YYtrans <- paste(YYcolors,"77",sep="")
plot(x=XX, y=YY, col="transparent", bg=XXtrans,pch=21)
par(new=T)
plot(x=XX, y=YY, col="transparent", bg=YYtrans,pch=21)

