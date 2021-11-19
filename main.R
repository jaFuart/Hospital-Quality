##Reading the data
outcome <- read.csv("outcome-of-care-measures.csv", 
                    colClasses = "character")
##Outputting first 6 elements
head(outcome)

##Checking the number of rows and columns
ncol(outcome)
nrow(outcome)

##Checking the names
names(outcome)

##Making a simple histogram of the 30-day death 
##rates from heart attack run
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])