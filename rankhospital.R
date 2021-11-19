rankhospital <- function(state, outcome, num = 'best') {
  
  ##Read outcome data
  
  data <- read.csv(file='outcome-of-care-measures.csv', 
                   colClasses = 'character', 
                   na.strings = c("NA", "Not Available"))
  
  ##Get data we're interested in
  
  rates <- as.data.frame(cbind(data[, 2],   #hospital
                               data[, 7],   #state
                               data[, 11],  #heart attack
                               data[, 17],  #heart failure
                               data[, 23]), #pneumonia
                         stringsAsFactors = FALSE)
  
  ##Rename columns
  
  colnames(rates) <- c("hospital", 
                       "state", 
                       "heart attack", 
                       "heart failure", 
                       "pneumonia")
  
  ##Check that state and outcome are valid
  
  if(!state %in% rates[,"state"]){
    stop('invalid state')
  }
  
  if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
    stop('invalid outcome')
  }
  
  
  ##Return hospital name in that state with lowest 30-day death
  ##rate
  
  ##Get only the hospitals in chosen state
  nRates <- rates[(rates[, "state"] == state), ]
  
  ##Convert outcome rate to numberic, gets a warning
  nRates[, outcome] <- as.numeric(nRates[, outcome])
  
  ##Remove NA values
  nRates <- nRates[!is.na(nRates[, outcome]), ]
  
  ##convert num argument to valid rank
  
  if(num == "best") {
    num <- 1 
  } else if (num == "worst") {
    num <- nrow(nRates) 
  }
  
  ##Order by outcome rate
  nRates <- nRates[order(nRates[, outcome], nRates[, "hospital"]), ]
  
  ##Get names of hospital 
  
  nRates[num,1]
  
}