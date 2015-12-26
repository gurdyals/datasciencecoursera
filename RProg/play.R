rm(list = ls())
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
