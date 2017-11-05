rm(list=ls())
library("lubridate")

##inputs
principle <- 250000
deposit_date <- as.Date("2014-11-21")
maturity_date <- as.Date("2023-03-31")
interest_rate <- 8.5


month_start <- deposit_date-day(deposit_date)+1
quarter_start <- month_start %m+% months(month(month_start)%%3)

quarter_ends <- seq(quarter_start,maturity_date,by="quarter")-1

I <- interest_rate/100
P <- principle

quarter_days <- c(deposit_date,quarter_ends,maturity_date)

for(i in 1:(length(quarter_days)-1))
  P <- P*(1+I*as.numeric(diff(quarter_days))[i]/(366-ceiling((year(quarter_days[i])%%4)/4)))


