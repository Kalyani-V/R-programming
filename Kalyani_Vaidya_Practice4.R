##
## Practice Exercise 4
## Name: Kalyani Vaidya
## Relational Data
##


library(tidyverse)

#Read in both data, and check the number of records in both data
geocode<-read_delim("D:/UCSD Study/R/R Assignment/geocode.txt",delim="\t")
geocode
count(geocode)
nrow(geocode)
households<-read_delim("D:/UCSD Study/R/R Assignment/households.txt",delim="\t")
count(households)
nrow(households)

#Create a data set named geocode1 based on the geocode data. The geocode1 data will contain
#two variables: id (the last 2-digit geography code from GEOID variable), and state variable.
#The id variable needs to be numeric or integer type.

geocode1<-geocode%>% mutate(id=as.integer(str_sub(geoid,-2,-1)))%>%select(id,state)
geocode1

#OR

geocode_temp <-geocode %>% separate(geoid, into = c("other", "id"), sep=7, convert = T) %>% select(-other)
head(geocode_temp)


# Use the setdiff function to check which element(s) in geoid variable in households are not
#in id variable in geocode1.
setdiff(households$geoid,geocode1$id)

# Create a data set by selecting row(s) from households that do not have matched geoid in the
#geocode1.
geocode2<-anti_join(households,geocode1,by=c("geoid"="id")) 
geocode2

# Create a data set by excluding row(s) from households that do not have matched geoid in
#the geocode1.
geocode3<-semi_join(households,geocode1,by=c("geoid"="id"))
geocode3
# Merge households and geocode1 by geoid, and only keep the rows with common geoid
inner_join(households,geocode1,by=c("geoid"="id"))



library(babynames)
head(babynames)

#Use appropriate functions to identify the keys in babynames data set from the babynames package.
#Make sure to download the babynames package first.
babynames %>% count(year,sex,name,n) %>% filter(n>1)%>%nrow

# Add the location of the origin (the origin variable) and destination (the dest variable) to flights
#from the nycflights13 package. The location information are stored in lat and lon variables in
#the airports data.
library (nycflights13)
head(flights)
head(airports)

# Create a data set named airport_locations by keeping only faa, lat, and lon variables in
#airports. Create a data set named flights_sml by keeping only year, month, day, hour,
#origin, and dest variables
airport_locations<-select(airports,faa,lat,lon)
airport_locations
flights_sml<-select(flights,year, month, day, hour,origin,dest)
flights_sml
 
# Create a data set named flights_origin by adding the location (lat and lon variables
#  from airport_locations) of the origin in the flights_sml data. Note: use origin and faa
#variables to match.
flights_origin<-flights_sml%>%left_join(airport_locations,c("origin"="faa"))


# Add the location of the destination in the flights_origin data. This time, you need to
#use dest and faa variables to match. Since you are adding lat and lon variables again and
#these two variables are existed in the flights_origin, dplyr will distinguish the duplicated
#variables by adding ".x", and ".y".
flights_origin%>%left_join(airport_locations,c("dest"="faa"))


# To override the default suffixes, you can specify your own suffixes by using the suffix argument.
#For example, add suffix = c("_origin", "_dest") to the left_join function and compare
#the result with the one without using the suffix argument.
flights_origin %>% left_join(airport_locations, by = c("dest" = "faa"),suffix = c("_origin", "_dest"))
