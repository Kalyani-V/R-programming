##
## Practice Exercise 7
## Name: Kalyani Vaidya
## Function
##


#Consider the following function from the lecture:
rescale01 <- function(x) {
     rng <- range(x, na.rm = TRUE, finite = TRUE)
     (x - rng[1]) / (rng[2] - rng[1])
     }
 rescale01(c(Inf, -Inf, 0:5, NA))
# Modify this function so that -Inf is mapped to 0, and Inf is mapped to 1. For example:
#rescale01(c(Inf, -Inf, 0:5, NA))
#  [1] 1.0 0.0 0.0 0.2 0.4 0.6 0.8 1.0 NA
 
 rescale01 <- function(x) {
   rng <- range(x, na.rm = TRUE, finite = TRUE)
   y<-(x - rng[2]) / (rng[1] - rng[2])
  y[y==-Inf]<-0
  y[y==Inf]<-1
  y
 }
 
# Create functions that take a vector as input and returns the last value. For example:
#   > last_value(numeric()) ## For the case with no length
# numeric(0)
# > last_value(1)
# [1] 1
# > last_value(1:10)
# [1] 10
 
last_value<-function(x){
  #check for case with no length
  if (length(x))
  {
    x[[length(x)]]
  }
  else
  {
    x
  }
  
}

last_value(1)
last_value(1:10)


# Create functions that take a vector as input and returns the elements at even numbered positions.
# For example:
#   > even_indices(numeric())
# numeric(0)
# > even_indices(1)
# numeric(0)
# > even_indices(1:10)
# [1] 2 4 6 8 10
# > even_indices(letters)
# [1] "b" "d" "f" "h" "j" "l" "n" "p" "r" "t" "v" "x" "z"


even_indices<-function(x){
  if (length(x))
  {
    x[seq_along(x)%%2==0]
  }
  else
  {
    x
  }
}
even_indices(1)
even_indices(1:10)
even_indices(letters)

#Create functions that take a vector as input and returns every element except the last value. For
#example:
#  > not_last(1:3)
#[1] 1 2
#> not_last(1)
#numeric(0)
#> not_last(numeric())
#numeric(0)

not_last<-function(x)
{
  if(length(x))
  {
    x[seq_along(x)-1]
  }
  else
  {
    x
  }
}
not_last(1:3)
not_last(1) 
not_last(numeric())

# OR

not_last <- function(x) {
  n <- length(x)
  if (n) 
  {
    x[-n]
  } 
  else 
  {
      x
  }
}

not_last(1:3)
not_last(1) 
not_last(numeric())


# Write a greeting function that says "good morning", "good afternoon", or "good evening", depending
# on the time of day. (Hint: use a time argument that defaults to lubridate::now(). That will make
# it easier to test your function.) For example:
#   > greet()
# [1] "good morning"
# > greet(ymd_h("2017-01-08:05"))
# [1] "good morning"
# > greet(ymd_h("2017-01-08:13"))
# [1] "good afternoon"
# > greet(ymd_h("2017-01-08:20"))
# [1] "good evening"

library(lubridate)

greet <- function(time=now)
{
  hr<-hour(time)
  if(hr<12)
  {
    print("Good Morning")
  }
  else if(hr<17)
  {
    print("Good Afternoon")
  }
  else
  {
    print("Good Evening")
  }
}

greet(now())
greet(ymd_h("2017-01-08:05"))
greet(ymd_h("2017-01-08:13"))
greet(ymd_h("2017-01-08:20"))

# Write for-loops to compute the mean of every column in mtcars.
output <- vector("double", ncol(mtcars))
names(output) <- names(mtcars)
for (i in names(mtcars))
  {
    output[i] <- mean(mtcars[[i]])
  }
output

# Write for-loops to compute the number of unique values in each column of the iris dataset.
 head(iris)
uniq_iris<-vector("double",ncol(iris))
names(uniq_iris)<-names(iris)
for (i in names(iris))
{
  uniq_iris[i] <- length(unique(iris[[i]]))
}
uniq_iris


#Write a function that prints the mean of each numeric column in a data frame, along with its name.
#For example, show_mean(iris) would print:

library(stringr)
show_mean <- function(df, digits = 2) 
{
  maxstr <- max(str_length(names(df)))
    for (nm in names(df)) 
      {
       if (is.numeric(df[[nm]])) 
         {
          cat(str_c(str_pad(str_c(nm, ":"), maxstr + 1L, side = "right"),
                   format(mean(df[[nm]]), digits = digits, nsmall = digits),
                   sep = " "),"\n")
         }
       }
}

show_mean(iris)

 
  