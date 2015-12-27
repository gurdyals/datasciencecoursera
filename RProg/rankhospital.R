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

##### rm(list = ls())
##### source("submitscript3.R")
##### source("rankhospital.R")
##### submit()
##### 1;2;3;4;5;6;7
#######################################################################
# > head(texas)
# Hospital.Name Rate Rank
# 3935       FORT DUNCAN MEDICAL CENTER  8.1    1
# 4085  TOMBALL REGIONAL MEDICAL CENTER  8.5    2
# 4103 CYPRESS FAIRBANKS MEDICAL CENTER  8.7    3
# 3954           DETAR HOSPITAL NAVARRO  8.7    4
# 4010           METHODIST HOSPITAL,THE  8.8    5
# 3962  MISSION REGIONAL MEDICAL CENTER  8.8    6

# > source("rankhospital.R")
# > rankhospital("TX", "heart failure", 4)
# [1] "DETAR HOSPITAL NAVARRO"
# > rankhospital("MD", "heart attack", "worst")
# [1] "HARFORD MEMORIAL HOSPITAL"
# > rankhospital("MN", "heart attack", 5000)
# [1] NA

# Hospital = 2; State = 7; num = "best"
# state = "TX"; outcome = "heart failure"

##### state = "TX"; outcome = "heart failure"; num = 4
##### df_t <- data_f[c(2, 7, outcomes[outcome])][!is.na(data_f[outcomes[outcome]]), ] ##### USE THIS
##### df_t <- data_f[c(Hospital, State, outcomes[outcome])][!is.na(data_f[outcomes[outcome]]) & data_f$State == state, ]
##### df_t <- data_f[c(Hospital, State, outcomes[outcome])][!is.na(data_f[outcomes[outcome]]), ] ##### USE THIS
##### head (df_t)
##### nrow(df_t)
##### head (data_f[c(Hospital, State, outcomes[outcome])][data_f$State == state, ])


##### head(df_t)
##### nrow(df_t)
##### ncol(df_t)
##### class(df_t)
##### class(df_t$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)

##### names(data_f[1:10])
##### names(data_f[11:16])
##### names(data_f[17:22])
##### names(data_f[23:28])
##### names(data_f[29:34])
##### names(data_f[35:40])
##### names(data_f[41:46])

##### ?dump
##### ?save
##### dump(df_t)
##### save(df_t, file = "df_t.save")
##### ?write.csv
##### write.csv(df_t, "df_t.csv")
##### ?split
##### df_t[, 3 ] = as.numeric( df_t[, 3 ] )  ##### USE THIS
##### df_t1_split <- split(df_t, df_t[2])   ##### USE THIS

##### class( df_t1_split )
##### df_t1_split$TX
##### df_t2 <- as.data.frame( df_t1_split[state]  )  ##### USE THIS
##### df_t1_split[state][[1]] ##### USE THIS
##### df_t2_list <- df_t1_split[state]
##### write.csv(df_t1_split$TX, "df_t1s1")
##### write.csv(df_t1_split[state], "df_t1s2")

##### head(df_t2)
##### class(df_t2)
##### class (df_t2$TX.Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure )
##### head(df_t2_list)
##### class(df_t2_list)
##### class (df_t2$TX.Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure )

##### tail( df_t2 )
##### ncol(df_t2)
##### nrow(df_t2)
##### names(df_t2)
##### tail( df_t1_split[state][[1]] )
##### ncol(df_t1_split[state][[2]])
##### nrow(df_t1_split[state][[1]])
##### names(df_t1_split[state][[1]])
##### length(df_t1_split[state][[1]])
##### head(df_t1_split[state][[1]] )
##### class(df_t1_split[state])    ##### USE THIS
##### class(df_t1_split[state][1])    ##### USE THIS
##### class(df_t1_split[state][[1]])    ##### USE THIS
##### df_t1_split[state][[1]]

##### head ( df_t1_split[state][[1]][3] )

##### ?order

##### (r1 <- rank(x1 <- c(3, 1, 4, 15, 92)))
##### x2 <- c(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5)
##### names(x2) <- letters[1:11]
##### (r2 <- rank(x2)) # ties are averaged
##### r1
##### x1
##### names(x1)
##### names(r1)
##### names(x1) <- r1
##### x1
##### names(r1) <- x1
##### r1
##### x2
##### r2
##### class(x2)
##### x11 <- as.data.frame(x1) + as.data.frame(r1)
##### x11
##### r11 <- as.data.frame(r1) + as.data.frame(x1)
##### r11
##### r12 <- as.data.frame(c(r1, x1))
##### r12 <- c(r1, x1)
##### r12
##### head(r12)

##### r <- rank(df_t2[3] )
##### r11 <- rank ( df_t1_split[state][[1]][3] )
##### r
##### r1
##### class(r)
##### tail(r)
##### ncol(r)
##### nrow(r)

##### # rm(list = ls())
##### # rm(df_t)
##### df_t <- data_f[c(2,7,17)][ !is.na (data_f[outcomes[outcome]] ),] # ) # [ !is.na(outcomes[outcome]), ]) ##### USE THIS
##### names(df_t) <- c("Hospital.Name", "State", "Rate")     ##### USE THIS

##### # newdata1 <- mtcars[order(mtcars[1]),]   ##### USE THIS
##### newdata1 <- mtcars[order(mtcars[1]),]   ##### USE THIS
##### df_t[, 3 ] = as.numeric( df_t[, 3 ] )  ##### USE THIS
##### # df_ts <- split(df_t, df_t[2])   ##### USE THIS
##### # df_ts[state][[1]] ##### USE THIS
##### # class(df_ts[state])    ##### USE THIS
##### # class(df_ts[state][1])    ##### USE THIS
##### # class(df_ts[state][[1]])    ##### USE THIS
##### names(df_ts)
##### for ( i in names(df_ts) ) { print( df_ts[[i]][,1][1]) }

##### for ( i in names(df_ts) ) {
##### cat ("For State ", i, " Hospital Name ", df_ts[[i]][1][1,], "\n" )
#####   # DOES NOT  Work # cat ("For State ", i, " Hospital Record ", df_ts[[i]][1,][1,], "\n" )
#####   cat ("For State ", i, " Hospital Record ", as.character(df_ts[[i]][1,]), "\n" )
#####   cat ("For State ", i, " Hospital Record ", paste(df_ts[[i]][1,]), "\n" )
#####   cat ("For State ", i, " Hospital Record ", paste(df_ts[[i]][1,], sep = "\t"), "\n" )
##### }

##### print ( c(df_ts[[i]][1,]) )
##### print ( as.character(df_ts[[i]][1,]) )

##### df_ts[[i]][1,][1, ]
##### as.character (df_ts[[i]][1,])
##### as.list (df_ts[[i]][1,][1,])
##### paste0(df_ts[[i]][1,], sep = ",")
##### df_ts[[i]][1,][3][4]

##### ?sprintf
##### print.factor(i)

##### df_ts[[i]][1][1,]
##### ?cat
##### cat (df_ts[[i]][1][1,])
##### cat ("df_ts[[1]][1][1]")

##### df_t1 <- df_t[df_t[2] == state,]   ##### USE THIS
##### df_t1 ##### USE THIS
##### class(df_t1)    ##### USE THIS
##### head(df_t1)    ##### USE THIS
##### tail(df_t1)    ##### USE THIS
##### nrow(df_t1)    ##### USE THIS
##### ncol(df_t1)    ##### USE THIS
##### tail(df_t1)    ##### USE THIS
##### newdata <-  df_t1[order(df_t1[3], df_t1[1]), ]   ##### USE THIS
##### newdata
##### class(newdata)    ##### USE THIS
##### head(df_t1)    ##### USE THIS
##### head(newdata)    ##### USE THIS
##### tail(newdata)    ##### USE THIS
##### nrow(newdata)    ##### USE THIS
##### ncol(newdata)    ##### USE THIS
##### tail(df_t1)    ##### USE THIS
##### names(newdata) <- c("Hospital.Name", "State", "Rate", "Rank")     ##### USE THIS

##### newdata$Rank <- newdata$Rate  ##### Add a Column "Rank" from "Rate"
##### newdata$Rank <- 1:nrow(newdata) ##### Add a Column "Rank"
##### newdata
##### head(newdata)
##### newdata$Rank <- NULL     ##### Remove a Column "Rank"
##### i <- as.data.frame( newdata$Rank )
##### i
##### class(i)
##### rank (i, ties.method = "average")

##### # this function also returns output in the desired format
##### P <- 243.51
##### t <- 31 / 365
##### n <- 365
##### data.fn <- function(r = 0.15) {
#####   interest <- P*(1+( r/n ))^( n*t ) - P
#####   list(r = r, interest = interest)
##### }
##### my.output <- as.data.frame(data.fn(seq(0.15, 0.22, by = 0.01)))
##### my.output

##### write.csv(df_t1[state], "df_t1")


#######################################################################
# sorting examples using the mtcars dataset
##### attach(mtcars)

##### class(mtcars)

##### # sort by mpg
##### newdata <- mtcars[order(mpg),] 
##### newdata1 <- mtcars[order(mtcars[1]),] 
##### mtcars
##### newdata
##### head(mtcars)
##### head(newdata)
##### head(newdata1)
##### tail(mtcars)
##### tail(newdata)

##### # sort by mpg and cyl
##### newdata <- mtcars[order(mpg, cyl),]
##### mtcars
##### newdata
##### head(mtcars)
##### head(newdata)
##### tail(mtcars)
##### tail(newdata)

##### #sort by mpg (ascending) and cyl (descending)
##### newdata <- mtcars[order(mpg, -cyl),] 
##### mtcars
##### newdata
##### head(mtcars)
##### head(newdata)
##### tail(mtcars)
##### tail(newdata)

##### detach(mtcars)
#######################################################################
