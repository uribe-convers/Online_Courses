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

## Part 3
## Reuse count_complete
corr <- function(directory, threshold){
    ## Read them all in at the same time
    file_list <- dir(directory)
    dat_all <- lapply(file_list, function(x)
                      read.csv(paste(directory, x, sep="/")))
    comp <- sapply(dat_all, count_complete)

    ## above threshold
    above_cut <- which(comp > threshold)

    ## Do correlations across only the elements above the threshold
    ## Check if any are greater than threshold
    if (length(above_cut) != 0){
       res <- dat_all[above_cut]
       out <- sapply(res, function(x)
                     cor(x$nitrate, x$sulfate, use="complete.obs"))
        return(out)
    } else {
        return(vector())
    }
}
