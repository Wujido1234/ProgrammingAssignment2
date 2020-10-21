# Script defines three functions

## makeSymGrid() - defines symmetric, invertible matrix from numeric input from stdin
# M <- makeSymGrid(8);M

### makeCacheMatrix() - receives matrix as input, computes the inversion and caches result
# M1 <- makeCacheMatrix(M)

#### cacheSolve() - grab inversion from cache or compute with solve() if null
# cacheSolve(M1)

  makeSymGrid <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }

  makeCacheMatrix <- function(x = matrix()) {

    # placeholder for 'i'
    i <- NULL
      set <- function(y) {
        x <<- y
      i <<- NULL
  }
    get <- function() x
    setinvert <- function(inverse) i <<- inverse
    getinvert <- function() i
    list(set = set,
         get = get,
         setinvert = setinvert,
         getinvert = getinvert)
}

  # function grabs cached inversion if present, otherwise compute for solve()
  cacheSolve <- function(x, ...) {
    i <- x$getinvert()
    if (!is.null(i)) {
      message("getting cached data")
      return(i)
  }
    data <- x$get()
    i <- solve(data, ...)
    x$setinvert(i)
    i
}
