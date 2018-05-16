source("rankhospital.R")

rankall <- function(outcome, num = "best") {
  data <- read.csv("outcome-of-care-measures.csv")
  states <- data[, 7]
  best.hospitals <- numeric()
  for(s in levels(states)) 
    best.hospitals <- c(best.hospitals, rankhospital(s,outcome,num))
  
  data.frame(hospital = best.hospitals, state = levels(states))
}