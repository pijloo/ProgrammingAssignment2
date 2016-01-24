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

##cacheSolve
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix.R before.
## If the inverse has already been calculated( and the matrix has not changed), 
## then the cachesolve should retrive the inverse from cache.
cacheSolve <- function(x, ...) {
m <- x$getinv()
if(!is.null(m)) {
message("getting cached data")
return(m)
}
data <- x$get()
m <- solve(data) %*% data
x$setinv(m)
m
}
