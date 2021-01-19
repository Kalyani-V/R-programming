##
## Practice Exercise 2
## Name: Kalyani Vaidya
## Data Transformation
##

load("D:/UCSD Study/R/R Assignment/Practice2.RData")
library(tidyverse)
library(purrr)
library(magrittr)
painters_tb

# Select observations with Colour >=17 and School equals "D".
filter(painters_tb,Colour >=17,School=="D")

# Select observations that contains only Da Udine and Barocci from artist variable.
filter(painters_tb,artist %in% c("Da Udine","Barocci"))

# Randomly select 5 rows from painters_tb.
sample_n(painters_tb,5)

# Randomly select 5% of rows from painters_tb.
sample_n(painters_tb,0.05)
nrow(painters_tb)*0.05

# Select varibles between artist and Drawing.
select(painters_tb,artist:Drawing)

# Select observations with Colour >=17 and School equals "D", and exclude variables between
#artist and Drawing.
painters_tb %>% filter(Colour >=17,School=="D")%>%select(-(artist:Drawing))

# Reorder the variables by placing School after artist, then place the rest of the variables in
#the end.
select(painters_tb,School,artist,everything())

# Create a variable Composition_log by taking the log of Composition variable
Composition_log<-mutate(painters_tb,log(Composition))
print(Composition_log)

#Create variable Composition_10, Drawing_10 by multiplying Composition and Drawing variables by 10. Only keep Composition_log, Drawing_log in the result.
lg<-transmute_at(painters_tb, vars(Composition,Drawing),funs(.*10))
ptb<-mutate(lg,Composition_log=log(Composition),Drawing_log=log(Drawing))
select(ptb,Composition_log,Drawing_log)

# We can use the following command to check whether each column of painters_tb is integer
#vector
sapply(painters_tb, is_integer)

#Adding 1 to the values of each integer vector and then take the log (e.g. log(x+1)). Only keep
#the newly created variables in the result.
transmute_if(painters_tb,sapply(painters_tb, is_integer),funs(log(.+1)))

# Create a categorical variable Comp_cat with three approximate equal levels based on Composition.
# First, find the cutting points, including minmum, first quartile, third quartile, and maximum values. Hint: use the School function.
lvl<-painters_tb%$% quantile(Composition,seq(0,1,by=1/3))
print(lvl)

# Use the cut function to create the variable Comp_cat and label each level with names I,II, and III.
painters_tb %>% mutate(Comp_cat=cut(Composition,lvl,labels=c("I","II","III"),include.lowest=T,right=F))

# Use summarize function to calculate the minimum and maximum values of Composition and Drawing variables.
painters_tb%>%summarise(Comp_min=min(Composition),Comp_max=max(Composition),Draw_min=min(Drawing),Draw_max=max(Drawing))

#OR

summarize_at(painters_tb, vars(Composition, Drawing), funs(min, max))

# Calculate the minimum and maximum values of Composition and Drawing variables for each level of School variable.
painters_tb %>% group_by(School) %>% summarize_at(vars(Composition, Drawing), funs(min, max))




quine_tb

#Sort Eth in ascending order, Days in descending order
arrange(quine_tb,Eth,desc(Days))

#Sort Eth in ascending order, Sex in desending order, and Days in descending order
arrange(quine_tb,Eth,desc(Sex),desc(Days))

#Remove duplicated observations from quine_tb data.
distinct(quine_tb)

#Remove rows with duplicated Eth, Sex, and Age variables
distinct(quine_tb,Eth,Sex,Age)

#How many unique levels among Eth, Sex, Age variables?
count(distinct(quine_tb,Eth,Sex,Age))

#Use the summarize function to calculate the mean and median value of Days variable.
summarise(quine_tb,mean(Days),median(Days))

#Use two methods to count the number of observations in each level of the Age variable
count(quine_tb,Age)
 #OR

quine_tb %>% group_by(Age) %>% summarize(n=n())




