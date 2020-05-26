## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  IM<- NULL
  set<- function(y){
    x <<- y
    IM <<- NULL
  }
  get<- function()x
  setIM <- function(im) IM<<- im
  getIM <- function() IM
  list(set =set ,get =get ,setIM =setIM ,getIM=getIM)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  im <- x$getIM()
  if(!is.null(im)){
    message("getting cached data")
    return (im)
  }
  im <- solve(x$get())
  x$setIM(im)
  im
}

#input ex
m<-matrix(c(1,2,3,7) ,2 ,2)
res<-makeCacheMatrix(m)
cacheSolve(res)
m<-matrix(c(1,2,3,4) ,2 ,2)
res$set(m)
cacheSolve(res)

