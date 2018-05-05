# Part 2
# Write a function that reads a directory full of files and reports the number of
# completely observed cases in each data file. The function should return a data 
# frame where the first column is the name of the file and the second column is 
# the number of complete cases. A prototype of this function follows

source("pollutantmean.R")

complete <- function(directory, id = 1:332) {
  setwd(directory)
  id.col <- integer()
  nobs.col <- integer()
  for(i in id) {
    file <- read.csv(filename(i))
    id.col <- c(id.col, i)
    nobs.col <- c(nobs.col, sum(complete.cases(file)))
  }
  setwd("..")
  data.frame(id = id.col, nobs = nobs.col)
}