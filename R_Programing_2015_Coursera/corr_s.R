
corr <- function(directory, threshold=0) {
        #source("complete.R")
        setwd(directory) #sets directory using info from directory in the function
        files<-list.files(, full.names = T) #gets all the files in the directory
        files_subset<-files#[id] #subsets the files using the info from id in the function
        dat<-data.frame() #creates an empty dataframe
        for (i in 1:length(files_subset)) {
                dat <- rbind(dat, read.csv(files_subset[i]))
                files_subset_complete<-dat[complete.cases(dat),]
        } #using a for loop, reads the subseted csv files and appends them in the empty dataframe
 
        xx<-count(files_subset_complete,"ID")
        colnames(xx) <- c("id", "nobs")
        xx

        #for(i in 1:length(files_subset_complete)){
                                
       # }
        if( xx$nobs >= threshold){
                cr<-cor(files_subset_complete$sulfate, files_subset_complete$nitrate)
                summary(cr)        
                
        }



        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
}
