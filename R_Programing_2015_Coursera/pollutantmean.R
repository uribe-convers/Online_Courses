pollutantmean <- function(directory, pollutant, id = 1:332) {
        setwd(directory) #sets directory using info from directory in the function
        files<-list.files(, full.names = T) #gets all the files in the directory
        files_subset<-files[id] #subsets the files using the info from id in the function
        dat<-data.frame() #creates an empty dataframe
        for (i in 1:length(files_subset)) {
                dat <- rbind(dat, read.csv(files_subset[i]))
        } #using a for loop, reads the subseted csv files and appends them in the empty dataframe
        data_polluntant<-dat[,pollutant] #subsets the data using the pollutant info from the function
        mean(data_polluntant, na.rm = T) #calculates the mean removing the missing infomation
}        

        
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!