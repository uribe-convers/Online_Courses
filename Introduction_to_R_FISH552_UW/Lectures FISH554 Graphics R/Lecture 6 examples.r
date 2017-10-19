####################################
#Lecture 6, Trevor Branch, FISH 507H
#Fall 2011
#Text annotations, mathematical expressions
#legends, custom axes
####################################

#####TEXT ANNOTATIONS
x <- 1:10
y <- x+rnorm(10)
ylim <- c(min(y)-2, max(y)+2)
xlim <- c(min(x)-2, max(x)+2)
plot(x,y, xlim=xlim, ylim=ylim)
text(x=x,y=y,LETTERS[1:10])  #plot text centered on points

#using locator() function
locator()  #press ESC to stop and return the values of the positions you clicked on

#positioning text around the points
plot(x,y, xlim=xlim, ylim=ylim)
text(x=x,y=y,LETTERS[1:10], pos=1)  #text underneath
text(x=x,y=y,LETTERS[1:10], pos=2)  #text to the left
text(x=x,y=y,LETTERS[1:10], pos=3)  #text on top
text(x=x,y=y,LETTERS[1:10], pos=4)  #text to the right

#using offset to place text further away from points
plot(x,y, xlim=xlim, ylim=ylim)
text(x=x,y=y,LETTERS[1:10], pos=4)              #text to the right (default)
text(x=x,y=y,LETTERS[1:10], pos=4, offset=0.2)  #text closer to the right
text(x=x,y=y,LETTERS[1:10], pos=4, offset=1.5)  #text further on the right

#pos can be a vector allowing some points below and other points above
plot(x,y, xlim=xlim, ylim=ylim)
text(x=x,y=y,LETTERS[1:10], pos=c(rep(1,5),rep(3,5)))  

#fine-grained adjustment of positions using adj
plot(x,y, xlim=xlim, ylim=ylim)
text(x=x,y=y,LETTERS[1:10], adj=c(0.5,0.5))  #plot text centered on points
text(x=x,y=y,LETTERS[1:10], adj=c(1,1))      #plot text below and to the left
text(x=x,y=y,LETTERS[1:10], adj=c(0.5,1))    #plot text below but closer to points

####Adding a label in the top left corner of the panel
####converting from x-y space to 0-1 space for consistency across panels
plot(x,y, xlim=xlim, ylim=ylim)
text(x=xlim[1], y=ylim[2],"A")  #fine when no gap left

plot(x,y, xlim=xlim, ylim=ylim, xaxs="i", yaxs="i")  #no gap between min value and plot edge
text(x=xlim[1], y=ylim[2],"A")  #does not work

plot(x,y, xlim=xlim, ylim=ylim, xaxs="i", yaxs="i")
tmp <- par("usr")   #get the user coordinates
tmp                 #xmin, xmax, ymin, ymax
text(x=tmp[1]+0.05*(tmp[2]-tmp[1]), y=tmp[3]+0.95*(tmp[4]-tmp[3]),"(a)")  #do some calculations


#####Print.letter function for labels in top-left position of panels
print.letter <- function(label="(a)",xy=c(0.1,0.925),...) {   #... means any new parameters are copied faithfully to text() below
  tmp <- par("usr")
  text.x <- tmp[1]+xy[1]*diff(tmp[1:2])   #x position, diff=difference
  text.y <- tmp[3]+xy[2]*diff(tmp[3:4])   #y position
  text(x=text.x, y=text.y, labels=label, ...)             
}
plot(x,y, xlim=xlim, ylim=ylim, xaxs="i", yaxs="i")
print.letter(label="(a)", xy=c(0.05,0.95), cex=1.3, font=2, col="black")  #font=2 is bold
plot(x,y, xlim=xlim, ylim=ylim, xaxs="i", yaxs="i")
print.letter(label="(a)", xy=c(0.05,0.95), cex=1.3, font=1, col="black")  #change font to plain text 
plot(x,y, xlim=xlim, ylim=ylim, xaxs="i", yaxs="i")
print.letter(label="Hoplostethus atlanticus", xy=c(0,0.95), cex=1.3, font=3, col="black", pos=4)  #species name, note pos=4.  
plot(x,y, xlim=xlim, ylim=ylim, xaxs="i", yaxs="i")
print.letter(label="(a)", xy=c(0.05,0.95), cex=2, font=1, col="black")    #increase size using cex

plot(x,y, xlim=xlim, ylim=ylim, xaxs="i", yaxs="i")
print.letter(label="(a)", xy=c(0.05,1.05), cex=2, font=1, col="black", xpd=NA)  #print label outside plot region using xpd=NA

plot(x,y, xlim=xlim, ylim=ylim, xaxs="i", yaxs="i")
print.letter(label="(a)", xy=c(0.05,1.05), cex=2, font=1, col="black", xpd=NA, family="serif") #times new roman

plot(x,y, xlim=xlim, ylim=ylim, xaxs="i", yaxs="i")
print.letter(label="(a)", xy=c(0.05,1.05), cex=2, font=1, col="black", xpd=NA, family="sans")  #arial

plot(x,y, xlim=xlim, ylim=ylim, xaxs="i", yaxs="i")
print.letter(label="(a)", xy=c(0.05,1.05), cex=2, font=1, col="black", xpd=NA, family="mono")  #courier

#####Mathematical expressions
plot(x,y, xlim=xlim, ylim=ylim, xaxs="i", yaxs="i", ylab="", xlab="")
mtext(side=1, expression(paste("Concentration of ", CO[2])), line=2.5, cex=1.3)  #superscript within text string
mtext(side=2, expression(paste("Mean catch (", 10^6," t)")), line=2.5, cex=1.3)  #superscript within text string
mtext(side=3, expression(CO[3]^{"2-"}), line=1, cex=1.3)  #superscript and subscript, common for chemistry
mtext(side=4, expression(Ca^{"2+"}), line=1, cex=1.3)  #superscript and subscript, common for chemistry

plot(x,y, xlim=xlim, ylim=ylim, xaxs="i", yaxs="i", ylab="", xlab="")
mtext(side=1, expression(paste("Temperature (", degree, "C) in 2003")), line=2.5, cex=1.3)  #degree symbol in temperatures
mtext(side=2, expression(paste("Mean catch (", 10^-6," t)")), line=2.5, cex=1.3)            #negative superscript within text string

####Using ASCII characters 
#alt-num-248 = °
#alt-num-253 = ²
#for a full list, see http://www.asciitable.com/
mtext(side=3, "Temperature (°C) in 2003", line=2.5, cex=1.3)  #degree symbol in temperatures

#more complicated mathematical equations
plot(1,1,type="n")
text(1,1.3,expression(bar(x)==sum(frac(x[i],n),i==1,n)), family="serif")    #bars, fractions, summations
text(1,1.2,expression(hat(beta)==(X^t*X)^{-1}*X^t*y), family="serif")       #hats, matrix operations
text(1,1.1,expression(z[i]==sqrt(x[i]^2+y[i]^2)), family="serif")           #square roots

#using substitute to allow for variable values inside text strings, also use of greek symbols
plot(1,1,type="n",xlim=c(0,6), ylim=c(0,6), yaxt="n", xaxt="n", ann=F)
greeks <- list(expression(alpha), expression(beta), expression(gamma), expression(delta), expression(epsilon), expression(pi),expression(sigma))
for (degC in 0:6) {
   axis(1,at=degC,lab=substitute(paste(degC, degree, "C"),list(degC=degC)))  #degree symbol in temperatures
   axis(2,at=degC,lab=greeks[[degC+1]], las=1)                               #each element of the list is a mathematical expression
}

#logarithmic axes
plot(1,1,type="n",xlim=c(0,5), ylim=c(0,5), yaxt="n", xaxt="n", ann=F)
temp <- expression(10^0, 10^1, 10^2, 10^3, 10^4, 10^5)
axis(side=1,at=0:5,lab=temp)
axis(side=2, at=log(c(1,2,5,10,20, 50,100)), lab=c(1,2,5,10,20,50,100), las=1)


########Legends: boxes
xx <- read.csv(file="Worm2009Fig3.csv", stringsAsFactors=T)
plot(x=xx$BBmsy, y=xx$FFmsy, xlim=c(0,2), ylim=c(0,2), type="n",xaxs="i", yaxs="i", ann=F,las=1)
legend(x=0,y=2,legend=c("Gadus morhua","Sardinops sagax", "Raja rhina", "Solea vulgaris"))   #no lines or colors specified! 
legend(x=0,y=1.5,legend=c("Gadus morhua","Sardinops sagax", "Raja rhina", "Solea vulgaris"), bty="n")   #remove legend border, note bty NOT border

legend(x=0,y=1,legend=c("Gadus morhua","Sardinops sagax", "Raja rhina", "Solea vulgaris"), bty="n",
         fill=c("red","orange","green","blue"))   #add boxes with color 
legend(x=0,y=0.5,legend=c("Gadus morhua","Sardinops sagax", "Raja rhina", "Solea vulgaris"), bty="n",
         fill=c("red","orange","green","blue"), border=c("red","orange","green","blue"))   #box filled and outlined with same color

savefont <- par(font=3) #change to italics font and save current value of font type
legend(x="topright",legend=c("Gadus morhua","Sardinops sagax", "Raja rhina", "Solea vulgaris"), bty="n",
         fill=c("red","orange","green","blue"), border=c("red","orange","green","blue"))   #box filled and outlined with same color
par(font=1)  #return default font

##Display builtin position strings for legends
plot(x=xx$BBmsy, y=xx$FFmsy, xlim=c(0,2), ylim=c(0,2), type="n",xaxs="i", yaxs="i", ann=F,las=1)
savefont <- par(font=3) #change to italics font
#note that the for loop is looping over the strings in the vector instead of integers, in each loop "position" is set equal to the next string
for (position in c("bottomright", "bottom", "bottomleft", "left", "topleft", "top", "topright", "right","center")) {
   legend(x=position,legend=c("Gadus morhua","Sardinops sagax", "Raja rhina", "Solea vulgaris"), bty="n",
         fill=c("red","orange","green","blue"), border=c("red","orange","green","blue"))   #box filled and outlined with same color
}
par(font=savefont)  #restore default font


########Legends: lines
xx <- read.csv(file="Worm2009Fig3.csv", stringsAsFactors=T)
plot(x=xx$BBmsy, y=xx$FFmsy, xlim=c(0,2), ylim=c(0,2), type="n",xaxs="i", yaxs="i", ann=F,las=1)
savefont <- par(font=3) #change to italics font
legend(x="topleft",legend=c("Gadus morhua","Sardinops sagax", "Raja rhina", "Solea vulgaris"), bty="n",cex=1.4,
         lty=1,lwd=5,col=c("red","orange","green","blue"))   #box filled and outlined with same color

#Legends: points
legend(x="topright",legend=c("Gadus morhua","Sardinops sagax", "Raja rhina", "Solea vulgaris"), bty="n",cex=1.4,
         pch=16, pt.cex=2,col=c("red","orange","green","blue"))   #box filled and outlined with same color

#Legends: boxes
legend(x="bottomleft",legend=c("Gadus morhua","Sardinops sagax", "Raja rhina", "Solea vulgaris"), bty="n",cex=1.4,
         fill=c("red","orange","green","blue"), border=c("red","orange","green","blue"))   #box filled and outlined with same color

#Legends: boxes v2
legend(x="bottomright",legend=c("Gadus morhua","Sardinops sagax", "Raja rhina", "Solea vulgaris"), bty="n",cex=1.4,
         pch=15, pt.cex=3, col=c("red","orange","green","blue"), border=c("red","orange","green","blue"))   #box filled and outlined with same color

par(font=savefont)  #restore default font





