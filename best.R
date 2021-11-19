best <- function(state, outcome) {
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
  
  ##Return hospital name in that state with lowest 30-day death rate
  
  ##Get only the hospitals in chosen state
  nRates <- rates[(rates[, "state"] == state), ]
  
  ##Convert outcome rate to numeric
  nRates[, outcome] <- as.numeric(nRates[, outcome])
  
  ##Remove NA values
  nRates <- nRates[!is.na(nRates[, outcome]), ]
  
  ##Order by outcome rate
  nRates <- nRates[order(nRates[, outcome]), ]
  
  ##Get names of hosptial with the lowest rate
  eNames <- nRates[nRates[, outcome] == min(nRates[,outcome]),1]
  
  ##Sort by hospital name if tie
  sort(eNames)[1]
}