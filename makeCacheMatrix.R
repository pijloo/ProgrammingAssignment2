##makeCacheMatrix
## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set <- function(y) {
x <<- y
m <<- NULL
}
get <- function() x
setinv <- function(cacheSolve) m <<- cacheSolve
getinv <- function() m
list(set = set, get = get,
setinv = setinv,
getinv = getinv)
}
