# Part 3
# Write a function that takes a directory of data files and a threshold 
# for complete cases and calculates the correlation between sulfate and 
# nitrate for monitor locations where the number of completely observed 
# cases (on all variables) is greater than the threshold. The function 
# should return a vector of correlations for the monitors that meet the 
# threshold requirement. If no monitors meet the threshold requirement, 
# then the function should return a numeric vector of length 0. 

source("complete.R")

corr <- function(directory, threshold = 0) {
  comp <- complete(directory)
  id <- comp[comp[,"nobs"] > threshold,]$id
  setwd(directory)
  cor <- numeric()
  for(i in id) {
    f <- read.csv(filename(i))
    f <- f[,2:3]
    f <- f[complete.cases(f),]
    cor <- c(cor, cor(f$sulfate ,f$nitrate))
  }
  setwd("..")
  cor
}