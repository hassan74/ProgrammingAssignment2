## This code to create matix and inverse the matrix one time .

## this function create cache matrix contating function to set inverse matrix to it and to get it

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


## This function check if inverse matrix is not null then get cached  inverse matrix but if it is null inverse it using solve fun

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

