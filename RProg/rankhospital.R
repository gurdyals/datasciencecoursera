# 3  Ranking hospitals by outcome in a state
# Write a function called rankhospital that takes three arguments:  the 2-character 
# abbreviated name of a state ( state ), an outcome ( outcome ), and the ranking 
# of a hospital in that state for that outcome ( num ).
# The function reads the outcome-of-care-measures.csv file and returns a character 
# vector with the name of the hospital that has the ranking specied by the num
# argument.  For example, the call
# rankhospital("MD", "heart failure", 5)
# would return a character vector containing the name of the hospital with the 5th 
# lowest 30-day death rate for heart failure.  The num argument can take 
# values \best", \worst",  or an integer indicating the ranking
# (smaller numbers are better).  If the number given by num is larger than the 
# number of hospitals in that state, then the function should return NA. Hospitals 
# that do not have data on a particular outcome should be excluded from the set of 
# hospitals when deciding the rankings.
# Handling ties.  It may occur that multiple hospitals have the same 30-day mortality 
# rate for a given cause of death.  In those cases ties should be broken by using 
# the hospital name.  For example, in Texas (\TX"),
# the hospitals with lowest 30-day mortality rate for heart failure are shown here.

# > head(texas)
# Hospital.Name Rate Rank
# 3935       FORT DUNCAN MEDICAL CENTER  8.1    1
# 4085  TOMBALL REGIONAL MEDICAL CENTER  8.5    2
# 4103 CYPRESS FAIRBANKS MEDICAL CENTER  8.7    3
# 3954           DETAR HOSPITAL NAVARRO  8.7    4
# 4010           METHODIST HOSPITAL,THE  8.8    5
# 3962  MISSION REGIONAL MEDICAL CENTER  8.8    6

# Note that Cypress Fairbanks Medical Center and Detar Hospital Navarro both have 
# the same 30-day rate(8.7). However,  because  Cypress  comes  before  Detar  
# alphabetically,  Cypress  is  ranked  number  3  in  this scheme  and  Detar  
# is  ranked  number  4.   One  can  use  the order function  to  sort  multiple  
# vectors  in  this manner (i.e.  where one vector is used to break ties in 
# another vector).

# The function should use the following template.
# rankhospital <- function(state, outcome, num = "best") {
# ## Read outcome data
# ## Check that state and outcome are valid
# ## Return hospital name in that state with the given rank
# ## 30-day death rate
# }

# The function should check the validity of its arguments.  If an invalid state value 
# is passed to best,  the function should throw an error via the stop function with 
# the exact message \invalid state".  If an invalid outcome value is passed to best
# , the function should throw an error via the stop function with the exact 
# message \invalid outcome".
# Here is some sample output from the function

# > source("rankhospital.R")
# > rankhospital("TX", "heart failure", 4)
# [1] "DETAR HOSPITAL NAVARRO"
# > rankhospital("MD", "heart attack", "worst")
# [1] "HARFORD MEMORIAL HOSPITAL"
# > rankhospital("MN", "heart attack", 5000)
# [1] NA

# Save your code for this function to a file named rankhospital.R.
# Use the submit script provided to submit your solution to this part.
# There are 4 tests that need to be passed for this part of the assignment.
#######################################################################

rankhospital <- function(state, outcome, num = "best") {
## Read outcome data
  File = "outcome-of-care-measures.csv"
  # Hospital = 2
  # State = 7
  # state = "TX"; outcome = "heart failure"

  ##### data_f <- read.csv("outcome-of-care-measures.csv", check.names = T, stringsAsFactors = F, na.strings = "Not Available", colClasses = "character")
  data_f <- read.csv(File, check.names = TRUE, stringsAsFactors = FALSE, na.strings = "Not Available")
  outcomes <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)

## Check that state and outcome are valid
  if (sum(data_f$State == state) == 0)
    stop ("invalid state")
  if (is.na(outcomes[outcome]))
    stop ("invalid outcomes")
  
## Return hospital name in that state with the given rank
## 30-day death rate

  df_t <- data_f[ c(2,7,outcomes[outcome])][!is.na (data_f[outcomes[outcome]]) & data_f$State == state, ]  ##### USE THIS
  names(df_t) <- c("Hospital.Name", "State", "Rate")     ##### USE THIS
  df_t[, 3 ] = as.numeric( df_t[, 3 ] )  ##### USE THIS
  
  #####  Rank <- 1:nrow(df_t)
  #####  df_t_ordered <- df_t[order(df_t[3], df_t[1]), ]
  #####  df_t_ordered$Rank <- as.data.frame(Rank) ##### Add a Rank Column to df_t
  #####  df_t_ordered$State <- NULL ##### Remove Column State from df_t
  
  # write.csv(df_t, "df_t")  
  if ( num == "best" ) num <- 1
  if ( num == "worst" ) num = nrow(df_t)
  
  as.character( df_t[order(df_t[3], df_t[1]), ][num, ][1] )   ##### USE THIS
}

# .st_ST# <- Sys.time()
#######################################################################