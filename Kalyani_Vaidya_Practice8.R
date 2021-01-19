##
## Practice Exercise 8
## Name: Kalyani Vaidya
## Functional Programming
##

# Consider the following function from the lecture:
   col_summary <- function(df, fun)
    {
     out <- vector("double", length(df))
     for (i in seq_along(df)) 
       {
        out[i] <- fun(df[[i]])
      }
     out
   }
   
#   Modify this function so that it only applies to numeric columns. Hint: You might want to start
#   with an is.numeric() function that returns a logical vector that has a TRUE corresponding to
#   each numeric column. Use the iris data set to test your modified function. For example:
     head(iris)
     
     col_summary <- function(df, fun)
     {
       out <- vector("double", length(df))
       for (i in seq_along(df)) 
       {
         out[i] <- fun(df[[i]])
       }
       out
     }
     
     col_summary(iris,is.numeric)
     
# Use one of the map functions to:
# Compute the mean of every column in mtcars.
     mtcars_summary<-function(df,fun)
     {
       out<-vector("double",length(df))
       for(i in seq_along(df))
       {
         out[i]<-fun(df[[i]])
       }
       out
     }
     mtcars_summary(iris,mean)
# Determine the type of each column in nycflights13::flights.
     map_chr(nycflights13::flights,typeof)
     
# Compute the number of unique values in each column of iris.
  map_int(iris,function(x) unique(length(x)))
  
  
# Generate 10 random normals for each of means = -10, 0, 10, 100.
  map(c(-10,0,10,100),~ rnorm(n=10,mean=.))
  
  
#  Extract the p-values from ANOVA tables. We will use the painters data from the MASS library
#  for this problem.
#  To compare Composition across different School, we can run the following code:
    
library(MASS)
head(painters)
lm(Composition~School, data=painters)


#  The result from the anova function generates a data frame.
 anova(lm(Composition~School, data=painters)) %>% str
 
#  To extract the p-value, we can do the following:
 anova(lm(Composition~School, data=painters))$`Pr(>F)`
 
# Now, Compare Composition, Drawing, Colour, and Expression across different School simultaneously and extract the p-values from these four comparisons.
# Run four regression by using Composition, Drawing, Colour, and Expression as the outcome
# and School as the X variable.
 map(painters[1:4],function(x) lm(x~School,data=painters))

# Based on the result above, extract the ANOVA tables.
 map(painters[1:4], ~lm(.~School, data=painters)) %>% map(anova)
 
# Extract the p-values from the ANOVA tables.
 map(painters[1:4], ~lm(.~School, data=painters)) %>% map(anova) %>% map(~ .$`Pr(>F)`) %>% map_dbl(1)

#  The following data contains a list of data frame:
   foo = list(
     a = data.frame(x=c(3,1), y=c(2,7)),
     b = data.frame(x=c(4,1), y=c(7,5)),
     c = data.frame(x=c(1,1), y=c(1,1)),
     d = data.frame(x=c(3,2), y=c(2,1)),
     e = data.frame(x=c(1,2), y=c(3,5))
   )
# Use the t.test function to compare x and y variable for each data. For example:
   t.test(foo[[1]])
   
#   You can also extract the p-value from the t-test result. For example:
     t.test(foo[[1]])$p.value
     
#   Since one of the data has problem, you will encounter errors when you perform the t-tests for element
#   of the list simultaneously. Use the map and the safely function to extract the p-values for the data
#   that does not have the problems.
#    Mapping over multiple arguments:
     
#  Consider the following lists:
    x <- list(a = 3, b = 4, c = 5)
    y <- list(a = 10, b = 14, c = 25)
    z <- list(a = 7, b = 8, c = 2)
# Use one of the map functions to add corresponding components between x and y. Make sure the results is a double vector.
    map2_dbl(x, y, `+`)
    
#  Use one of the map functions to add corresponding components across x, y, and z. Make sure the results is a double vector.
    pmap_dbl(list(x, y, z), sum)
    
#  Use one of the map functions to calculate a2 +b2 +c2 across x, y, and z . Make sure the results is a double vector.
    pmap_dbl(list(x, y, z), function(x, y, z) x^2+y^2+z^2)
    
# The gsub function can be used to replace a specific letter from a string with a new letter. For example, we can replace p in apple with x in the following code:
    gsub("apple", pattern = "p", replacement = "x")

#    Consider the following data:
      df <- data.frame(
        x = c("apple", "banana", "cherry"),
        pattern = c("p", "n", "h"),
        replacement = c("x", "f", "q")
      )
#    Use one of the map functions to replace p in apple with x, replace n in banana with f, and replace h in cherry with q
    pmap(df, gsub)
#    OR
    pmap_chr(df, gsub)
     