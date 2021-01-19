##
## Practice Exercise 1C
## Name: Kalyani Vaidya
## Pipes
##


library(magrittr)
library(purrr)
library(tidyverse)

#Change the following R command by using the pipe operator(s).
duplicated(c(1,3,1,2,2))
print("Command changed using pipe operator")
c(1,3,1,2,2) %>% duplicated

#Change the following R command by using the pipe operator(s).
t.test(1:10, 7:20)
print("Command changed using pipe operator")
1:10%>%t.test(7:20)

#Change the following R command by using the pipe operator(s).
str(t.test(1:10, 7:20, conf.level = 0.99))
print("Command changed using pipe operator")
1:10 %>% t.test(7:20, conf.level = 0.99) %>% str

# Change the following R commands by using the pipe operator(s).
 t_test_result <- t.test(1:10, 7:20, conf.level = 0.99)
 paste0("The p-value is: ", t_test_result$p.value)
print("Command changed using pipe operator")
 1:10 %>% t.test(7:20, conf.level = 0.99) %$% paste0("The p-value is: ", p.value)
 
 #Change the following R command by using the pipe operator(s).
identical(sum(c(5, NA, 2, 4), na.rm = T), 10)
print("Command changed using pipe operator")
c(5, NA, 2, 4) %>% sum(na.rm = T) %>% identical(11)

# Change the following R commands by using the pipe operator(s).
 library(MASS)
 qt = quantile(painters$Colour, c(0, 0.25, 0.5, 0.75, 1))
 colour_4seg <- cut(painters$Colour, qt, labels= c("first", "second", "third","fourth"), include.lowest = T)
 table(colour_4seg, painters$School)
 
  painters %$% quantile(Colour, c(0, 0.25, 0.5, 0.75, 1)) %>% {cut(painters$Colour, . , labels= c("first", "second", "third","fourth"), include.lowest = T)} %>% table(painters$School)
 

