rm(list = ls())
# .st_ST# <- Sys.time()
set.seed(1)
x <- rnorm(10, 1, 2)
x
str(x)
summary(x)
min(x)
max(x)
mean(x)

rnorm(10)
rpois(10, 2)
ppois(10, 2)

set.seed(20)
x <- rnorm(100)
x
e <- rnorm(100, 0, 2)
e
x

y <- 0.5 + 2 * x + e
y
summary(y)

plot(x, y)

#######################################################################
set.seed(10)
x <- rbinom(100, 1, 0.5)
x
e <- rnorm(100, 0, 2)
e
y <- 0.5 + 2 * x + e
y
summary(x)
summary(y)
str(x)
str(y)
plot(x, y)

set.seed(10)
t <- rbinom(100, 11, 0.5)
t
summary(t)
str(t)
table(t)
plot(t, y)
#######################################################################
##### Poisson data()
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
str(y)
table(y)
plot(x, y)

#######################################################################
set.seed(1)
sample(1:10, 4)
sample(1:10, 4)
sample(letters, 5)
sample(1:10)
sample(1:10)
sample(1:10, replace = TRUE)

t <- sample(letters, 5)
t <- sample(1:10, replace = TRUE)
y <- sample(1:10)
y <- sample(1:10, replace = TRUE)

t
y
summary(t)
summary(y)
str(t)
str(y)
table(t)
table(y)
plot(t, y)

#######################################################################
source("FUNCS/pollutantmean.R")
source("FUNCS/complete.R")
source("FUNCS/corr.R")
directory = "specdata"
pollutant = "nitrate" ##### "sulfate"
id = 1:332
threshold = 0
class(system.time)
p <- system.time(pollutantmean(directory, pollutant, id))
q <- system.time(complete(directory  = "specdata", id = 1:332))
r <- system.time(corr(directory  = "specdata", threshold = 0))
p
q
r
class(p)
class(q)
class(r)

#######################################################################
## Elapsed_Time > User_Time
e <- system.time(readLines("http://www.jhsph.edu"))
e

## Elasped_Time < User_Time
hilbert <- function(n) {
  i <- 1:n
  1 / outer(i - 1, i, "+")
}

n <- 7
n^2
a <- matrix( sample(1:(n^2)), nrow = n, ncol = n )
a
solve(a)

h <- hilbert(1000)
h1 <- system.time(hilbert(1000))
h2 <- system.time(svd(h))
h
h1
h2

#######################################################################
## Timing Longer Expressions
system.time ( {
  n <- 1000
  r <- numeric(n)
  for (i in 1:n) {
    x <- rnorm(n)
    r[i] <- mean(x)
  }
})

#######################################################################
## R profiler
Rprof() ## Starts the Profiler in R
summaryRprof() ## Very useful to summarize Rprof() outputto make it readable
## Do NOT use system.time() and Rprof() together

lm(y ~ x)
sample.interval = 10000

#######################################################################

#######################################################################
Week 4 Quiz **Please Note: No Grace Period**
  Help Center

The due date for this quiz is Sun 3 Jan 2016 8:30 PM AST.
In accordance with the Coursera Honor Code, I (Gurdyal Singh) certify that the answers here are my own work.

#######################################################################
##### Question 1
##### What is produced at the end of this snippet of R code?

set.seed(1)
rpois(5, 2)

A vector with the numbers 1, 1, 2, 4, 1  # This is the answer
##### Because the `set.seed()' function is used, `rpois()' will always output the same vector in this code.
A vector with the numbers 3.3, 2.5, 0.5, 1.1, 1.7
A vector with the numbers 1, 4, 1, 1, 5
It is impossible to tell because the result is random

#######################################################################
##### Question 2
##### What R function can be used to generate standard Normal random variables?
dnorm
rnorm   # This is the answer
##### Functions beginning with the `r' prefix are used to simulate random variates.
qnorm
pnorm

#####
# Question Explanation
# Standard probability distributions in R have a set of four functions that 
# can be used to simulate variates, evaluate the density, evaluate the cumulative 
# density, and evaluate the quantile function.

#######################################################################
Question 3
When simulating data, why is using the set.seed() function important?
It can be used to specify which random number generating algorithm R should use, ensuring consistency and reproducibility.     # This is the answer
It ensures that the sequence of random numbers is truly random.
It can be used to generate non-uniform random numbers.
It ensures that the random numbers generated are within specified boundaries.

#######################################################################
Question 4
Which function can be used to evaluate the inverse cumulative distribution function for the Poisson distribution?
ppois
rpois
dpois
qpois     # This is the answer
##### Probability distribution functions beginning with the `q' prefix are 
##### used to evaluate the quantile (inverse cumulative distribution) function.

#######################################################################
Question 5
What does the following code do?

set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e

Generate data from a Normal linear model     # This is the answer
Generate uniformly distributed random data
Generate random exponentially distributed data
Generate data from a Poisson generalized linear model

#######################################################################
Question 6
What R function can be used to generate Binomial random variables?
dbinom
qbinom
rbinom     # This is the answer
pbinom

#######################################################################
Question 7
What aspect of the R runtime does the profiler keep track of when an R expression is evaluated?
the working directory
the global environment
the package search list
the function call stack     # This is the answer

#######################################################################
Question 8
Consider the following R code

library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)

(Assume that y, x1, and x2 are present in the workspace.) Without running the code, what percentage of the run time is spent in the 'lm' function, based on the 'by.total' method of normalization shown in 'summaryRprof()'?
23%
100%     # This is the answer
50%
It is not possible to tell
##### When using `by.total' normalization, the top-level function 
##### (in this case, `lm()') always takes 100% of the time.

#######################################################################
Question 9
When using 'system.time()', what is the user time?
It is the time spent by the CPU waiting for other tasks to finish # This is the answer, this is NOT Correct answer
It is the time spent by the CPU evaluating an expression  # This is the answer which is correct, not the other one
It is a measure of network latency
It is the "wall-clock" time it takes to evaluate an expression

#######################################################################
Question 10
If a computer has more than one available processor and R is able to take advantage of that, then which of the following is true when using 'system.time()'?
user time is 0
elapsed time may be smaller than user time     # This is the answer
elapsed time is 0
user time is always smaller than elapsed time
#######################################################################
best.R
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
#######################################################################

#######################################################################
rankhospital.R
#######################################################################

##### rm(list = ls())
##### source("submitscript3.R")
##### source("rankhospital.R")
##### submit()
##### 1;2;3;4;5;6;7
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

#######################################################################
rankall.R
#######################################################################
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


#######################################################################
Assignment_Wk004_R.R
#######################################################################

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

#######################################################################
cachematrix.R
#######################################################################

hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }

# Code after this line is for testing purpose and should not be considered
# part of the assignment
# Thanks
##### rm(list = ls())
## Change the value of "n" to test creation/inversion of Matrix
n <- 5
mtx2inv <- hilbert(n)
m1 <- mtx2inv
m1
func_invert <- function (mtx1, ...) solve(mtx1, ...)
inversed_mtx <- func_invert(m1)
inversed_mtx

mtx2inv
varM <- makeCacheMatrix(mtx2inv)
varM$mtx
cacheSolve(varM)

m2 <- varM$get()
m2
varM$set(m2)
varM$mtx2inv
varM$mtx
varM$getInverse()
cacheSolve(varM)
varM$getInverse()
mtx2inv <- varM$set(mtx2inv)
mtx2inv
inversed_mtx <- func_invert(m2)
inversed_mtx
varM$setInverse(inversed_mtx)
inversed_mtx

#######################################################################

#######################################################################
Week_03_R_programming.R
#######################################################################
rm(list = ls())
##### Question 001
##### Take a look at the 'iris' dataset that comes with R. The data can be loaded 
##### with the code: 
library(datasets)
data(iris)

##### A description of the dataset can be found by running 
?iris

##### There will be an object called 'iris' in your workspace. In this dataset, 
##### what is the mean of 'Sepal.Length' for the species virginica? 
##### (Please only enter the numeric result and nothing else.)
##### Testing play Start
class(iris)  ##### [1] "data.frame"
iris 
head( iris )
names(iris) ##### [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"
class(iris$Sepal.Length) ##### [1] "numeric"
class(iris$Sepal.Width)  ##### [1] "numeric"
class(iris$Petal.Length) ##### [1] "numeric"
class(iris$Petal.Width)  ##### [1] "numeric"
class(iris$Species)      ##### [1] "factor"
iris$Species
unique(iris$Species)
##### [1] setosa     versicolor virginica 
##### Levels: setosa versicolor virginica
table(iris$Species)
##### setosa versicolor  virginica 
##### 50         50         50 

levels(iris$Species[iris$Species])
as.numeric(levels(iris$Species[iris$Species]))
as.character(iris$Species)
unique(as.numeric(iris$Species)) ##### [1] 1 2 3

iris$Sepal.Length
iris$Species == 1
sum(iris$Species == "setosa")
sum(as.numeric(iris$Species) == 1)
(as.numeric(iris$Species) == 1)
##### Testing play End
iris$Sepal.Length[iris$Species == "virginica"]
mean( iris$Sepal.Length[iris$Species == "virginica"] ) ##### [1] 6.588

##### or try tapply as suggested in the Quiz suggestion :
tapply(iris$Sepal.Length, iris$Species, mean)

##### Your Answer 		Score 	Explanation
##### 6.588 	Correct 	1.00 	To get the answer here, you can use 'tapply' to 
##### calculate the mean of 'Sepal.Length' within each species.
##### Total 		1.00 / 1.00 	


##### Question 2
##### Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
##### colMeans(iris)
##### apply(iris[, 1:4], 2, mean)
##### apply(iris, 1, mean)
##### apply(iris, 2, mean)
##### Testing play Start
colMeans(iris[, 1:4])
colMeans(iris[1:4])
apply(iris[, 1:4], 2, mean)
apply(iris, 1, mean)
apply(iris, 2, mean)
iris[, 1:4]
iris[1:4, ]
iris[c(1:3, 5, 4, 2) ]
iris[c(1:3)]
head(iris[c(1:3)])
head(iris[c(1:3, 5, 4, 2) ])
?sapply
apply(iris[, 1:4],  2, mean)
sapply(iris[, 1:4], mean)
vapply(iris[, 1:4], mean, 0)
lapply(iris[, 1:4], mean)
tapply(iris[, 1:4], mean)  ##### wrong syntax
##### Testing play End

apply(iris[, 1:4], 2, mean)



##### Question 3
##### Load the 'mtcars' dataset in R with the following code
library(datasets)
data(mtcars)

##### There will be an object names 'mtcars' in your workspace. You can find 
##### some information about the dataset by running

?mtcars

##### How can one calculate the average miles per gallon (mpg) by number of 
##### cylinders in the car (cyl)?
with(mtcars, tapply(mpg, cyl, mean))
split(mtcars, mtcars$cyl)
apply(mtcars, 2, mean)
tapply(mtcars$cyl, mtcars$mpg, mean)
##### Testing play Start
mtcars
class(mtcars)
head(mtcars)
nrow(mtcars)
unique(mtcars$cyl) ##### [1] 6 4 8
table(mtcars$cyl)
mtcars$mpg [ mtcars$cyl == 4 ]
length(mtcars$mpg [ mtcars$cyl == 4 ])
i4<-mean(mtcars$mpg [ mtcars$cyl == 4 ])
i6<-mean(mtcars$mpg [ mtcars$cyl == 6 ])
i8<-mean(mtcars$mpg [ mtcars$cyl == 8 ])
mtcars$cyl == 4

with(mtcars, tapply(mpg, cyl, mean))
split(mtcars, mtcars$cyl)
split(mtcars$mpg, mtcars$cyl)
apply(mtcars, 2, mean)
tapply(mtcars$cyl, mtcars$mpg, mean)
length(tapply(mtcars$cyl, mtcars$mpg, mean) )

i[[1]] <- split(mtcars$mpg, mtcars$cyl)
class(i)
dim(i)
names(i)
sapply(i[[1]], mean)
split(mtcars$mpg, mtcars$cyl)

tapply(mtcars$mpg, mtcars$cyl, mean)

##### Testing play End
with(mtcars, tapply(mpg, cyl, mean))


##### Question 4
##### Continuing with the 'mtcars' dataset from the previous Question, what is 
##### the absolute difference between the average horsepower of 4-cylinder cars 
##### and the average horsepower of 8-cylinder cars?

##### Testing play Start
with(mtcars, tapply(mpg, cyl, mean))
mtcars
head(mtcars)
with(mtcars, tapply(hp, cyl, mean))
i <- with(mtcars, tapply(hp, cyl, mean))
class(i)
i[1]
i[2]
i[3]
i[3] - i[1]
##### Testing play End
i <- with(mtcars, tapply(hp, cyl, mean))
i[3] - i[1]  ##### 126.5779 
8 
126.5779 



##### Question 5
##### If you run

debug(ls)

##### what happens when you next call the 'ls' function?
##### The 'ls' function will return an error.
##### Execution of the 'ls' function will suspend at the 4th line of the 
##### function and you will be in the browser.
##### Execution of 'ls' will suspend at the beginning of the function and 
##### you will be in the browser.
##### The 'ls' function will execute as usual.

##### Testing play Start
ls()
##### Testing play End
ls()
undebug(ls)

#######################################################################


#######################################################################
Assignment_Wk002_R.R
#######################################################################
# Introduction

# This second programming assignment will require you to write an R function is able to cache potentially time-consuming computations. For example, taking the mean of a numeric vector is typically a fast operation. However, for a very long vector, it may take too long to compute the mean, especially if it has to be computed repeatedly (e.g. in a loop). If the contents of a vector are not changing, it may make sense to cache the value of the mean so that when we need it again, it can be looked up in the cache rather than recomputed. In this Programming Assignment will take advantage of the scoping rules of the R language and how they can be manipulated to preserve state inside of an R object.
# Example: Caching the Mean of a Vector

# In this example we introduce the <<- operator which can be used to assign a value to an object in an environment that is different from the current environment. Below are two functions that are used to create a special object that stores a numeric vector and cache's its mean.
# The first function, makeVector creates a special "vector", which is really a list containing a function to

# set the value of the vector
# get the value of the vector
# set the value of the mean
# get the value of the mean

# makeVector <- function(x = numeric()) {
# m <- NULL
# set <- function(y) {
# x <<- y
# m <<- NULL
# }
# get <- function() x
# setmean <- function(mean) m <<- mean
# getmean <- function() m
# list(set = set, get = get,
# setmean = setmean,
# getmean = getmean)
# }

# The following function calculates the mean of the special "vector" created with the above function. However, it first checks to see if the mean has already been calculated. If so, it gets the mean from the cache and skips the computation. Otherwise, it calculates the mean of the data and sets the value of the mean in the cache via the setmean function.

# cachemean <- function(x, ...) {
# m <- x$getmean()
# if(!is.null(m)) {
# message("getting cached data")
# return(m)
# }
# data <- x$get()
# m <- mean(data, ...)
# x$setmean(m)
# m
# }

# Assignment: Caching the Inverse of a Matrix

# Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). Your assignment is to write a pair of functions that cache the inverse of a matrix.

# Write the following functions:

# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
# cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

# Computing the inverse of a square matrix can be done with the solve function in R. For example, if X is a square invertible matrix, then solve(X) returns its inverse.

# For this assignment, assume that the matrix supplied is always invertible.

# In order to complete this assignment, you must do the following:

# Fork the GitHub repository containing the stub R files at https://github.com/rdpeng/ProgrammingAssignment2 to create a copy under your own account.
# Clone your forked GitHub repository to your computer so that you can edit the files locally on your own machine.
# Edit the R file contained in the git repository and place your solution in that file (please do not rename the file).
# Commit your completed R file into YOUR git repository and push your git branch to the GitHub repository under your account.
# Submit to Coursera the URL to your GitHub repository that contains the completed R code for the assignment.

# In addition to submitting the URL for your GitHub repository, you will need to submit the 40 character SHA-1 hash (as string of numbers from 0-9 and letters from a-f) that identifies the repository commit that contains the version of the files you want to submit. You can do this in GitHub by doing the following

# Going to your GitHub repository web page for this assignment

# Click on the “?? commits” link where ?? is the number of commits you have in the repository. For example, if you made a total of 10 commits to this repository, the link should say “10 commits”.

# You will see a list of commits that you have made to this repository. The most recent commit is at the very top. If this represents the version of the files you want to submit, then just click the “copy to clipboard” button on the right hand side that should appear when you hover over the SHA-1 hash. Paste this SHA-1 hash into the course web site when you submit your assignment. If you don't want to use the most recent commit, then go down and find the commit you want and copy the SHA-1 hash.

# A valid submission will look something like (this is just an example!)

https://github.com/rdpeng/ProgrammingAssignment2

7c376cc5447f11537f8740af8e07d6facc3d9645

# Grading
# This assignment will be graded via peer assessment. During the evaluation phase, you must evaluate and grade the submissions of at least 4 of your classmates. If you do not complete at least 4 evaluations, your own assignment grade will be reduced by 20%.

#######################################################################
rm(list = ls())


makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

set.seed(10)
y <- rnorm(10, 1, 2)
y
class(y)
str(y)
summary(y)
table(y)

v <- makeVector()
v
str(v)
table(v)
class(makeVector)
class(v)
v$get()
v$set(y)
v$getmean()
cachemean(v)
m
v$setmean(y)
# v$setmean(v)  ##### Do not call from main environment cacheMean() is calling it
#######################################################################

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

#######################################################################

Solution Program
Copied From
https://github.com/dsSanjeet/ProgrammingAssignment2/blob/master/cachematrix.R

## cachematrix.R
##
## Create a cache marix object that can be used to
## repeatably solve the inverse of the marix, but only
## calculates the inverse once.
##
## Usage:
##  M <- matrix(c(1, 2, 3, 4), nrow=2, ncol=2)
##  cacheMatrix <- makeCacheMatrix(M)
##  cacheSolve(cacheMatrix)
##
##  cacheMatrix$set(M)      # Change the matrix being cached.
##  M <- cacheMatrix$get()  # Returns the matrix being cached.
##
##  cacheMatrix$setInverse(solve(data, ...)) # Private function containing cached inverse of x
##  cacheMatrix$getInverse()                 # Private function used to get the cached inverse of x

## Create a cacheMatrix object for an invertale matrix.

makeCacheMatrix <- function(x = matrix()) {
  cachedInverse <- NULL
  set <- function(y) {
    x <<- y
    cachedInverse <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) cachedInverse <<- inverse
  getInverse <- function() cachedInverse
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


M <- matrix(1:4, 2)
M
class(M)
str(M)
table(M)
M[,1]
M[2,][]
solve(M)

varM <- makeCacheMatrix()
varM
str(varM)

varM$set(M)
varM$get()
varM$getInverse()
varM$setInverse(M)
cacheSolve(varM)

#######################################################################
hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
i <- i + 1
outer(i - 1, i, "+")

i <- 2
h8 <- hilbert(8); h8
h8 <- hilbert(i); h8
h8
sh8 <- solve(h8)
sh8
round(sh8 %*% h8, 3)

A <- hilbert(4)
A
A[] <- as.complex(A)
## might not be supported on all platforms
try(solve(A))

#######################################################################

S <- solve(M)
?solve
S
class(S)
str(S)
table(S)

M
S

cacheSolve

## Return the inverse of an cacheMatrix object
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  invFunc <- x$getInverse()
  if(!is.null(invFunc)) {
    message("getting cached data")
    return(invFunc)
  }
  data <- x$get()
  invFunc <- solve(data, ...)
  x$setInverse(invFunc)
  invFunc
}

# .st_TM <- Sys.time()
#######################################################################


#######################################################################
bin_op.R
#######################################################################



# The syntax for creating new binary operators in R is unlike anything else in
# R, but it allows you to define a new syntax for your function. I would only
# recommend making your own binary operator if you plan on using it often!
#
# User-defined binary operators have the following syntax:
#      %[whatever]% 
# where [whatever] represents any valid variable name.
# 
# Let's say I wanted to define a binary operator that multiplied two numbers and
# then added one to the product. An implementation of that operator is below:
#
# "%mult_add_one%" <- function(left, right){ # Notice the quotation marks!
#   left * right + 1
# }
#
# I could then use this binary operator like `4 %mult_add_one% 5` which would
# evaluate to 21.
#
# Write your own binary operator below from absolute scratch! Your binary
# operator must be called %p% so that the expression:
#
#       "Good" %p% "job!"
#
# will evaluate to: "Good job!"

"%p%" <- function(arg1, arg2){ # Remember to add arguments!
  paste ( arg1, arg2, sep = " ")
}

# .st_TM <- Sys.time()
#######################################################################

#######################################################################
boring_function.R
#######################################################################
# You're about to write your first function! Just like you would assign a value 
# to a variable with the assignment operator, you assign functions in the following
# way:
#
# function_name <- function(arg1, arg2){
#	# Manipulate arguments in some way
#	# Return a value
# }
#
# The "variable name" you assign will become the name of your function. arg1 and
# arg2 represent the arguments of your function. You can manipulate the arguments
# you specify within the function. After sourcing the function, you can use the 
# function by typing:
# 
# function_name(value1, value2)
#
# Below we will create a function called boring_function. This function takes
# the argument `x` as input, and returns the value of x without modifying it.
# Delete the pound sign in front of the x to make the function work! Be sure to 
# save this script and type submit() in the console after you make your changes.

boring_function <- function(x) {
  x
}

# .st_TM <- Sys.time()
#######################################################################


#######################################################################
complete.R
#######################################################################
complete <- function(directory, id = 1:332) {
  st_TM =   Sys.time()
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ##### rm(list = ls())
  
  ##### directory = "specdata"
  
  files = dir( directory, pattern = "*.csv", full.names = TRUE )
  ##### files
  
  #####
  ##### id = 7:14
  ##### idc = as.character(id)
  ##### print( idc )
  ##### for  ( i in 1:length(id) ) {
  #####   print (i)
  #####   if ( id[i] < 100 ) { 
  #####     idc[i] = paste0( "0", idc[i] )
  #####   }
  #####   if ( id[i] < 10 ) { 
  #####     idc[i] = paste0( "0", idc[i] )
  #####   }
  #####   print (id[i])
  #####   print (idc[i])
  ##### }
  ##### 
  
  fls <- files[id]
  
  df_out <- data.frame(id=id, nobs=c(0))
  df <- lapply(fls, read.csv)
  
  for ( i in 1:length(id) ) {
    print (id[i])
    s <- !is.na (df[[i]]$sulfate)
    n <- !is.na (df[[i]]$nitrate)
    uid <- unique (df[[i]]$ID)
    
    ##### print (s)
    ##### print (n)
    print (uid)
    print ( sum ( n & s ) )
    df_out$nobs[i] <- sum( n & s )
  }
  
  
  ##### idc = list(id)
  ##### s = as.logical(id)
  ##### n = as.logical(id)
  ##### idc[i - id[1] + 1] = paste0("df", i)
  ##### s7 = !is.na(df7$sulfate)
  ##### n7 = !is.na(df7$nitrate)
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  print ( df_out )
  print ( st_TM )
  print ( Sys.time() )
  df_out
}

# .st_TM <- Sys.time()
#######################################################################


#######################################################################
dput_z.R
#######################################################################
structure(c(1, 3, 9, 78, 5, 4, 5, 4), .Dim = c(4L, 2L), .Dimnames = list(
  c("a", "a1", "a2", "a3"), c("x", "x1")))

#######################################################################


#######################################################################
dump_z_z1_m.R
#######################################################################

z <-
  structure(c(1, 3, 9, 78, 5, 4, 5, 4), .Dim = c(4L, 2L), .Dimnames = list(
    c("a", "a1", "a2", "a3"), c("x", "x1")))
z1 <-
  structure(c(5, 1, 4, 3, 5, 9, 4, 78), .Dim = c(2L, 4L), .Dimnames = list(
    c("y", "x"), NULL))
m <-
  structure(201:221, .Dim = c(3L, 7L), .Names = c("c(\"a\", \"d\", \"v\", \"s\", \"w\", \"d\", \"s\")", 
                                                  "c(\"r\", \"g\", \"u\")", NA, NA, NA, NA, NA, NA, NA, NA, NA, 
                                                  NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), .Dimnames = list(c("a", 
                                                                                                              "d", "v"), c("s", "w", "d", "s", "r", "g", "u")))

# .st_TM <- Sys.time()
#######################################################################


#######################################################################
evaluate.R
#######################################################################
# You can pass functions as arguments to other functions just like you can pass
# data to functions. Let's say you define the following functions:
#
# add_two_numbers <- function(num1, num2){
#    num1 + num2
# }
#
# multiply_two_numbers <- function(num1, num2){
#	num1 * num2
# }
#
# some_function <- function(func){
#    func(2, 4)
# }
#
# As you can see we use the argument name "func" like a function inside of 
# "some_function()." By passing functions as arguments 
# some_function(add_two_numbers) will evaluate to 6, while
# some_function(multiply_two_numbers) will evaluate to 8.
# 
# Finish the function definition below so that if a function is passed into the
# "func" argument and some data (like a vector) is passed into the dat argument
# the evaluate() function will return the result of dat being passed as an
# argument to func.
#
# Hints: This exercise is a little tricky so I'll provide a few example of how
# evaluate() should act:
#    1. evaluate(sum, c(2, 4, 6)) should evaluate to 12
#    2. evaluate(median, c(7, 40, 9)) should evaluate to 9
#    3. evaluate(floor, 11.1) should evaluate to 11

evaluate <- function(func, dat){
  # Write your code here!
  # Remember: the last expression evaluated will be returned! 
  func( dat )
}

# .st_TM <- Sys.time()
#######################################################################


#######################################################################
mad_libs.R
#######################################################################
# Let's explore how to "unpack" arguments from an ellipses when you use the
# ellipses as an argument in a function. Below I have an example function that
# is supposed to add two explicitly named arguments called alpha and beta.
# 
# add_alpha_and_beta <- function(...){
#   # First we must capture the ellipsis inside of a list
#   # and then assign the list to a variable. Let's name this
#   # variable `args`.
#
#   args <- list(...)
#
#   # We're now going to assume that there are two named arguments within args
#   # with the names `alpha` and `beta.` We can extract named arguments from
#   # the args list by used the name of the argument and double brackets. The
#   # `args` variable is just a regular list after all!
#   
#   alpha <- args[["alpha"]]
#   beta  <- args[["beta"]]
#
#   # Then we return the sum of alpha and beta.
#
#   alpha + beta 
# }
#
# Have you ever played Mad Libs before? The function below will construct a
# sentence from parts of speech that you provide as arguments. We'll write most
# of the function, but you'll need to unpack the appropriate arguments from the
# ellipses.

mad_libs <- function(...){
  # Do your argument unpacking here!
  args<- list (...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  # args$place
  # args$adjective
  # args$noun
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}

# .st_TM <- Sys.time()
#######################################################################


#######################################################################
my_mean.R
#######################################################################
# You're free to implement the function my_mean however you want, as long as it
# returns the average of all of the numbers in `my_vector`.
#
# Hint #1: sum() returns the sum of a vector.
# 	Ex: sum(c(1, 2, 3)) evaluates to 6
#
# Hint #2: length() returns the size of a vector.
# 	Ex: length(c(1, 2, 3)) evaluates to 3
#
# Hint #3: The mean of all the numbers in a vector is equal to the sum of all of
#		   the numbers in the vector divided by the size of the vector.
#
# Note for those of you feeling super clever: Please do not use the mean()
# function while writing this function. We're trying to teach you something 
# here!
#
# Be sure to save this script and type submit() in the console after you make 
# your changes.

my_mean <- function(my_vector) {
  # Write your code here!
  # Remember: the last expression evaluated will be returned! 
  my_sum=sum(my_vector)
  lngth=length(my_vector)
  print (my_sum)
  print (lngth)
  print (my_sum / lngth)
}

# .st_TM <- Sys.time()
#######################################################################



#######################################################################
pollutantmean.R
#######################################################################
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ##### pollutantmean <- function(directory = "specdata/", pollutant = "sulfate", id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  st_TM = Sys.time()
  
  ##### directory = "specdata"
  ##### pollutant = "sulfate"
  
  print (id)
  files = dir(directory)
  ##### files = dir(directory, full.names = T)
  
  ##### class (files)
  ##### print ( files )
  ##### rbind(files)
  
  full_fn = paste ( directory, files [id], sep = "/" )
  ##### full_fn = files
  
  ##### print ( full_fn )
  
  df = read.csv( full_fn[1] )
  
  for_loop <- function ( df ) {
    for ( i in full_fn[2:length(full_fn)] ) {
      ##### print ( i )
      df_temp = read.csv(i)
      ##### print ( length(full_fn) )
      ##### print ( class(df_temp) )
      ##### print ( class(df) )
      ##### print (df_temp)
      ##### print ( nrow (df_temp) )
      ##### print ( nrow (df) )
      df <- rbind(df, df_temp)
    }
    ##### print (" Hello" )
    ##### print ( nrow(df) )
    ##### print ( nrow(df_temp) )
    print ( "In for_loop function" )
    df
    ##### return ( df )
  }
  
  print ( nrow (df) )
  print ( ncol (df) )
  
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  ##### i1 <- read.csv(directory/file)
  ##### i <- i1$sulfate
  ##### s <- !is.na(i1$sulfate)
  ##### mean_return <- mean(i[s])
  
  df_final = df[ df$ID == id[0], ]
  
  for_loop01 <- function ( df_final ) {
    for ( i in id[1]:id[length(id)] ) {
      ##### print ( i )
      ##### df_t = df [ df$ID == i, ]
      ##### print ( nrow(df_final) )
      ##### print ( nrow(df_t) )
      ##### print ( nrow(df_final) + nrow(df_t) )
      
      df_final = rbind ( df_final, df [ df$ID == i, ] )
      ##### print ( nrow(df_final) )
      ##### print ( nrow(df) )
      ##### print ("")
    }
    ##### return ( df_final )
    print ( "In for_loop01 function" )
    df_final
  }
  
  ##### df [ !is.na(df [ pollutant ]) & df$ID == 2, ]
  
  if ( length(id) > 1 ) {
    df <- for_loop( df )
    print ( nrow(df) )
    print ( "In if and for loops" )
  }
  
  df_final <- for_loop01( df_final )
  
  print ( nrow(df) )
  mean_df = mean ( df [ !is.na ( df[pollutant] ), pollutant ] )
  print ( nrow(df_final) )
  mean_final = mean ( df_final [ !is.na ( df_final[pollutant] ), pollutant ] )
  
  print ( mean_df )
  print ( mean_final )
  print ( directory )
  print ( pollutant )
  print ( id )
  print ( st_TM )
  nd_TM = Sys.time()
  print ( nd_TM )
  return ( mean_df )
}

# .st_TM <- Sys.time()
#######################################################################



#######################################################################
remainder.R
#######################################################################

# Let me show you an example of a function I'm going to make up called
# increment(). Most of the time I want to use this function to increase the
# value of a number by one. This function will take two arguments: "number" and
# "by" where "number" is the digit I want to increment and "by" is the amount I
# want to increment "number" by. I've written the function below. 
#
# increment <- function(number, by = 1){
#     number + by
# }
#
# If you take a look in between the parentheses you can see that I've set
# "by" equal to 1. This means that the "by" argument will have the default
# value of 1.
#
# I can now use the increment function without providing a value for "by": 
# increment(5) will evaluate to 6. 
#
# However if I want to provide a value for the "by" argument I still can! The
# expression: increment(5, 2) will evaluate to 7. 
# 
# You're going to write a function called "remainder." remainder() will take
# two arguments: "num" and "divisor" where "num" is divided by "divisor" and
# the remainder is returned. Imagine that you usually want to know the remainder
# when you divide by 2, so set the default value of "divisor" to 2. Please be
# sure that "num" is the first argument and "divisor" is the second argument.
#
# Hint #1: You can use the modulus operator %% to find the remainder.
#   Ex: 7 %% 4 evaluates to 3. 
#
# Remember to set appropriate default values! Be sure to save this 
# script and type submit() in the console after you write the function.

remainder <- function(num = 7, divisor == 1) {
  # Write your code here!
  # Remember: the last expression evaluated will be returned! 
  num / divisor
}

# .st_TM <- Sys.time()
#######################################################################


#######################################################################
telegram.R
#######################################################################
# The ellipses can be used to pass on arguments to other functions that are
# used within the function you're writing. Usually a function that has the
# ellipses as an argument has the ellipses as the last argument. The usage of
# such a function would look like:
#
# ellipses_func(arg1, arg2 = TRUE, ...)
#
# In the above example arg1 has no default value, so a value must be provided
# for arg1. arg2 has a default value, and other arguments can come after arg2
# depending on how they're defined in the ellipses_func() documentation.
# Interestingly the usage for the paste function is as follows:
#
# paste (..., sep = " ", collapse = NULL)
#
# Notice that the ellipses is the first argument, and all other arguments after
# the ellipses have default values. This is a strict rule in R programming: all
# arguments after an ellipses must have default values. Take a look at the
# simon_says function below:
#
# simon_says <- function(...){
#   paste("Simon says:", ...)
# }
#
# The simon_says function works just like the paste function, except the
# begining of every string is prepended by the string "Simon says:"
#
# Telegrams used to be peppered with the words START and STOP in order to
# demarcate the beginning and end of sentences. Write a function below called 
# telegram that formats sentences for telegrams.
# For example the expression `telegram("Good", "morning")` should evaluate to:
# "START Good morning STOP"

telegram <- function(...){
  paste( "START", ..., "STOP", sep = " ")
}

# .st_TM <- Sys.time()
#######################################################################


#######################################################################

#######################################################################
#######################################################################