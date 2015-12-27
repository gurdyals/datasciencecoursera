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
##### rm (list = ls())
##### source("submitscript3.R")
##### source("rankall.R")
##### submit()
##### 1;2;3;4;5;6;7;8;9;10

# rankall("heart attack", 4)
# rankall("heart attack", 6)
# rankall("heart attack", 7)
# rankall("pneumonia", "worst")
# rankall("heart failure", 10)

# 8; outcome = "heart attack"; num = 4;
# 9; outcome = "pneumonia"; num = "worst";
# 10; outcome = "heart failure"; num = 10;

#######################################################################
# df
# uf <- names(df_t)
# ?unsplit
# df <- unsplit(df, uf)
# write.csv(df, "i")
# write.csv(df, file = "df.csv", row.names = F)
# i <- read.csv("df.csv")
# head(i); tail(i); nrow(i); ncol(i); length(i); class(i); dim(i); names(i);

#######################################################################
# rm(list = ls() )
# state = "AA"; WV WY WA UT
# state = "WA"
# unique (data_f$State )
# state %in% data_f$State
# state == data_f$State
# df_t <- data_f[ c(2, 7, outcomes[outcome])][!is.na (data_f[outcomes[outcome]]), ]
# df_t <- data_f[ c(2, 7, outcomes[outcome])]  ##### USE THIS
# names(df_t) <- c("Hospital.Name", "State", outcome)     ##### USE THIS
# df_t[, 3 ] = as.numeric( df_t[, 3 ] )  ##### USE THIS

# f <- df_t$State
# df_t2 <- df_t
# df_t2 <- split(df_t, f)
# warnings()
# df_t2 <- split(df_t, f, drop = TRUE)
# df_t <- split(df_t, f)   ##### USE THIS
# df_t2


# class(df_t)
# ncol(df_t)
# length(df_t)
# head(df_t)
# nrow(df_t)
# tail(df_t)
# df_t[3944,]
# df_t[nrow(df_t) - 5,]

# # df_t <- df_t2
# i1 <- F; i2 <- 0
# for ( i in names(df_t) ) {
#   cat ( "State : ", i, ":\t")
#   cat ( "Nrow df_t : ", i, " :", nrow(df_t), ":\t" )
#   cat ( "Nrow df_t[", i,"] :", nrow(df_t[i]), ":\t" )
#   cat ( "Nrow df_t[[", i, "]] :", nrow(df_t[[i]]), ":\n" )
  
#   write.table(df_t2[[i]], file = "df_t2", sep = ",", append = i1)
#   write.table(df_t[[i]], file = "df_t", sep = ",", append = i1)
#   i1 <- TRUE
#   i2 <- i2 + nrow(df_t[[i]])
#   cat (i1, ":\t:", i2)
# }

#######################################################################

#######################################################################
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