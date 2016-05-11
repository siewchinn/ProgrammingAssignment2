## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    ## @x: a square invertible matrix
    ## return: a list containing functions to
    ##              1. set the matrix
    ##              2. get the matrix
    ##              3. set the inverse
    ##              4. get the inverse
    ##         this list is used as the input to cacheSolve()
    
    mat <- NULL
    set <- function(y) {
        # use `<<-` to assign a value to an object in an environment
        # different from the current environment.
        x <<- y
        mat <<- NULL
    }
    get <- function() x
    setInv <- function(inv) mat <<- inv
    getInv <- function() mat
    list(set = set, get = get,
    setInv = setInv,
    getInv = getInv)
}


## Write a short comment describing this function

mat <- x$getInv()
## @x: output of makeCacheMatrix()
## return: inverse of the original matrix input to makeCacheMatrix()
#if the inverse has already been calculated
if(!is.null(mat)) {
    #get it from the cache and skips the computation
    message("getting cached data")
    return(mat)
}
#otherwise, calculate the inverse
data <- x$get()
mat <- solve(data,...)
#set out the value of the inverse in the cache via the setInv function
x$setInv(mat)
return(mat)
}
