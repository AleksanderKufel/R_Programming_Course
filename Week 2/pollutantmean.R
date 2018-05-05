# Part 1
# Write a function named 'pollutantmean' that calculates the mean of a pollutant
# (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean'
# takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor
# ID numbers, 'pollutantmean' reads that monitors' particulate matter data from
# the directory specified in the 'directory' argument and returns the mean of the
# pollutant across all of the monitors, ignoring any missing values coded as NA.

filename <- function(id) {
  if (id > 99) 
    paste(id, ".csv",sep="")
  else if (id > 9)
    paste("0", id, ".csv", sep="")
  else
    paste ("00", id, ".csv", sep="")
}

pollutantmean <- function(directory, pollutant, id = 1:322) {
  setwd(directory)
  data <- NA
  for(i in id) {
    nextfile.data <- read.csv(filename(i))[,pollutant]
    data <- c(data, nextfile.data)
  }
  setwd("..")
  mean(data, na.rm = TRUE)
}