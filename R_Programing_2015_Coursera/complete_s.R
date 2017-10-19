complete <- function(directory, id) {
        library(plyr)
        setwd(directory) #sets directory using info from directory in the function
        files<-list.files(, full.names = T) #gets all the files in the directory
        files_subset<-files[id] #subsets the files using the info from id in the function
        dat<-data.frame() #creates an empty dataframe
        for (i in 1:length(files_subset)) {
                dat <- rbind(dat, read.csv(files_subset[i]))
                files_subset_complete<-dat[complete.cases(dat),]
                } #using a for loop, reads the subseted csv files and appends them in the empty dataframe
        
        xx<-count(files_subset_complete,"ID")
        colnames(xx) <- c("id", "nobs")
        xx
       
        ##Tried this to invert the order of the data frame, but of course it doesn't work if the files called are in increasing order!
        #z<-xx[order(xx,decreasing = T),]
        #zz<-na.omit(z)
        #zz
        }
               
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
