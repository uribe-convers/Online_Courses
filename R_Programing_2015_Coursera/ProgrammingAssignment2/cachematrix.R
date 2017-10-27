##
## Written by Simon Uribe-Convers
## May 21st 2015

# This script will create a special list which is a matrix. It will also cache 
# the inverse of that matrix to use later in the script.

# makeCacheMatrix is a function that stores (cache) the inverse of a matrix
# it will do the followong things
:
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

## Here is an example of how to use it:
        
## source('cachematrix.R')
## m <- makeCacheMatrix(matrix(c(5, 1, 1, 2), c(2, 2)))
## cacheSolve(m)


makeCacheMatrix <- function(x = matrix()) {
        f <- NULL       #Create the special matrix
        set <- function(y) {
                x <<- y #Assigns value of y from the function to the value of x specified when executing the function.
                f <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) f <<- inverse #set inverse value in the cache
        getinverse <- function() f
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


# The following function returns the inverse of the matrix. 
# It first checks if the inverse value of the matrix has been computed and cached
# and, if so, it ignores the computation. If there is no value stored for the inverse of the matrix,
# it computes it. and sets the value in the cache with the 'makeCacheMatrix' function.

# WARNING: The matrix is assumed to always be invertible.

cacheSolve <- function(x, ...) {
        f <- x$getinverse()
        if(!is.null(f)) {                          #Check if there is a cached value already stored
                message("recovering cached value") #If there is a value give a message that it's been retrieved
                return(f)                          #returns the cached value
        }
        data <- x$get()
        f <- solve(data)                           #compute the inverse of the matrix
        x$setinverse(f)
        f               
}
