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

##Source best function
source("best.R")

##Making some examples
best("TX", "heart attack")
##"CYPRESS FAIRBANKS MEDICAL CENTER"
best("TX", "heart failure")
##"FORT DUNCAN MEDICAL CENTER"
best("MD", "heart attack")
##"JOHNS HOPKINS HOSPITAL, THE"
best("MD", "pneumonia")
##"GREATER BALTIMORE MEDICAL CENTER"
best("BB", "heart attack")
##Error in best("BB", "heart attack") : invalid state
best("NY", "hert attack")
##Error in best("NY", "hert attack") : invalid outcome

##Source rankhospital function
source("rankhospital.R")

##Making some examples
rankhospital("TX", "heart failure", 4)
##"DETAR HOSPITAL NAVARRO"
rankhospital("MD", "heart attack", "worst")
##"HARFORD MEMORIAL HOSPITAL"
rankhospital("MN", "heart attack", 5000)
##NA
