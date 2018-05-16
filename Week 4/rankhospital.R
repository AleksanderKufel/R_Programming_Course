rankhospital <- function (state, outcome, num = "best") {
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
  
  switch(num,
    "best" = num <- 1,
    "worst" = num <- nrow(data),
    if(num > nrow(data)) return(NA)
  )
  
  data[,2] <- as.numeric(data[,2])
  data <- data[order(data[,1]),]
  data <- data[order(data[,2]),]
  data[num,1]
}