# 4  Ranking hospitals in all states
# Write a function called rankall that takes two arguments: an outcome name (outcome) 
# and a hospital rank-ing (num). The function reads the outcome-of-care-measures.csv 
# file and returns a 2-column data frame containing the hospital in each state that has 
# the ranking specified in num. For example the function call 
# rankall("heart attack", "best") would return a data frame containing the names of the 
# hospitals that are the best in their respective states for 30-day heart attack death 
# rates.  The function should return a value for every state (some may be NA). The first 
# column in the data frame is named hospital, which contains the hospital name, and the 
# second column is named state, which contains the 2-character abbreviation for the 
# state name.  Hospitals that do not have data on a particular outcome should be 
# excluded from the set of hospitals when deciding the rankings.
# Handling ties.  The rankall function should handle ties in the 30-day mortality rates 
# in the same way that the rankhospital function handles ties.

# The function should use the following template.

# rankall <- function(outcome, num = "best") {
#   ## Read outcome data
  
#   ## Check that state and outcome are valid
  
#   ## For each state, find the hospital of the given rank
  
#   ## Return a data frame with the hospital names and the
#   ## (abbreviated) state name
  
# }

# NOTE: For the purpose of this part of the assignment (and for efficiency), your 
# function should NOT call the rankhospital function from the previous section.

# The function should check the validity of its arguments.  If an invalid outcome value 
# is passed to rankall, the function should throw an error via the stop function with 
# the exact message "invalid outcome". The num variable can take values "best", "worst", 
# or an integer indicating the ranking (smaller numbers are better). If the number 
# given by num is larger than the number of hospitals in that state, then the function 
# should return NA.

# Here is some sample output from the function.

# > source("rankall.R")
# > head(rankall("heart attack", 20), 10)

#                               hospital state
# AK                                <NA>    AK
# AL      D W MCMILLAN MEMORIAL HOSPITAL    AL
# AR   ARKANSAS METHODIST MEDICAL CENTER    AR
# AZ JOHN C LINCOLN DEER VALLEY HOSPITAL    AZ
# CA               SHERMAN OAKS HOSPITAL    CA
# CO            SKY RIDGE MEDICAL CENTER    CO
# CT             MIDSTATE MEDICAL CENTER    CT
# DC                                <NA>    DC
# DE                                <NA>    DE
# FL      SOUTH FLORIDA BAPTIST HOSPITAL    FL

# > tail(rankall("pneumonia", "worst"), 3)

#                                     hospital state
# WI MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC    WI
# WV                     PLATEAU MEDICAL CENTER    WV
# WY           NORTH BIG HORN HOSPITAL DISTRICT    WY

# > tail(rankall("heart failure"), 10)
#                                                             hospital state
# TN                         WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL    TN
# TX                                        FORT DUNCAN MEDICAL CENTER    TX
# UT VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER    UT
# VA                                          SENTARA POTOMAC HOSPITAL    VA
# VI                            GOV JUAN F LUIS HOSPITAL & MEDICAL CTR    VI
# VT                                              SPRINGFIELD HOSPITAL    VT
# WA                                         HARBORVIEW MEDICAL CENTER    WA
# WI                                    AURORA ST LUKES MEDICAL CENTER    WI
# WV                                         FAIRMONT GENERAL HOSPITAL    WV
# WY                                        CHEYENNE VA MEDICAL CENTER    WY

# Save your code for this function to a file named rankall.R.

# Use the submit script provided to submit your solution to this part. There are 3 
# tests that need to be passed for this part of the assignment.
# rm(list = ls())
#######################################################################
rankall <- function(outcome, num = "best") {
  ## Read outcome data
  File = "outcome-of-care-measures.csv"
  # Hospital = 2
  # State = 7 ; outcome = "heart attack"; num = 20
  ##### data_f <- read.csv("outcome-of-care-measures.csv", check.names = T, stringsAsFactors = F, na.strings = "Not Available", colClasses = "character")
  data_f <- read.csv(File, check.names = TRUE, stringsAsFactors = FALSE, na.strings = "Not Available")
  outcomes <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
  names <- c("Hospital.Name", "State", outcome)     ##### USE THIS
  nums <- c("best", "worst")
  
  df_t <- data_f[ c(2, 7, outcomes[outcome])][!is.na (data_f[outcomes[outcome]]), ]  ##### USE THIS
  df_t[, 3 ] = as.numeric( df_t[, 3 ] )  ##### USE THIS
  names(df_t) <- names     ##### USE THIS
  
# DELETE FROM HERE 
  nrow(df_t)
  write.csv(df_t, paste0("df_t_", outcome))
# DELETE Upto HERE 
  
  ## Check that state and outcome are valid
  ##### if ( !(state %in% data_f$State) )    stop ("invalid state")
  if ( is.na(outcomes[outcome]) )    stop ("invalid outcomes")
  
  ## For each state, find the hospital of the given rank
  if ( num %in% nums[1] ) num <- 1
  if ( num %in% nums[2] ) num <- -1
  
  ##### df_t <- df_t[ order(df_t[2], sign(num) * df_t[3], df_t[1]), ]
  f <- df_t$State
  df_t <- split(df_t, f)   ##### USE THIS

  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  hospital <- names(df_t)
  df <- data.frame(hospital = hospital, state = hospital, row.names = hospital); head(df); tail(df);
  
  i1 <- FALSE; i2 <- 0
  for ( i in names(df_t) ) {
    ##### cat("State:", i,":Nrow(df_t):", nrow(df_t),":Nrow df_t[", i,"]:", nrow(df_t[i]),":Nrow df_t[[", i, "]]:", nrow(df_t[[i]]),":\n")
    ##### paste("State:", i,":Nrow(df_t):", nrow(df_t),":Nrow df_t[", i,"]:", nrow(df_t[i]),":Nrow df_t[[", i, "]]:", nrow(df_t[[i]]),":\n")
    ##### paste0("State:", i,":Nrow(df_t):", nrow(df_t),":Nrow df_t[", i,"]:", nrow(df_t[i]),":Nrow df_t[[", i, "]]:", nrow(df_t[[i]]),":\n")
    ##### print (paste0("State:", i,":Nrow(df_t):", nrow(df_t),":Nrow df_t[", i,"]:", nrow(df_t[i]),":Nrow df_t[[", i, "]]:", nrow(df_t[[i]]),":\n"))
    
    i2 <- i2 + 1
    df1 <- df_t[[i]]
# 1 of below Start is required     
    # df1 <- df1[ order(df1[2], sign(num) * df1[3], sign(num) * df1[1]), ]; # This syntax is not correct as sign(num) *df1[1] has a problem
    if ( num > 0 ) {
      #df1 <- df1[ order(df1[2], sign(num) * df1[3], df1[1]), ]; df1
      #hospital[i2] =  as.character( df1[abs(num), ][1] ); hospital
      hospital[i2] =  as.character( df1[ order(df1[2], df1[3], df1[1]), ][abs(num), ][1] ); hospital
    }
    else {
      #df1 <- df1[ order(df1[2], sign(num) * df1[3], df1[1]), ]; df1
      #hospital[i2] =  as.character( df1[abs(num), ][1] ); hospital
      hospital[i2] =  as.character( df1[ order(df1[2], -df1[3], -rank(df1[1])), ][abs(num), ][1] ); hospital
    }
# 1 of above End is required
    
    write.table(df1, file = paste0("df1_sorted_", num, "_", outcome), sep = ",", append = i1, col.names = !i1)
    i1 <- TRUE
  }
  
  ##### df$hospital <- as.data.frame(hospital); head(df); tail(df); nrow(df); ncol(df); length(df); class(df)
  df$hospital <- hospital; head(df); tail(df); nrow(df); ncol(df); length(df); class(df)
  head(df); tail(df); nrow(df); ncol(df); length(df); class(df)
  dim(df); names(df);
  
  # unsplit
  # f <- factor(names(df))
  # df <- unsplit ( df, f )
  write.csv(df, file = "df.csv", row.names = F)
  write.table(df, file = paste0("df_", num, "_", outcome), sep = ",", append = F, col.names = T, row.names = F)
  
  df
}

# .st_ST# <- Sys.time()
#######################################################################