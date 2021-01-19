##
## Practice Exercise 1B
## Name: Kalyani Vaidya
## Vector
##


foo1 <- c(1, pi, sqrt(2))
print(foo1)

# Use appropriate functions to find out the type and length of foo1.
print(typeof(foo1))
print(length(foo1))

#Use the function in tidyverse package to test whether foo1 is double.
library (tidyverse)

is_double(foo1)

# What function is to test whether foo1 is double with length equaling to 1.
is_scalar_double(foo1)

# Use an appropriate operator or function to check whether each element in foo1 is also an
#element in c(pi, 2)
c(pi,2) %in% foo1

# Use the near function to check if??? foo1 is close to c(1, 3.14, 1.414).
near(foo1,c(1, 3.14, 1.414))

# Set the tol argument to 0.01 and 0.001 in the near function and re-check if foo1 is close to
# c(1, 3.14, 1.414).
# tol=tolerance of comparison

near(foo1,c(1, 3.14, 1.414),tol=0.01)

near(foo1,c(1, 3.14, 1.414),tol=0.001)

set.seed(91786)
foo2 <- c(sample(5, 10, replace = T), NA, sample(-10:10, 10, replace = T), rep(NA, 5))

names(foo2)<-letters
print(foo2)

foo2<-set_names(foo2,letters)
print(foo2)

# Create a user-defined attribute for foo2, named "note", with the value "This is foo2".
print(attr(foo2,"note")<-"This is foo2")

# Use an appropriate function to find out all the attributes of foo2.
attributes(foo2)
# What is the data type of foo2's attributes?
typeof(foo2)
# How extract the note attributes from foo2?
attributes(foo2)$"note"

#  Use the same vector foo2:
# Write a command to find out the number of missing values in foo2.
sum(is.na(foo2))

# Write a command to find out the number of elements in foo2 that is greater than the mean of foo2
sum(foo2>mean(foo2,na.rm=T),na.rm=T)
#na.rm= Should the missing values be included or not? True or False


# Use the same vector foo2:
# Write a command to extract the non-missing elements from foo2.
foo2[!is.na(foo2)]

# Write a command to extract the elements that are greater than 0.
foo2[!is.na(foo2) & foo2>0]

# Write a command to extract the elements in foo2 that are greater than the mean of foo2.
foo2[which(foo2 >mean(foo2,na.rm=T))]
#which - gives the TRUE indices of logical object,allowing for array indices

# Create a list, named list1, by using the following three components:
# A numeric vector, named A, contains values 1 to 10
list1<-list(A=1:10)
print(list1)


# A character vector, named B, contains letters A to D
list1<-list(A=1:10,B=LETTERS[1:4])
print(list1)

# A list, named C, contains the following:
#   A factor, named C1, with values "X" and "Y"
list1<-list(A=1:10,B=LETTERS[1:4],C1=factor(c("X","Y")))
print(list1)

# A numeric vector, named C2, with one single value pi
list1<-list(A=1:10,B=LETTERS[1:4],C1=factor(c("X","Y")),C2=pi)
print(list1)

# Display list1 in a compact form:
str(list1)  

#Access the components of list1:
# Write an R command to access the first and the third components of list1.
list1[c(1,3)]

# Write an R command to access the C1 component, which is the first component of C component.
# Make sure the returned result is a factor.
list1$C1

