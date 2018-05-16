best <- function (state, outcome) {
  data <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE)
  states <- data[, 7]
  
  if(!(state %in% states)) stop("invalid state")
  index <- switch (outcome,
    "heart attack" = 11,
    "heart failure" = 17,
    "pneumonia" = 23,
    stop("invalid outcome")
  )
  
  data <- data[states == state,]
  data <- data[,c(2,index)]
  data <- data[data[,2] != "Not Available",]
  
  hospital <- data [which.min(data[,2]),1]
  hospital
}