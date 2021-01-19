##
## Practice Exercise 3A
## Name: Kalyani Vaidya
## Data Import
##

library(tidyverse)
#We will use problem_data.txt data for the practice problems. Please make sure to download this
#file to your local drive first. "problem data.txt"is a tab delimited file. You can use either read_delim
#function or read_tsv function to read in the data. If you are using read_delim function, you need
#to specify the delim argument to \t
read_delim("D:/UCSD Study/R/R Assignment/problem_data.txt",delim = "\t" )

# Read in the first 5 rows of data by using the n_max argument
read_tsv("D:/UCSD Study/R/R Assignment/problem_data.txt",n_max =5 )

# The first two lines are comments. Add the comment argument to read the first 5 rows.
read_delim("D:/UCSD Study/R/R Assignment/problem_data.txt", delim ="\t",n_max = 5, comment="#")

# You can also use the skip argument to skip the first two rows.
read_delim("D:/UCSD Study/R/R Assignment/problem_data.txt", delim ="\t",n_max = 5, skip=2)

# problem_data.txt data has no column names. Set the col_names argument to FALSE when
#you read the first 5 rows.
read_delim("D:/UCSD Study/R/R Assignment/problem_data.txt", delim ="\t",n_max = 5, skip=2,col_names=F)

# You can also use the col_names option to add variables names. For example, add variable
#names A and B when you read in the first 5 rows.
read_delim("D:/UCSD Study/R/R Assignment/problem_data.txt", delim ="\t",n_max = 5, skip=2,col_names=c("A","B"))

#The next few steps are read in the entire data.
# Read in the entire data by removing the n_max argument. Assign variable names A and B.
read_delim("D:/UCSD Study/R/R Assignment/problem_data.txt", delim ="\t",col_names=c("A","B"))

#Name the data dat1. Once you read in the data, check the first six and the last six rows of
#the data. Check the number of missing values in each variable.
dat1<-read_delim("D:/UCSD Study/R/R Assignment/problem_data.txt", delim ="\t",col_names=c("A","B"))
head(dat1)
tail(dat1)
dat1 %>% summarize_all(funs(sum(is.na(.))))

# In problem_data.txt data, A is actually logical type and B is character type. The first column
#is read as character because letters A and B are mixed with T and F. The second column is
#read as integer is because there are 10 integers with 990 missing values in the first 1000 rows.
#Set the guess_max option to 1001 and re-read the data. Check the number of missing values
#in each variable.
dat1 <- read_tsv("D:/UCSD Study/R/R Assignment/problem_data.txt", skip = 2, col_names = c("A", "B"), guess_max=1001)
dat1 %>% summarize_all(funs(sum(is.na(.))))

# Use the col_types option to re-read the data. Check the number of missing values in each
#variable.
dat1 <- read_tsv("D:/UCSD Study/R/R Assignment/problem_data.txt", skip = 2, col_names = c("A", "B"),col_types = cols(A = col_logical(),B = col_character()))
dat1 %>% summarize_all(funs(sum(is.na(.))))

# Use the problems function to identify the problems in dat1.
problems(dat1)
