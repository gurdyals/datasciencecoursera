# 2  Finding the best hospital in a state
# Write a function called best
# that take two arguments:  the 2-character abbreviated name of a state and an
# outcome name.  The function reads the "outcome-of-care-measures.csv" file and 
# returns a character vector with the  name  of  the  hospital  that  has  the  
# best  (i.e.   lowest)  30-day  mortality  for  the  specified  outcome in that 
# state.  The hospital name is the name provided in the Hospital.Name variable.  
# The outcomes can be one of "heart attack", "heart failure", or "pneumonia".  
# Hospitals that do not have data on a particular outcome should be excluded from 
# the set of hospitals when deciding the rankings.
# Handling ties.
# If there is a tie for the best hospital for a given outcome, then the hospital 
# names should be sorted in alphabetical order and the First hospital in that set 
# should be chosen (i.e.  if hospitals \b", \c", and \f" are tied for best, then 
# hospital \b" should be returned). The function should use the following template.
# 
# best <- function(state, outcome) {
# ## Read outcome data
# ## Check that state and outcome are valid
# ## Return hospital name in that state with lowest 30-day death
# ## rate
# }
#
# The function should check the validity of its arguments.  If an invalid state
# value is passed to best ,  the function should throw an error via the stop function 
# with the exact message \invalid state".  If an invalid outcome value is passed to 
# best , the function should throw an error via the stop function with the exact 
# message \invalid outcome".
# 
# Here is some sample output from the function.
#
# > source("best.R")
# > best("TX", "heart attack")
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
# > best("TX", "heart failure")
# [1] "FORT DUNCAN MEDICAL CENTER"
# > best("MD", "heart attack")
# [1] "JOHNS HOPKINS HOSPITAL, THE"
# > best("MD", "pneumonia")
# [1] "GREATER BALTIMORE MEDICAL CENTER"
# > best("BB", "heart attack")
# Error in best("BB", "heart attack") : invalid state
# > best("NY", "hert attack")
# Error in best("NY", "hert attack") : invalid outcome
# >
# 2
# Save your code for this function to a file named best.R.
# Use the submit script provided to submit your solution to this part.  There are 3 tests that need to be passed
# for this part of the assignment.

# rm(list = ls())
#######################################################################
best <- function(state, outcome) {
## Read outcome data
##### data_f <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data_f <- read.csv("outcome-of-care-measures.csv", check.names = T, stringsAsFactors = F, na.strings = "Not Available", colClasses = "character")
  Hospital = 2
  State = 7
  outcomes <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
  
  ##### class(data_f)
  ##### class(outcome)
  ##### class(outcomes)

  # state = "SC"; outcome = "heart attack"
  # state = "NY"; outcome = "pneumonia"
  # state = "NN"; outcome = "pneumonia"
  
## Check that state and outcome are valid
  #try(
  if (sum(data_f$State == state) == 0)
    stop ("invalid state")
  #try(
  if (is.na(outcomes[outcome]))
    stop ("invalid outcomes")
  
## Return hospital name in that state with lowest 30-day death
## rate
  df_t <- data_f[ c(Hospital, State, outcomes[outcome] ) ]
  
  df1 <- df_t[!is.na(df_t[3]) & df_t$State == state, ]
  df1[, 3 ]  <- as.numeric(df1[, 3])
  
  df2 <- df1[ do.call(order, df1[3]), ]
  # df2$Hospital.Name[nrow(df2)]
  df2$Hospital.Name[1]
}
#######################################################################

# class (df1$State )
# class (df1$Hospital.Name )
# class (df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia )

# sort (df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
# max (df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)

# sort (df1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
# max(df1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)

# tail(df1)
# tail(df2)
# head(df1)
# head(df2)
# nrow(df1)
# nrow(df2)
# best("SC", "heart attack")
# best("NY", "pneumonia")
# best("NN", "pneumonia")
# source("best.R")
# submit() 
# source("submitscript3.R")
# > best("TX", "heart attack")
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
# > best("TX", "heart failure")
# [1] "FORT DUNCAN MEDICAL CENTER"
# > best("MD", "heart attack")
# [1] "JOHNS HOPKINS HOSPITAL, THE"
# > best("MD", "pneumonia")
# [1] "GREATER BALTIMORE MEDICAL CENTER"
# > best("BB", "heart attack")
# Error in best("BB", "heart attack") : invalid state
# > best("NY", "hert attack")
# Error in best("NY", "hert attack") : invalid outcome