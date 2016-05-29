## Put comments here that give an overall description of what your
## functions do: 
## These two functions compute the inverse of a square 
## invertible matrix while storing it in cache, and while using function solve()
## to calculate the inverse.
## The first function creates a special matrix object that can cache its inverse.
## The second function, after checking the cache, either returns the
## inverse from the cache, or, if the original matrix has changed (and cache became NULL)
## calculates and returns the inverse of the new matrix.

## Write a short comment describing this function
## makeCacheMatrix function creates a special matrix object that can cache its inverse. 
## It creates a list of functions (set, get, setsolve, getsolve)used by function cacheSolve 
## to get or set the inverted matrix in cache.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
        setsolve = setsolve,
        getsolve = getsolve)
}


## Write a short comment describing this function
## cacheSolve function retrieves the inverse from cache, 
## if it is there, and if not, calculates the inverse.

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m

        ## Return a matrix that is the inverse of 'x'
}
x <- makeMatrixCache()
x$set(matrix(1:4,2,2))
cacheSolve(x)

