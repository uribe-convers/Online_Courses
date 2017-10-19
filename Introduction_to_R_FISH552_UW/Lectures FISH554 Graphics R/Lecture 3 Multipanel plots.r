##################################################################
###Lecture 4: multipanel plots
#Trevor A. Branch, tbranch@uw.edu
#Lecture notes for FISH507H, Beautiful Graphics in R
#School of Aquatic and Fishery Sciences, University of Washington
##################################################################

####Example: Food and Agriculture Organization of the United Nations landings (catch) data
#plotting total catch by FAO large area
x <- read.csv("FAOTotalCatch.csv")                      #default reading in of data
x[1,]                                                   #check first row (gives headers too)
x$FAO.names      #check to see if names are strings, there are not they are factors!!!
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
  if (i%%4==1) {
    axis(2, las=1, col="gray80")
  }
  if (i > nareas-4){
    axis(1, las=1, at=seq(1950,2010,20), col="gray80")  #reduce the number of axis labels
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

#make space for area labels, and send to pdf file
#pdf("catches.pdf", width=8,height=6)  #uncomment this to send to pdf file, remember to use dev.off() at end
par(mfrow=c(5,4), oma=c(5,3,1,1), mar=c(0,3,0,0))
for (i in 1:nareas) {
  maxC <- max(x[i,-c(1,2)]/1e+06)
  ylim <- c(0,1.3*maxC)
  plot(x=years, y=x[i,-c(1,2)]/1e+06, type="l", axes=F,ann=F, xaxs="i",yaxs="i", ylim=ylim)                        #no axes or annotations
  box(col="gray80")               #puts a faint gray box around each individual plot
  Clab <- pretty(c(0,maxC*0.8))   #returns nice axes labels within two limits
  axis(2, las=1, col="gray80", at=c(0,Clab[length(Clab)]))  #just plot first and last axis labels
  if (i > nareas-4){
    axis(1, las=1, at=seq(1950,2010,20), col="gray80")  #reduce the number of axis labels
  }
  mtext(side=3,line=-1,text=x[i,2],cex=0.5)
}
mtext(side=1,outer=T,line=3,"Year")                 #label on the outside of all plots
mtext(side=2,outer=T,line=1,"Catch (million mt)")   #label on the outside of all plots
#dev.off()  #uncomment this if you want to create the pdf, this closes the pdf device

#further refinements to the graph could include:
#1. changing text size of panel labels, text on two lines using \n
#2. for publication, manually entering a list of y-axis values so that they make sense
#3. combining catches for all Antarctic areas
#4. ordering panels from largest to smallest average catch