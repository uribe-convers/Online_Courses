####################################
#Lecture 8, Trevor Branch, FISH 507H
#Fall 2011
#Complex data using grep, readList
####################################

######Single file with lots of rows (2000) and columns (257)
x <- read.table(file="projections.s4", skip=2, header=T)
x[1,]
nrow(x)
ncol(x)
x[1:10,20:21]
plot(x[,20])
colnames(x)
grep("Rec.", colnames(x))
Y <- grep("Rec.", colnames(x))
rec.data <- x[,Y]
rec.quants <- apply(rec.data,MARGIN=2,quantile, c(0.05,0.5,0.95))
rec.quants
plot(x=1931:2042, y=rec.quants[2,], type="l", lty=1,lwd=1.5,col="black", ylim=c(0,1.7e07), yaxs="i", ylab="Recruitment", xlab="Year")
lines(x=1931:2042, y=rec.quants[3,], type="l", lty=2,lwd=1.5,col="black", ylim=c(0,1.7e07), yaxs="i")
lines(x=1931:2042, y=rec.quants[1,], type="l", lty=2,lwd=1.5,col="black", ylim=c(0,1.7e07), yaxs="i")


######Plotting data from Stock Synthesis: complex data file, manual extraction of data
source("SSplotPars.R")
SSplotPars(dir=".", repfile="Report.sso",
    postfile="posteriors.sso", showpost=TRUE, showprior=TRUE,
    showmle=TRUE, showinit=TRUE, showrecdev=TRUE, priorinit=TRUE,
    priorfinal=TRUE, showlegend=TRUE, fitrange=FALSE, xaxs="i",
    xlim=NULL, ylim=NULL, verbose=TRUE, nrows=3, ncols=3,
    new=TRUE, pdf=FALSE, pwidth=7, pheight=7, punits="in",
    ptsize=12, returntable=FALSE, strings=c(), exact=FALSE,
    newheaders=NULL, burn=0, thin=1,
    ctlfile="control.ss_new")


########Using PBSmodelling readList and writeList commands
require(PBSmodelling)
x <- readList(fname="output1.rep")
plot(x$yrs.cpue[1]:x$yrs.cpue[2], x$cpue, pch=16, cex=1.3, ylim=c(0,2.5), ann=F, col="black", yaxs="i")
par(new=T)
plot(x$yrs.cpue[1]:x$yrs.cpue[2], x$cpue.pred, type="l", ylim=c(0,2.5), col="black", lwd=2, xlab="Year", ylab="CPUE", yaxs="i")

######writing a list to a nice looking file
writeList(fname="writeList.dat", x=x, format="P")  #nice looking format, easy to read, but ad hoc

#######Exercise 4
#require(PBSmodelling)
#require(gplots)
x <- readList(fname="output1.rep")
source("Ex2 IndoAgeFits.r")
IndoAgeFits(data.object=x, case_label="class example")
