##
## Practice Exercise 3B
## Name: Kalyani Vaidya
## Tidy Data
##

library(tidyverse)
table2


#Now, you need to insert an additional rows by including rate value (divide cases by population, and multiply by 10000). The result looks like the following:
# Create a data set, named t2_cases, by only keeping rows with "cases" (Hint: use the filter function). Then rename the count variable to cases. And sort the data by country and year.
t2_cases<- filter(table2,type == "cases") %>% rename(cases = count) %>% arrange(country,year)
t2_cases

# Create a data set, named t2_population, by only keeping rows with "population". Then rename the count variable to population. And sort the data by country and year.
t2_population<-filter(table2,type=="population")%>%rename(population=count)%>%arrange(country,year)
t2_population

# Create a data set, named t2_rate, with the variable country, year, count (divide cases by population, and multiply by 10000), and count (with values "rate").
t2_rate <- tibble(country = t2_cases$country,year = t2_cases$year,count = (t2_cases$cases / t2_population$population) * 10000,type = "rate")
t2_rate
# Create a data set, named table2_rate, by combining table2 with t2_rate by using the bind_rows function. Arrange the data by country, year, type, and count.
table2_rate<-bind_rows(table2,t2_rate)%>%arrange(country, year, type,count)
table2_rate

# How to convert table2_rate to a tidy data?
table2_rate%>%spread(key=type,value=count)


people <- tribble(
  ~name, ~key, ~value,
  #-----------------|--------|------
  "Phillip Woods", "age", 45,
  "Phillip Woods", "height", 186,
  "Phillip Woods", "age", 50,
  "Jessica Cordero", "age", 37,
  "Jessica Cordero", "height", 156
)

people

# We can add a new column with a distinct observation count for each combination of name and
#key. Group the people data by name and key variable by using the group_by function. Then
#create a new variable obs that contains the row numbers within each group. Store the result
#to people2.

people2<-people%>%group_by(name,key)%>%mutate(obs=row_number())
people2

# Now you can spread the people2 data.
spread(people2, key = key, value = value)

preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes", NA, 10,
  "no", 20, 12
)

preg

#Tidy the following tibble by using the gather function.
preg1<-gather(preg,male,female,key=gender,value=count)
preg1


# Set the na.rm argument to TRUE and compare the result with the one above
preg2<-gather(preg,male,female,key=gender,value=count,na.rm=TRUE)
preg2

#tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% separate(x, c("one", "two", "three"))

# Set the extra argument to drop or merge and compare the result with the one above

tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% separate(x, c("one", "two", "three"),extra="drop" )
tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% separate(x, c("one", "two", "three"),extra ="merge" )


#tibble(x = c("a,b,c", "d,e", "f,g,i")) %>% separate(x, c("one", "two", "three"))

# Set the fill argument to right or left and compare the result with the one above.
tibble(x = c("a,b,c", "d,e", "f,g,i")) %>% separate(x, c("one", "two", "three"),fill="right")
tibble(x = c("a,b,c", "d,e", "f,g,i")) %>% separate(x, c("one", "two", "three"),fill="left")

  
  