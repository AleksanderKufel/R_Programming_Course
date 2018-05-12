## This functions helps create a matrix that can cache its inverse
## so the inverse can be computed once and loaded from memory when needed

## This function creates a matrix wich can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list (get = get, set = set, setinverse = setinverse, getinverse = getinverse)
}


## This function returns inverse of a matrix from cached data or computes and caches it

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(x, ...)
  x$setinverse(inv)
  inv
}


