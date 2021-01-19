##
## Practice Exercise 5
## Name: Kalyani Vaidya
## Strings
##
 library (tidyverse)
# Extract the middle character from the following string
x <- c("a", "abc", "abcd", "abcde", "abcdef")
# Use the str_length() to find out the number of characters in a string.
len<-str_length(x)
len

# Based on the result from the previous step, find out the center location. If the string has an
#even number of characters, use the ceiling() function to returns the "ceiling" of the result.
#The method also works for length one
ceil<-ceiling(len/2)


# Use the str_sub() function to extract the middle character.
str_sub(x,ceil,ceil)

#What patterns will the regular expression \..\..\.. match?
# How to write \..\..\.. as a string? Use to writeLines() function to verify.
#\..\..\..
writeLines("\\..\\..\\..")

# Use the \..\..\.. to match the following pattern. Use the str_view function to verify.
#[1] ".a.b.c" ".a.b" "....."
library (htmlwidgets)

str_view(c(".a.b.c",".a.b","....."),c("\\..\\..\\.."),match=TRUE)


#Create the following regular expression. Match them in stringr::words string and use the str_view
#function to verify.
head(words)
#[1] "a" "able" "about" "absolute" "accept" "account"
# create regular expressions that find all words that start with y.
str_view(stringr::words,"^y",match=TRUE)

# create regular expressions that find all words that end with x.
str_view(stringr::words,"t$",match=TRUE)

# create regular expressions that find all words that are exactly three letters long.
str_view(stringr::words,"^...$",match=TRUE)

# create regular expressions that find all words that have seven letters or more.
str_view(stringr::words,"^.......",match=TRUE)


#Create the following regular expression. Match them in stringr::words string and use the str_view
#function to verify.
# create regular expressions that find all words that start with a vowel.
str_view(stringr::words,"^[aeiou]",match=TRUE)

# create regular expressions that find all words that only contain consonants (or not-vowels).
str_view(stringr::words,"^[^aeiou]",match=TRUE)

# create regular expressions that find all words that ends with ed, but not with eed.
str_view(stringr::words,"ed$[^e]ed$",match=TRUE)
# create regular expressions that find all words that end with ing or ise.
str_view(stringr::words,"i(ng,se)$",match=TRUE)


#Create the following regular expression. Match them in stringr::words string and use the str_view
#function to verify.
# create regular expressions that find all words that start with three consonants.
str_view(stringr::words,"^[^aeiou]{3}",match=TRUE)

# create regular expressions that find all words that have three or more vowels in a row.
str_view(stringr::words,"[aeiou]{3,}",match=TRUE)

# create regular expressions that find all words that have two or more vowel-consonant pairs in
#a row.
str_view(stringr::words,"[aeiou][^aeiou]{2,}",match=TRUE)

# Use the str_detect() to extract the following pattern in stringr::words:
#   Find all words that start or end with x.
words[str_detect(stringr::words,"^x|x$")]
# Find all words that start with a vowel and end with a consonant.
head(str_subset(stringr::words,"^[aeiou].*[^aeiou]$"))

# What word has the higher number and the highest proportion of vowels?
  # What word has the higher number of vowels in stringr::words? Hint: Count the number of
#vowels in each word first by using the str_count function.
vowels<-str_count(stringr::words,"[aeiou]")
words[which(vowels==max(vowels))]

# What word has the highest proportion of vowels in stringr::words? Once you count the
#number of vowels in each word, you can divide them by the word length (str_length)
p_vowels<-str_count(stringr::words,"[aeiou]")/str_length(words)
words[which(p_vowels==max(p_vowels))]

#Use the harvard sentences data to extract all words ending in ing.
head(sentences)
#[1] "The birch canoe slid on the smooth planks."
#[2] "Glue the sheet to the dark blue background."
#[3] "It's easy to tell the depth of a well."
#[4] "These days a chicken leg is a rare dish."
#[5] "Rice is often served in round bowls."
#[6] "The juice of lemons makes fine punch."

# Create a regular expression that matches all words ending in ing. You can use \b anchor to
#match beginning and end of a word in a string.
#str_match(sentences,"\\b[A-za-z]+ing\\b")
pattern <- "\\b[A-Za-z]+ing\\b"
pattern

# Create a logical vector by using the str_detect() function to identify the sentences ending in ing.
sentences_with_logical <- str_detect(sentences, pattern)

# Select the sentences that contain words ending in ing.
sentences_with_ing <- sentences[sentences_with_logical ]

# Use the str_extract_all() function to extract all words from the selected sentences above.
words_ing_list <- str_extract_all(sentences_with_ing, pattern)

# The result above is a list and contains duplicated words ending in ing, you can use the unlist()
# and unique() functions to simplify the result.
unique(unlist(words_ing_list)) %>% head()

