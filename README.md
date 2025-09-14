# Programming Assignment 2: Lexical Scoping

This repository contains my solution for **Programming Assignment 2** of the R Programming course on Coursera.

The goal of this assignment is to demonstrate how lexical scoping rules in R can be used to cache potentially time-consuming computations. Specifically, we implement a pair of functions that cache the inverse of a matrix.

---

## Files

- `cachematrix.R` : Contains the implementation of the functions `makeCacheMatrix` and `cacheSolve`.

---

## Functions

### makeCacheMatrix(x = matrix())
Creates a special "matrix" object that can cache its inverse.  
It returns a list of functions to:
- `set(y)` : set the value of the matrix
- `get()` : get the value of the matrix
- `setInverse(inverse)` : cache the inverse of the matrix
- `getInverse()` : get the cached inverse

### cacheSolve(x, ...)
Computes the inverse of the special "matrix" returned by `makeCacheMatrix`.  
If the inverse has already been calculated (and the matrix has not changed), then `cacheSolve` retrieves the inverse from the cache.

---

## Example Usage

```r
# Create a square invertible matrix
m <- matrix(c(2, 0, 0, 2), 2, 2)

# Create the special matrix object
cm <- makeCacheMatrix(m)

# First call computes the inverse
cacheSolve(cm)
#      [,1] [,2]
# [1,]  0.5  0.0
# [2,]  0.0  0.5

# Second call retrieves cached inverse
cacheSolve(cm)
# getting cached data
#      [,1] [,2]
# [1,]  0.5  0.0
# [2,]  0.0  0.5
