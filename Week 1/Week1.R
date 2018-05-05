data <- read.csv("hw1_data.csv")
names(data) # names of the columns
data[1:2,] # first two rows
nrow(data) #number of rows
data [152:153,]
data [47,]

# Ozone values with NA excluded
data2 <- na.omit(data$Ozone) 

# number of rows with missing Ozone value
nrow(data) - length(data2) 

# What is the mean of the Ozone column in this dataset? 
# Exclude missing values (coded as NA) from this calculation.
mean(data2)

# Extract the subset of rows of the data frame where Ozone values are 
# above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
data3 <- data[data[,"Ozone"] > 31 & data[,"Temp"] > 90,]
mean(na.omit(data3$Solar.R))

# What is the mean of "Temp" when "Month" is equal to 6?
mean(na.omit(data[data[,"Month"] == 6,]$Temp))

# What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
max(na.omit(data[data[,"Month"] == 5,]$Ozone))
