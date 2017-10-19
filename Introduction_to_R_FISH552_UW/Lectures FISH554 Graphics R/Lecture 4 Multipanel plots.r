##################################################################
###Lecture 5: multipanel plots
#Trevor A. Branch, tbranch@uw.edu
#Lecture notes for FISH507H, Beautiful Graphics in R
#School of Aquatic and Fishery Sciences, University of Washington
##################################################################

####Example: Food and Agriculture Organization of the United Nations landings (catch) data
#plotting total catch by FAO large area
x <- read.csv("FAOTotalCatch.csv")                      #default reading in of data
x[1,]                                                   #check first row (gives headers too)
x$FAO.names                                             #check to see if names are strings (!!)
x <- read.csv("FAOTotalCatch.csv", stringsAsFactors=F)  #read in again forcing to be strings
x$FAO.names
areas <- x$FAO.names    #unique = remove duplicates, sort = by alphabetical order
nareas <- length(areas)               #how many areas in file? 
years <- 1950:2007                    #can be extracted automatically from header using: substr(colnames(x),2,5)[-c(1,2)]
nyears <- length(years)               #how many years

#default multipanel plot
par(mfcol=c(5,4))
for (i in 1:nareas) {
  plot(x=years, y=x[i,-c(1,2)], type="l")        #remove the first two columns which contain data
}

#rescale so that there are no inner margins, only outer margins
par(mfcol=c(5,4), oma=c(5,5,1,1), mar=c(0,0,0,0))
for (i in 1:nareas) {
  plot(x=years, y=x[i,-c(1,2)], type="l")        #remove the first two columns which contain data
}

#now remove all axes and plot a box around each plot
par(mfcol=c(5,4), oma=c(5,5,1,1), mar=c(0,0,0,0))
for (i in 1:nareas) {
  plot(x=years, y=x[i,-c(1,2)], type="l", axes=F,ann=F) #no axes or annotations
  box(col="gray80")  #puts a faint gray box around each individual plot
}

#remove space between 0 values and axes, add in axes
par(mfrow=c(5,4), oma=c(5,5,1,1), mar=c(0,0,0,0))
for (i in 1:nareas) {
  plot(x=years, y=x[i,-c(1,2)], type="l", axes=F,ann=F, xaxs="i",yaxs="i") #no axes or annotations
  box(col="gray80")  #puts a faint gray box around each individual plot
  if (i%%4==1) {     #the %% is the "mod" function returning the remainder after dividing i by 4. 
    axis(2, las=1, col="gray80")
  }
  if (i > nareas-4){ #add x-axes for last four subplots
    axis(1, las=1, at=seq(1950,2010,20), col="gray50")  #reduce the number of axis labels
  }
}

#wait, we need a separate y-axis for all panels
par(mfrow=c(5,4), oma=c(5,3,1,1), mar=c(0,4,0,0))
for (i in 1:nareas) {
  plot(x=years, y=x[i,-c(1,2)]/1e+06, type="l", axes=F,ann=F, xaxs="i",yaxs="i") #no axes or annotations
  box(col="gray80")  #puts a faint gray box around each individual plot
  axis(2, las=1, col="gray80")
  if (i > nareas-4){
    axis(1, las=1, at=seq(1950,2010,20), col="gray80")  #reduce the number of axis labels
  }
}

#make space for area labels
#pdf("figs\\catches.pdf", width=8,height=6)
par(mfrow=c(5,4), oma=c(5,3,1,1), mar=c(0,3,0,0))
for (i in 1:nareas) {
  maxC <- max(x[i,-c(1,2)]/1e+06)
  ylim <- c(0,1.3*maxC)
  plot(x=years, y=x[i,-c(1,2)]/1e+06, type="l", axes=F,ann=F, xaxs="i",yaxs="i", ylim=ylim)                           #no axes or annotations
  box(col="gray80")               #puts a faint gray box around each individual plot
  Clab <- pretty(c(0,maxC*0.8))   #returns nice axes labels
  axis(2, las=1, col="gray80", at=c(0,Clab[length(Clab)]))
  if (i > nareas-4){
    axis(1, las=1, at=seq(1950,2010,20), col="gray50")  #reduce the number of axis labels
  }
  mtext(side=3,line=-1,text=x[i,2],cex=0.5)
}
mtext(side=1,outer=T,line=3,"Year")                 #label on the outside of all plots
mtext(side=2,outer=T,line=1,"Catch (million mt)")   #label on the outside of all plots
#dev.off()

#further refinements to the graph could include:
#1. changing text size of panel labels, text on two lines using \n
#2. for publication, manually entering a list of y-axis values so that they make sense
#3. combining catches for all Antarctic areas
#4. ordering panels from largest to smallest average catch

########creating different kinds of matrices
xx <- matrix(c(1,2,3,4),nrow=4,ncol=1)
xx
xx <- matrix(1:12,nrow=4,ncol=3)
xx
xx <- matrix(1:12,nrow=4,ncol=3, byrow=T)
xx

########using layout to create figures with different heights
reven <- read.csv(file="CalCurrRevenue.csv",header=T)
maxC <- apply(reven[,-1], MARGIN=2,max)                 #find the maximum value in each column (except column 1)
groups.to.plot <- c(1,5,7,9)                            #select some fisheries groups to plot
mat <- matrix(c(1,2,3,4),nrow=4,ncol=1)                 #create a matrix with four rows and one column, plot in order 1,2,3,4
mat
par(mar=c(0,0,0,0), oma=c(5,5,1,1))
layout(mat=mat,widths=c(1),heights=30+maxC[groups.to.plot]/1e06)
for (i in groups.to.plot) {
  ylim <- c(0,30+max(reven[,i+1])/1e06)
  plot(x=1,y=1,type="n", xlim=c(1950,2006), ylim=ylim, xaxs="i",yaxs="i", ann=F,axes=F)
  polygon(x=c(reven[,1], rev(reven[,1])), y=c(reven[,1+i]/1e+06,rep(0,nrow(reven))), col="gray50")
  box()
  axis(2,las=1,at=seq(0,300,30))
  if (i==groups.to.plot[length(groups.to.plot)]) {
    axis(1)
  }
  mtext(line=-1.5,side=3,outer=F,colnames(reven[1+i]))
}
mtext(side=2,text="Revenue (US$ million)", outer=T,line=3)
mtext(side=1,text="Year", outer=T,line=3)


########using layout to create figures with different widths and heights
########plot 1950-1980 and then 1990-2006 (omitting the 1980-1990 data altogether!)
reven <- read.csv(file="CalCurrRevenue.csv",header=T)
maxC <- apply(reven[,-1], MARGIN=2,max)                 #find the maximum value in each column (except column 1)
groups.to.plot <- c(1,5,7,9)                            #select some fisheries groups to plot
mat <- matrix(1:8,nrow=4,ncol=2, byrow=T)               #create a matrix with four rows and TWO columns, plot in order 1,2,3,...
mat
par(mar=c(0,2.5,0,0), oma=c(5,2.5,4,1))
layout(mat=mat,widths=c(30,16),heights=30+maxC[groups.to.plot]/1e06)   #add 30 to leave a constant space for titles in each plot
                                                                       #note the widths are the number of years (1950-1980, 1990-2006)
for (i in groups.to.plot) {
  ylim <- c(0,30+max(reven[,i+1])/1e06)                                #set up the ylimits for each plot
  
  ###first plot data from 1950 to 1980
  plot(x=1,y=1,type="n", xlim=c(1950,1980), ylim=ylim, xaxs="i",yaxs="i", ann=F,axes=F)
  polygon(x=c(reven[,1], rev(reven[,1])), y=c(reven[,1+i]/1e+06,rep(0,nrow(reven))), col="gray50")
  box()
  if (i==groups.to.plot[length(groups.to.plot)]) {
    axis(1)
  }  
  axis(2,las=1,at=seq(0,300,30))
  mtext(line=-1.5,side=3,outer=F,colnames(reven[1+i]))   #text for each panel
  if (i==groups.to.plot[1]) {
     mtext(line=1,side=3,"Early period", cex=1.3)        #header for the whole column 
  }
  ###then plot data 1990 to 2006
  plot(x=1,y=1,type="n", xlim=c(1990,2006), ylim=ylim, xaxs="i",yaxs="i", ann=F,axes=F)
  polygon(x=c(reven[,1], rev(reven[,1])), y=c(reven[,1+i]/1e+06,rep(0,nrow(reven))), col="gray50")
  box()
  if (i==groups.to.plot[length(groups.to.plot)]) {
    axis(1)
  }
  if (i==groups.to.plot[1]) {
     mtext(line=1,side=3,"Late period", cex=1.3) 
  }

  mtext(line=-1.5,side=3,outer=F,colnames(reven[1+i]))
}
mtext(side=2,text="Revenue (US$ million)", outer=T,line=1)
mtext(side=1,text="Year", outer=T,line=3)

#####Using layout to create more complex figures by combining plot spaces
par(oma=c(1,1,1,1))
mat <- matrix(c(1,1,1,2,3,4),nrow=2,ncol=3,byrow=T)  #one plot in top row
mat
layout(mat=mat)
layout.show(n=4)

#hint: write matrix out in the format of a matrix (one row per row, columns aligned)
mat <- matrix(c(1,1,2,0,6,
                3,4,4,0,5),nrow=2,ncol=5,byrow=T)   #a 0 to denote a gap in the plotting, note out of order plots
mat
layout(mat=mat)
layout.show(n=6)

#change the widths of the columns
mat <- matrix(c(1,1,2,0,6,
                3,4,4,0,5),nrow=2,ncol=5,byrow=T)   #a 0 to denote a gap in the plotting, note out of order plots
layout(mat=mat, widths=c(1,1,1,0.2,1))            #make the 0 column (blank column) narrow
layout.show(n=6)

######Using "fig" to specify plots of arbitrary size
#This sets the **figure border** i.e. thus plots and axes / labels will be inside this region
reven <- read.csv(file="CalCurrRevenue.csv",header=T)
maxC <- apply(reven[,-1], MARGIN=2,max)                     #find the maximum value in each column (except column 1)
par(mfrow=c(1,1), oma=c(0,0,0,0), mar=c(1,1,1,1))
i <- 1
par(fig=c(0.4,0.7,0.1,0.7),mar=c(0,0,0,0))
plot(x=1,y=1,type="n", xlim=c(1950,2006), ylim=c(0,maxC[i])/1e+06, xaxs="i",yaxs="i", ann=F,axes=F)
polygon(x=c(reven[,1], rev(reven[,1])), y=c(reven[,1+i]/1e+06,rep(0,nrow(reven))), col="gray50")
box()
par(new=T)

i <- 2
par(fig=c(0.1,0.3,0.05,0.65),mar=c(0,0,0,0))
plot(x=1,y=1,type="n", xlim=c(1950,2006), ylim=c(0,maxC[i])/1e+06, xaxs="i",yaxs="i", ann=F,axes=F)
polygon(x=c(reven[,1], rev(reven[,1])), y=c(reven[,1+i]/1e+06,rep(0,nrow(reven))), col="gray50")
box()
par(new=T)

i <- 3
par(fig=c(0.2,0.8,0.75,0.9),mar=c(1,1,1,1))
plot(x=1,y=1,type="n", xlim=c(1950,2006), ylim=c(0,maxC[i])/1e+06, xaxs="i",yaxs="i", ann=F,axes=F)
polygon(x=c(reven[,1], rev(reven[,1])), y=c(reven[,1+i]/1e+06,rep(0,nrow(reven))), col="gray50")
axis(1)
axis(2)
box(which="plot", col="gray50")
box(which="figure", col="red")

######Using "plt" to specify plots of arbitrary size
#This sets the **plot border**, i.e. axes and labels will be outside this region
reven <- read.csv(file="CalCurrRevenue.csv",header=T)
maxC <- apply(reven[,-1], MARGIN=2,max)                     #find the maximum value in each column (except column 1)
par(mfrow=c(1,1), oma=c(0,0,0,0), mar=c(1,1,1,1))
i <- 1
par(plt=c(0.4,0.7,0.15,0.7))
plot(x=1,y=1,type="n", xlim=c(1950,2006), ylim=c(0,maxC[i])/1e+06, xaxs="i",yaxs="i", ann=F,axes=F)
polygon(x=c(reven[,1], rev(reven[,1])), y=c(reven[,1+i]/1e+06,rep(0,nrow(reven))), col="gray50")
box()
axis(1)
axis(2)
par(new=T)

i <- 2
par(plt=c(0.1,0.3,0.1,0.65))
plot(x=1,y=1,type="n", xlim=c(1950,2006), ylim=c(0,maxC[i])/1e+06, xaxs="i",yaxs="i", ann=F,axes=F)
polygon(x=c(reven[,1], rev(reven[,1])), y=c(reven[,1+i]/1e+06,rep(0,nrow(reven))), col="gray50")
box()
axis(1)
axis(2)
par(new=T)

i <- 3
par(plt=c(0.2,0.95,0.8,0.95))
plot(x=1,y=1,type="n", xlim=c(1950,2006), ylim=c(0,maxC[i])/1e+06, xaxs="i",yaxs="i", ann=F,axes=F)
polygon(x=c(reven[,1], rev(reven[,1])), y=c(reven[,1+i]/1e+06,rep(0,nrow(reven))), col="gray50")
axis(1)
axis(2)
box(which="plot", col="gray50")
box(which="figure", col="red")

#######using split.screen to specify multiple figures
mat <- matrix(c(0.0,0.1,0.9,1,
                0.0,0.3,0.7,1,
                0.1,0.6,0.4,1,
                0.3,1.0,0.0,0.5), nrow=4,ncol=4,byrow=T)  #each row = left, right, bottom, top of a screen
par(mar=c(0,0,0,0), oma=c(1,1,1,1))
split.screen(figs=mat)  #figs can also be two-element vector working the same way as mfrow / mfcol
for (i in 1:4) {
  print(i)
  screen(n=i, new=F)    #choose a screen to plot in (a row in the mat argument)
                        #new=F does NOT clear screen when it overlaps with another screen
  hist(rnorm(i^3 * 50), ann=F,col="gray50", breaks=seq(-5,5,0.5), axes=F)
}
close.screen(all.screens=T)  #clear screens


