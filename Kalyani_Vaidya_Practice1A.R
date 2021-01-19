##
## Practice Exercise 1A
## Name: Kalyani Vaidya
## Tibble
##


library(tidyverse)

#Creating cars dataframe
cars<-data.frame(
  speed=c(4,4,7,7,8,9),
  dist=c(2,10,4,22,16,10)
)
print(cars)

#Creating a tibble
a<-as_tibble(cars)
print(a)

# Create a tibble, a, by using the tibble function with the following two variables:
#     group var: with 5 values of "group1", and 5 values of "group2"
#     values: 1 to 10
#Note: make sure to use group var and values as the variable names.

a<-tibble(
  `group var`= c(rep('group1',5),rep('group1',5)),
  values=1:10
)
print(a)

# Create a tibble by selecting only the first column of a.
first<-a[,1]
print(first)

# Create a data frame, b, by including the same variable group var and values.
b<-data.frame(a)
print(b)
print(class(b))

#Create a data.frame by selecting only the first column of b.

df<-b[,1]
print(df)

#Use the tribble function to create a tibble with the following variables and values:
# var1 var2 var3
# x 2 3
# y 5 6

ab<-tibble(
  var1=c("x","y"),
  var2=c(2,5),
  var3=c(3,6)
)
print(ab)

pq<-tribble(
  ~var1,~var2,~var3,
# -----|-----|-----
    "x",2,3,
    "y",5,6
)
print(pq)

#Use an appropriate function to convert the following named vector into a two-column tibble.
# > c(x = 5, y = 6, z = 7)
# x y z
# 5 6 7

enframe(c(x = 5, y = 6, z = 7))