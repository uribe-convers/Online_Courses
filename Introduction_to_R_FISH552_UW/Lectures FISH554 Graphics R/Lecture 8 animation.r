############################################################
#R code for FISH507H, School of Aquatic and Fishery Sciences
#University of Washington, USA
#Instructor: Trevor A. Branch, tbranch@uw.edu
#
############################################################


###animation package######################################
#Some options require installation of ImageMagick, www.imagemagick.org/script/index.php, followed by machine restart
require(animation)
#setwd("Path/To/Your/Working/Directory")
oopts = ani.options(interval = 0.1, ani.dev="png", outdir = getwd(), width=800, height=800)   #interval is wait in seconds between frames in video
n = 20
x = sort(rnorm(n))
y = rnorm(n)             #set up an empty frame, then add points one by one
par(bg = "white")        #ensure the background color is white
plot(x, y, type = "n")
ani.record(reset = TRUE) #clear history before recording
for (i in 1:n) {
  points(x[i], y[i], pch = 19, cex = 2)
  ani.record()           #record the current frame
}
ani.replay()    #replay movie within R
ani.options(interval=0.3)
#ani.replay()    #replay movie within R
saveGIF(ani.replay(), img.name = "plot_im", movie.name="Figs\\plot_im.gif", convert="convert")    #ImageMagick
#saveGIF(ani.replay(), img.name = "plot_gm", movie.name="Figs\\plot_gm.gif", convert="gm convert") #GraphicsMagick
saveHTML(ani.replay(), img.name = "plot_html", htmlfile="Figs\\plot_html.html") #to HTML
######################################################


###central limit theorem: pick 3######################################
#Some options require installation of ImageMagick, www.imagemagick.org/script/index.php, followed by machine restart
require(animation)
oopts = ani.options(interval = 0.01, ani.dev="png", outdir = getwd(), width=1200, height=1200)   #interval is wait in seconds between frames in video

par(bg = "white")        #ensure the background color is white
ani.record(reset = TRUE) #clear history before recording
n = 4000
x <- vector(length=n)
x[] <- NA
for (i in 1:n) {
  x[i] <- mean(runif(min=0,max=100,n=3))
  if (i%%20==0) {
    hist(x[!is.na(x)], xlim=c(0,100),ylim=c(0,100), breaks=seq(0,100,0.5), ann=F, axes=F)
    axis(side=1,las=1,pos=0)
    axis(side=2,las=1,pos=0)
    ani.record()           #record the current frame
  }
}
saveGIF(ani.replay(), img.name = "normal3", movie.name="Figs\\normal3.gif", convert="convert")    #ImageMagick


###central limit theorem pick 10######################################
#Some options require installation of ImageMagick, www.imagemagick.org/script/index.php, followed by machine restart
require(animation)
oopts = ani.options(interval = 0.01, ani.dev="png", outdir = getwd(), width=1200, height=1200)   #interval is wait in seconds between frames in video

par(bg = "white")        #ensure the background color is white
ani.record(reset = TRUE) #clear history before recording
n = 4000
x <- vector(length=n)
x[] <- NA
for (i in 1:n) {
  x[i] <- mean(runif(min=0,max=100,n=10))
  if (i%%20==0) {
    hist(x[!is.na(x)], xlim=c(0,100),ylim=c(0,100), breaks=seq(0,100,0.5), ann=F, axes=F)
    axis(side=1,las=1,pos=0)
    axis(side=2,las=1,pos=0)
    ani.record()           #record the current frame
  }
}
saveGIF(ani.replay(), img.name = "normal10", movie.name="Figs\\normal10.gif", convert="convert")    #ImageMagick


#######GapMinder software###########################################  
#World tuna and billfish stocks 1950-2009
#all B/Bmsy and F/Fmsy > 3 are truncated to 3
#data are jittered by adding a random number for the purposes of the 
#class (since this is an unpublished compilation).
###################################################################
require(googleVis)
YY=read.csv("TunasJittered.csv",header=T) #Loads in the vector of B/Bmsy and additional data
colnames(YY)=c('ID','Year','B/Bmsy','F/Fmsy','Catch','MSY','CommonName','ScientificName','RFMO','Ocean') #Assign column names to data frame
m=gvisMotionChart(YY,idvar='ID',timevar='Year',options=list(height=900,width=925)) #this makes the motion chart
plot(m) #makes motion chart in web browser


######Animation of Mandelbrot set using caTools and write.gif
require(caTools)
jet.colors = colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan", "#7FFF7F",
                                "yellow", "#FF7F00", "red", "#7F0000")) # define "jet" palette
m = 400
C = complex( real=rep(seq(-1.8,0.6, length.out=m), each=m ), 
             imag=rep(seq(-1.2,1.2, length.out=m),      m ) )
C = matrix(C,m,m)
Z = 0
X = array(0, c(m,m,20))
for (k in 1:20) {
   Z = Z^2+C
   X[,,k] = exp(-abs(Z))
}
#image(X[,,k], col=jet.colors(256))
image(X[,,k], col=jet.colors(256))
write.gif(X, "Figs\\Mandelbrot.gif", col=jet.colors(256), delay=100)
