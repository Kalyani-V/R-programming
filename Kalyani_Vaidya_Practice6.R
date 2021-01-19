##
## Practice Exercise 5
## Name: Kalyani Vaidya
## Date Time
##

# Use the appropriate lubridate function to parse each of the following dates:

library (lubridate)
 d1 <- "January 1, 2010"
 mdy(d1)
 
 d2 <- "2015-Mar-07"
 ymd(d2)
 
 d3 <- "06-Jun-2017"
 dmy(d3)
 
 d4 <- c("August 19 (2015)", "July 1 (2015)")
 mdy(d4)
 
 d5 <- "12/30/14"
 mdy(d5)
 
# You need to run the following code first before doing the exercise:

library(tidyverse)
library(nycflights13)
flights<- nycflights13::flights
 
 make_datetime_100 <- function(year, month, day, time) {
   make_datetime(year, month, day, time %/% 100, time %% 100)
 }
 flights_dt <- flights %>% filter(!is.na(dep_time),!is.na(arr_time)) %>%
   mutate(
     dep_time = make_datetime_100(year, month, day, dep_time),
     arr_time = make_datetime_100(year, month, day, arr_time),
     sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
     sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
   ) %>%
   select(origin, dest, ends_with("delay"), ends_with("time"))
 
flights_dt
 
#Calculat average departure delay time and the average arrival delay time for each week day.
#  Use an appropriate function to extract day of the week from the sched_dep_time. Then group
# group the flights_dt by day of the week.
 flights_avg_dtime<-flights_dt %>% mutate(dow=wday(sched_dep_time))%>%group_by(dow)
 flights_avg_dtime
 
#  Calculat average departure delay time (dep_delay) and the average arrival delay time (arr_delay)
# for each week day.
flights_avg_da_time<-flights_dt %>% summarise(mean_dep_delay = mean(dep_delay, na.rm = TRUE),mean_arr_delay = mean(arr_delay, na.rm = TRUE))
 
#   Write a function that given your birthday (as a date), returns how old you are in years.
age <- function(bday) { (bday %--% today()) %/% years(1) }
age(ymd("1990-10-17"))


 