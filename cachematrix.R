makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    
    set <- function(y) {
        x <<- y
        inv <<- NULL   # reset cached inverse when matrix changes
    }
    
    get <- function() x
    
    setInverse <- function(inverse) inv <<- inverse
    
    getInverse <- function() inv
    
    list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

cacheSolve <- function(x, ...) {
    inv <- x$getInverse()
    
    # Return cached inverse if it exists
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    
    # Otherwise compute the inverse
    mat <- x$get()
    inv <- solve(mat, ...)
    x$setInverse(inv)
    inv
}
