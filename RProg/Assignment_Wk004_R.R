# Programming Assignment 3: Hospital Quality **Please Note: No Grace Period**: 
# Instructions

# Introduction
# This fourth programming assignment will be graded via a submit script which is 
# described below.
# Detailed Instructions
# Please download this document for detailed instructions about the assignment:
  
#   Programming Assignment 3 Instructions

# Data
# The zip file containing the data for this assignment can be downloaded here:
  
#   Programming Assignment 3 Data [832K]

# For this assignment you will need to unzip this file in your working directory.
# Grading
# This assignment will be graded using unit tests executed via the submit script 
# that you run on your computer. To obtain the submit script, run the 
# following code in R:
  
#   source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")

# Or you can download the script to your working directory (NOTE: You may need 
# to rename the script to be "submitscript3.R"). Then source it locally via

# source("submitscript3.R")

# The first time you run the submit script it will prompt you for your Submission 
# login and Submission password. These can be found at the top of the Programming 
# Assignments page. To execute the submit script, type

# submit()

# at the console prompt (after source-ing the file). NOTE that the submit script 
# requires that you be connected to the Internet in order to work properly. 
# When you execute the submit script in R, you will see the following menu 
# (after typing in your submission login email and password):
  
# [1] 'best' part 1
# [2] 'best' part 2
# [3] 'best' part 3
# [4] 'rankhospital' part 1
# [5] 'rankhospital' part 2
# [6] 'rankhospital' part 3
# [7] 'rankhospital' part 4
# [8] 'rankall' part 1
# [9] 'rankall' part 2
# [10] 'rankall' part 3
# Which part are you submitting [1-10]? 

# Entering a number between 1 and 10 will execute the corresponding part of 
# the homework. We will compare the output of your functions to the correct 
# output. For each test passed you receive the specified number of points on 
# the Assignments List web page.

# You are finished when you have successfully submitted everything using submit() 
# and you see scores on the assignment page. You can ignore the Submit buttons 
# to the right of each score. They are only to be used when firewall or proxy 
# settings prevent users from successfully using the submit() script. 
# The submit() script will describe how to create files for uploading if there 
# are problems, but under normal circumstances, there is NO NEED to use the 
# Submit buttons on the assignment page.
#######################################################################
rm(list = ls())

outcome <- ?read.csv("outcome-of-care-measures.csv", colClasses = "character")
data_f <- read.csv("outcome-of-care-measures.csv", check.names = T, stringsAsFactors = F, na.strings = "Not Available", colClasses = "character")
head(outcome[11])
head(data_f[1:46])
ncol(outcome)  # 46
nrow(outcome)  # 4706
head(outcome[19])  #  Heart_Failure
head(outcome[2])   #  Hospital_Name
unique(outcome[2]) # 4706
names(outcome[19])
names(outcome)
tail(outcome)
class(outcome)
o11_nc <- outcome[11]
o11_bc <- outcome[, 11]
o11_ac <- outcome[11, ]
nrow(o11_nc)
o11_nc
o11_bc
nrow(o11_nc)
o11_ac
nrow(o11_ac)
length(o11_nc)
length(o11_bc)
length(o11_ac)
head(o11)
head(o11_nc)
head(outcome[11,])

hist(o11_nc)
hist(o11_bc)
hist(o11_ac)

hist(as.numeric(o11_nc))
hist(as.numeric(o11_bc))
hist(as.numeric(o11_ac))
warnings()

?stop
?try

stop ("invalid state")
n <- 23 # 7, 2, 11, 23
data_f[n]
head(data_f[n])
names(data_f)
names(data_f)[1:10]
names(data_f)[11:16]
names(data_f)[17:22]
names(data_f)[23:28]
names(data_f)[29:34]
names(data_f)[35:40]
names(data_f)[41:46]

i <- unique(data_f[7]); length(i); nrow(i); i[,1]

state = "AL1"
a <- data_f[7] == state; a
a <- data_f$State == state; a
sum(a)

data_f$State
try ( if (sum(data_f$State == state) == 0) stop ("say something") )

outcome = "heart attack"
outcomes <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)

try( if (is.na(outcomes[outcome])) stop ("invalid outcomes") )

hospital = 2
state   = 7
outcomes[outcome]

data_f[ c(hospital, state, outcomes[outcome] ) ]
head (data_f[ c(hospital, state, outcomes[outcome] ) ])
head(data_f[ c(2, 7, 11) ])

df_t <- data_f[ c(hospital, state, outcomes[outcome] ) ]
data.frame ( data_f[ c(hospital, state, outcomes[outcome] ) ] )
head(df_t)

df_t <- data_f[ c(hospital, state, outcomes[outcome] ) ]

a <- df_t[!is.na(df_t[3]), ]
head(a)
class(a)
nrow(a)
ncol(a)
sort()
order(a)
a1 <- a[ do.call(order, a[3]), ]
a1
head(a1)
nrow(a1)
tail(a1)

df_t <- data_f[ c(hospital, state, outcomes[outcome] ) ]

a <- df_t[!is.na(df_t[3]), ]
a1 <- df_t[!is.na(df_t[3]), ]
a1 <- a[ do.call(order, a[3]), ]
a1 <- df_t[ do.call(order, df_t[3]), ]

a2 <- a1[ !is.na(a1[3] ), ]
tail(a2)
a2[229, ]
nrow(a2)
i <- a2[nrow(a2), ]
class(i)
i$Hospital.Name
a2[nrow(a2), ]$Hospital.Name

#######################################################################