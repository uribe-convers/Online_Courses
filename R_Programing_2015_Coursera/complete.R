## Part 2
complete <- function(directory, id){
        ## Read them all in at the same time
        file_list <- dir(directory)
        dat_all <- lapply(file_list[id], function(x)
                read.csv(paste(directory, x, sep="/")))
        comp <- sapply(dat_all, count_complete)
        data.frame(id=id, nobs=comp)
}

count_complete <- function(df)
        nrow(na.omit(df))
