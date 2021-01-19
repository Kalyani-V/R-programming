##
## Practice Exercise
## Name: Kalyani Vaidya
## Final Assignment
##

#Problems 1

library(tidyverse)
models <- mtcars %>% split(.$cyl) %>% map(function(df) lm(mpg ~ wt, data = df))
models


# Based on the result above, extracts the coefficients of each model by using a series of map functions. Here's
# the expected result:

models%>%map(coef) %>%map_dbl(2)

#Create a function to calculate the skewness of a given vector based on the formula
library(moments)
skewness(c(1, 2, 5, 100))


#Create a function, called miss_count, which counts the number of missing and non-missing values of each
#variable from a given data. The result should be a matrix or a data frame with first columns contains the
#number of missing values, and the second column contains number of non-missing values. You will use
#patient_tib to test this functio

load("D:/UCSD Study/R/R Assignment/patient_tib.RData")
miss_count<-data.frame(
  
  row.names=colnames(patient_tib),
  N_Miss=sapply(patient_tib, function(x) sum(is.na(x))),
  N_non_missing=sapply(patient_tib, function(x) sum(!is.na(x)))
)

miss_count

# For this problem, you need to create a function, called continuous_stats. This function takes only two
# arguments:
#   ... : one or more variable names in dat (the second argument of this function) that you would like to
# compute descriptive statistics
# dat : the name of the data frame
# The function returns a matrix that contains the descriptive statistics, including mean, median, standard
# deviation (SD), number of non missing values (N non missing), and number of missing values (N missing),
# for each of the variable


library(dplyr)
library(tidyverse)
continuous_stats<-function(...,dat)
{
  
  mean_op<-vector()
  median_op<-vector()
  sd_op<-vector()
  Nnonm_op<-vector()
  Nm_op<-vector()
  details<-vector()
  
  
  for(i in list(...))
  {
    data<-list(...)
    mean_output<-sapply(dat[i],mean,na.rm = TRUE)
    median_output<-sapply(dat[i], median, na.rm = TRUE)
    sd_output<-sapply(dat[i], sd, na.rm = TRUE)
    N_non_missing<-sum(!is.na(dat[i]))
    N_missing<-sum(is.na(dat[i]))
    
    names(mean_output)<-NULL
    names(median_output)<-NULL
    names(sd_output)<-NULL
    
    mean_op<-append(mean_op,mean_output)
    median_op<-append(median_op,median_output)
    sd_op<-append(sd_op,sd_output)
    Nnonm_op<-append(Nnonm_op,N_non_missing)
    Nm_op<-append(Nm_op,N_missing)
    
  }
  
  output<-data.frame(
    row.names=c("Mean","Median","SD","N_non_missing","N_missing"),
    details=rbind(rbind(mean_op),rbind(median_op),rbind(sd_op),rbind(Nnonm_op),rbind(Nm_op))
    
  )
  colnames(output)<-data
  print(output)
  
}

#continuous_stats("LDL", dat=patient_tib)

continuous_stats("TGL", "HDL", "LDL", dat=patient_tib)

#continuous_stats("TGL", "LDL", dat=patient_tib)
