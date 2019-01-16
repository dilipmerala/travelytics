listings.df <- read.csv("listings.csv")
View(listings.df)
str(listings.df)

library(tidyverse)
library(forecast)
library(leaps)

### Use first 1000 rows of data
listings.df <- listings.df[1:1000, ]

### Select variables for regression
selected.var <- c(listings.df$price, listings.df$cleaning, listings.df$city, listings.df$state, listings.df$neighbourhood)

### Partitioning Data
set.seed(1)  # set seed for reproducing the partition
train.index <- sample(c(1:1000), 600)  
train.df <- listings.df[train.index, selected.var]
valid.df <- listings.df[-train.index, selected.var]

### Run regression
listings.lm <- lm(price ~ ., data = train.df)

options(scipen = 999)
summary(car.lm)