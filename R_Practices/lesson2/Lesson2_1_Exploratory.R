# Fettah Kiran
# COSC 6323 - Statistical Methods in Research

# 
# MEAN
?mean()
# Create new vector:
x <- c(1,2,3,41,1,12,3,-23,12)
class(x)
x.mean <- mean(x)
x.mean

# Case with NA in observations:
x2 <- c(x, NA, NA)
x2.mean <- mean(x)
x2.mean
x2.mean <- mean(x, na.rm = TRUE)

#
# MEDIAN
?median()
x2.median <- median(x2, na.rm = TRUE)

#
# MODE
?mode

mode(x)
# different functionality here


# Lets check the result
?table
table(x)

# STANDARD DEVIATION
?sd()
sd(x)

# STANDARD ERROR
# SEM is calculated by taking the standard deviation and dividing 
# it by the square root of the sample size
stde <- function(y) sd(y)/sqrt(length(y))
stde(x)

# QUANTILE
?quantile
quantile(x)

# SAMPLE
?sample()
# seed is used to generate the same sample
set.seed(12)
sample(c(1:10),3)

# QUICK REVIEW
library(ggplot2)

?diamonds
str(diamonds)
summary(diamonds)

diamonds$price
diamonds$color

mean(diamonds$price)
median(diamonds$price)
math.mode(diamonds$price)

# DISTRIBUTION GENERATORS
# https://rpubs.com/ggraham412/100906
# Probability Density - d...()
# Cumulative Distribution - p...()
# Quantile - q...()


## NORMAL
?dnorm()
# This function gives height of the probability distribution at each point 
# for a given mean and standard deviation.

# Create a sequence of numbers between -10 and 10 incrementing by 0.1.
x <- seq(-10, 10, by = .1)
# Choose the mean as 2.5 and standard deviation as 1.5.
y <- dnorm(x, mean = 2.5, sd = 1.5)
# Give the chart file a name.
plot(x,y)

# Another sample
y <- dnorm(x, mean = 0, sd = 3.5)
plot(x,y)

?pnorm()
# Gives the probability of a normally distributed random number to be less that the 
# value of a given number. It is also called "Cumulative Distribution Function"

?qnorm()
# Takes the probability value and gives a number whose cumulative value matches 
# the probability value

?rnorm()
# generate random numbers whose distribution is normal. 
# It takes the sample size as input and generates that many random numbers.

## BINOMIAL
?dbinom()
# This function gives the probability density distribution at each point.

# Create a sample of 50 numbers which are incremented by 1.
x <- seq(0,50,by = 1)
# Create the binomial distribution.
y <- dbinom(x,50,0.5)
# Plot the graph for this sample.
plot(x,y)

## POISSON
?dpois()



## EXPONENTIAL
?dexp()


## CHI-SQUARED
?dchisq()


## Probability Density Function (PDF) and 
## Cumulative Distribution Function (CDF)
mtcars
str(mtcars)

upd_mtcars <- mtcars[,c(2,4)]
upd_mtcars$score <- 0
upd_mtcars$score <- ifelse(upd_mtcars$hp<70, 1,
                           ifelse(upd_mtcars$hp<100,2,3))

# PDF probability density
?density()
tmp.density = density(upd_mtcars$score)

plot(density(upd_mtcars$score), main = "PDF of score")

# !!!!
# We can use the density function to create a function that will give us the
# density value for any given x value. This is useful for finding the probability
# of a value falling within a certain range.
tmp.density_fun <- approxfun(tmp.density$x, tmp.density$y)
plot(tmp.density_fun(1:5), type = "l", main = "PDF of score")


browseURL("Lesson2_2_ggplot2.R")

## Now if we have time
## CENTRAL LIMIT THEOREM EXAMPLE
# https://www.analyticsvidhya.com/blog/2019/05/statistics-101-introduction-central-limit-theorem/
data<-read.csv("Clt-data.csv")
dim(data)
head(data,3)

# Calculate the population mean
mean(data$Wall.Thickness)

# Plot all the observations in the data
hist(data$Wall.Thickness,col = "pink",main = "Histogram for Wall Thickness",xlab = "wall thickness")
abline(v=12.8,col="red",lty=1)

# We will take sample size=10, samples=9000
# Calculate the arithmetic mean and plot the mean of sample 9000 times
# draw sufficient samples of size 10, calculate their means, and plot them in R. 
# We know that the minimum sample size taken should be 30 but let’s just see what happens when we draw 10

s10 <- c()

n = 9000

for (i in 1:n) {
    s10[i] = mean(sample(data$Wall.Thickness,10, replace = TRUE)) }
hist(s10, col ="lightgreen", main="Sample size =10",xlab = "wall thickness")
abline(v = mean(s10), col = "Red")
abline(v = 12.8, col = "blue")

# Now lets increase the sample size from 10 to 30, 50 and 500:
s30 <- c()
s50 <- c()
s500 <- c()

n = 9000

for ( i in 1:n){
    s30[i] = mean(sample(data$Wall.Thickness,30, replace = TRUE))
    s50[i] = mean(sample(data$Wall.Thickness,50, replace = TRUE))
    s500[i] = mean(sample(data$Wall.Thickness,500, replace = TRUE))
}
par(mfrow=c(1,3))
hist(s30, col ="lightblue",main="Sample size=30",xlab ="wall thickness")
abline(v = mean(s30), col = "red")

hist(s50, col ="lightgreen", main="Sample size=50",xlab ="wall thickness")
abline(v = mean(s50), col = "red")

hist(s500, col ="orange",main="Sample size=500",xlab ="wall thickness")
abline(v = mean(s500), col = "red")
par(mfrow=c(1,1))

