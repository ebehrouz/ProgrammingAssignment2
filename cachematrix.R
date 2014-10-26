## This function makes an R object that initializes a variable ##'m', which will be used to save inverse matrix. It Provides ##function get() to obtain "raw" matrix 

makeCacheMatrix <- function(x=matrix()) {
    m <- NULL
    get <- function() x
    setImatrix <- function(Imatrix) m <<- Imatrix
    getImatrix <- function() m

    # This function returns the list of functions as an R object.
    list(get=get, setImatrix=setImatrix, getImatrix=getImatrix)
}
cacheSolve <- function(x) {
    m <- x$getImatrix()
    if(!is.null(m)){
        message("Results")
        return(m)
    }
    else {
        message("Inverse matrix")
        data <- x$get() 
        m <- solve(data) 
        x$setImatrix(m) # assigns inverse matrix to object x
        message("Done.")
        return(m)
    }
}

