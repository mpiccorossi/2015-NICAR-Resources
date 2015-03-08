#This is a copy of @AnnieWaldman's materials from the Intro to R sessions that she presented at NICAR 2015 in Atlanta. 
#
#####################################################################################################
#
#                                       ____________________________
#                                      !\_________________________/!\
#                                      !!                         !! \
#                                      !!C:\> GETTING STARTED     !!  \
#                                      !!         WITH R          !!  !
#                                      !!           ie            !!  !
#                                      !!     HOW TO OVERCOME     !!  !
#                                      !!        YOUR FEAR        !!  !
#                                      !!            &            !!  !
#                                      !!     LEARN TO LOVE R     !!  /
#                                      !!_________________________!! /
#                                      !/_________________________\!/
#                                       __\_________________/__/!_  )
#                                       !_______________________!/   )
#                                       |________________________|  (__
#                                       /oooo  oooo  oooo  oooo /!   _  )_
#                                     /ooooooooooooooooooooooo/ /  (_)_(_)
#                                    /ooooooooooooooooooooooo/ /    (o o)
#                                   /o=_____________________/_/    ==\o/==



############# SECTION 1. WELCOME TO R STUDIO #############

##### Understanding What You See #####

#The easiest way to get started in R studio is to understand the four pane set up you see in front of you. 

#Upper left: The Source, where you will find the script you are working on (or reading) and your data
#tables (known as data frames).

#Upper right: 1) Environment, which is your workspace showing all the data you have loaded up, and 
#2) History, which shows what commands you have run. Very important to note that you can and should 
#save your environment and your history from time to time in case R gets overwhelmed and decides 
#to shut down. Or at least save a script so you can recreate your environment.

#Lower left: Console, which is your active command line.

#Lower right: 1) Files (which files are in your working directory), 2) Plots (any graphics you make), 
# 3) Packages (your installed and activated packages), 4) Viewer (to look at web content)
# and 5) Help (your best friend). 

##### How to get help (more resources at the end) ######

#There are two functions you can use to get help (the responses will show up in lower right). 
#We are using the function mean in order to show how (to run commands from script select command + return):

?mean
# or
help(mean)



############# SECTION 2. UNDERSTANDING THE BASIC ELEMENTS OF R #############

##### Understanding the data elements #####

#R has multiple named data structures and elements:

#### Object: most basic element, includes variables, data, functions you make, results, etc, 
# are kept in the active memory of your computer as objects -- you can find them in 
# your workspace ("Environment")

# What does an object look like?
# In R, everything is an object. So whatever you assign to a vector, a data frame, a function, those
# are all objects.

# The best method to get the internal structure of an object is str():
?str
x = c(1,2,3)
y = c("a","b","c")
str(x)
str(y)

#will print out all of your objects.
objects() 
#or
ls() 
rm(x) #This will remove any objects in your workspace.

### The Class: Of course, there are different types of objects in R, and each object has a class.
class(x)
class(y)

# There are many kinds of classes, for example:
# "character"
# "complex"
# "double"
# "expression"
# "integer"
# "list"
# "logical"
# "numeric"
# "single"
# "raw"

### Vector: simplest type of data structure, just an ordered collection of objects.
#assigning a to a set of numbers with function c():
?c
a = c(10,20,30,40,50) 
a
#assigning b to a set of numbers with function c()
b =  c(2,3,6,8,10) 
b

#You can also do basic math with vectors:
c = 2*a + 3 - b
c
#Can also apply some simple mathmatical functions to vectors:
# maximum:
max(c) 

# minimum:
min(c) 

# length of the vector in values:
range(c)

#number of elements:
length(c) 

#sum all the elements:
sum(c) 

#product of all the elements:
prod(c) 

#gives you the average:
mean(c) 

#gives you the median
median(c) 

#sorts the data in increasing order ***more on sorting down below
sort(c) 

# Generating sequences can also be an important part of working with R:
#generates a sequence between 1 and 30:
1:30 

#gives you the same thing:
seq(1:30) 

#also gives you the same thing:
seq(from=1, to=30) 

#can also tell it what the increment should be:
seq(from=1, to=30, by=2) 

#gives you a sequence based on length.:
seq(from=1, by=3, length=30) 

# You can also generate sequences with repeated objects:
# repeating elements 1-5 over and over again.
rep(a, times=4) 

# repeating elements in a row
rep(a, each=6) 

# R is also great for working with logical data (TRUE and FALSE). They are created by conditions (<.<=,>,>=,==).
d = a < 30
d

### Vectors with characters:
# You can build vectors not only with numbers but strings or characters as well using the double or single 
# matched quotes. 

a = c("this","is", "a", "character", "vector", "!")
a

?paste
b = paste(c("this","a", "vector"),c("is","character","!"), sep=" ")
b

#Vectors are "atomic" structures, meaning that they all have the same mode or type (numeric, complex,
#logical, character, etc...). The only exception is NA. 
x = c(T, F, "hello", 2)
str(x)

y = c(T,F,F,T,T)
str(y)

z = c(1,2,3,4,5)
str(z)

w = c(1i,2,3,4,5)
str(w)

###Other data structures:
#Matrices or Arrays: multi-dimensional vectors.
?matrix
matrix(c(1, 2, 3, 4, 5), nrow=3, ncol=5) 
tamatrix(c(1, 2, 3, 4, 5), nrow=5, ncol=3) 

#Factors: this should be used for categorical data.
factor(1:20, labels = "category_")

#Lists: vector where the data need not be the same mode (not atomic)
?list
x = list(1, "two", T, 3i)
x
str(x)

#Data frames: your basic table. One row per observational unit.
?data.frame
new_df = as.data.frame(matrix(c(1, 2, 3, 4, 5), nrow=3, ncol=5))
?as.data.frame
View(new_df)

#Functions: they are objects as well and can be built and stored (but there are many useful prefab ones)
myMeanFunction <- function(set){
  x = mean(set)
  return(x)
}
g = c(1,2,3,4,5,10,50)
myMeanFunction(g)

##### Working with Missing Values #####

#R is very good at dealing with missing values, but you need to know how to deal with them to use this to
#your advantage.

x = c(NA,2,3,NA,5)
is.na(x)
!is.na(x)

#NAs will not generate an error in a vector and is automatically recognized as NA

###Other NA actions:
#takes out the NAs and tells you where they were
?na.omit
na.omit(x) 
#takes out the NAs and tells you where they were
na.exclude(x) 
#prints all data, even NAs
na.pass(x) 
#will not print out if data is missing.
na.fail(x) 

#How that works with data frames:
new_df = as.data.frame(matrix( c(1, 2, 3, 4, 5), nrow=3, ncol=5))
new_df[1,1] = NA
new_df[3,5] = NA
new_df
na.omit(new_df)
na.exclude(new_df)
na.pass(new_df)
na.fail(new_df)

#You can also exclude NAs when you're running functions
x
#removes nas for the function
mean(x, na.rm=TRUE) 
#If you don't remove the NAs then it returns NA.
mean(x)
#summarizes, and shows how many NAs.
summary(x) 
#sorts data, putting your NAs at the end.
sort(x,na.last = TRUE) 

##### A few other math functions before we get to working with data:
y = c(-1.3,2,10.75)
y
# Absolute value:
abs(y)

# round up to the next highest integer.
ceiling(y)

# round down the lowest integer.
floor(y)

#round but specify the digits:
round(y, digits=1)

#Expand grid can create a data frame with all the given possibilities. 
?expand.grid
expand.grid(math=c(500,800), verbal=c(600, 700), gender=c("Male", "Female"))

#Selects a random sample.
?sample
sample(1:100, 1)
sample(state.name, 10)

############# SECTION 3. LOADING IN THE DATA ###############################

#Yes, you can use R as a GIANT CALCULATOR. But that would be a waste. Let's finally play with some data, 
#shall we?

#For this workshop, I've already created your project file, but next time you boot up R and you're starting
#a new project, make sure that you select File > New Project. Save it in a directory.

#Also, to create a new script (like the one you are reading), File > New > R Script.

#You should document your code with this so you can re-run things if the base data changes. 

##### SETTING THE WORKING DIRECTORY #####

#First things first, you have to set the working directory to tell your program where your main folder
#is with all your data (csv, xls, dat, scripts, project files, etc...)

setwd("~/FOLDER/NICAR_R") #If you don't know the path, find the folder in the files pane. Then
#go to dropdown Session > Set Working Directory > To Files Pane Location. This will also show you the path.

#You can check your working directory if you think you're in the wrong place:
getwd()


##### Reading data into R from a file #####

##From a CSV (best file type to read in with R):
ceos_raw = read.csv("top_100_ceos.csv", header = T, strip.white = T, sep=",")
View(ceos_raw)

##Other important arguments that you can add to it:
#1. header - is there a header? T or F
#2. sep = "," - what is separating the data; for csv, it's ","
#3. quote = "\"'" - how do quotes appear in the strings (here it is single quote)
#4. dec = "." - what does the decimal look like.
#5. row.names = c(x,x,x,etc...) - you can set row names if you like.
#6. col.names = c(x,x,x,etc...) - you can reset the column names. 
#7. stringsAsFactors = TRUE or FALSE - you can set the strings to character mode instead of factor (default is factor)
#8. na.strings = "NA" - what does NA look like.
#9. colClasses = c(x,x,x,etc) - set the type of data in each column.
#10. nrows = 100 - sets the number of rows.
#11. skip = 10 - sets how many rows you want to skip at the beginning.
#12. fill = TRUE or FALSE - if rows have different number of columns, this will fill the rest with blanks.
#13. strip.white = TRUE or FALSE - strip the white spaces from the columns


##From a tab delim. file:
delim_table = read.delim(filename, header=TRUE, sep="\t") #this is just an example.

##From an XLS:
install.packages("xlsx")
require("xlsx")
ceos_raw_from_xlsx = read.xlsx("top_100_ceos.xlsx", 1, header=TRUE) #read first sheet from this xlsx
View(ceos_raw_from_xlsx)

##From a DAT file:
read.table() #works with many file formats

##Read Fixed Width Formatted Files:
read.fwf()

### For more on importing files, check out: http://cran.r-project.org/doc/manuals/r-release/R-data.html

############# SECTION 4. BASIC DATA CLEANING #############

#Once you have your data loaded in, check that it has the number of variables 
#and observations that you expect.

#And then you can start reviewing the various columns.
#this will show the first 1000 rows of a data frame:
View(ceos_raw)
head(ceos_raw,2)
head(ceos_raw,5)
tail(ceos_raw,2)

#look at the headers:
names(ceos_raw)

#number of variables:
length(ceos_raw) 

#Next, take a look at the structure of the data frame.
str(ceos_raw) 

#Compensation has a strange column name (with the ...) so lets change it.
names(ceos_raw)[5] = "Compensation"
names(ceos_raw)

#Check out only a column of the data with "$"
ceos_raw$Industry

#It appears that aside from the year, everything was read in as a factor. We're going to have to change
#the column type to match the data. 

#Certain things should remain factors (anything we want to be categorical, like gender or state or industry).
#This will make it easier to analyze later. 

#But let's change Ticker, Company, CEO Name to character type (meaning a string)
#converts column to as character.
ceos_raw$Ticker = as.character(ceos_raw$Ticker) 
ceos_raw$Company = as.character(ceos_raw$Company)
ceos_raw$CEO.Name = as.character(ceos_raw$CEO.Name)
ceos_raw$Year = as.character(ceos_raw$Year, format = "%Y")
str(ceos_raw)

#Let's change the money from factor to a number without $ and comma.
ceos_raw$Compensation = as.character(ceos_raw$Compensation)
str(ceos_raw)

#Taking out the dollar sign:
?gsub
ceos_raw$Compensation = gsub("\\$", "",ceos_raw$Compensation)
head(ceos_raw)
str(ceos_raw)

#Taking out the comma:
ceos_raw$Compensation = gsub(",", "",ceos_raw$Compensation)

#Now let's convert it to numeric:
ceos_raw$Compensation = as.numeric(ceos_raw$Compensation)
str(ceos_raw)

#What is that scientific notation, let's change it with options:
?options
options(scipen = 999)

# Now let's check it again:
str(ceos_raw)

##### Some other great functions for cleaning data #####

#Substring: Extract or replace substrings in a character vector.
?substr
d = c("But there are also unknown unknowns. There are things we don't know we don't know.")
e = substr(d, 1,36)
e

#Searching for a pattern.
?grep
grep("unknown unknowns", d, ignore.case = TRUE)
grepl("unknown unknowns", d, ignore.case = TRUE)

#Find and replace:
?sub
sub("unknown","known",d)

#Find and replace (global):
?gsub
gsub("unknown", "known",d)

#String split:
strsplit(d, "\\.")

#Make upper case:
toupper(d)

#Make lower case:
tolower(d)

#Adding on another column:
?cbind

#Adding on rows:
?rbind

#Merging data frames by a common column (often known as join):
?merge

## Data cleaning with R is an art, but it's not hard to get pretty decent at it. I highly suggest
## taking a look at this short guide: 
## http://cran.r-project.org/doc/contrib/de_Jonge+van_der_Loo-Introduction_to_data_cleaning_with_R.pdf


############# SECTION 5. BASIC SUMMARY STATISTICS WITH R #############

##### First look at all the data #####
summary(ceos_raw)

## This will give you an overall breakdown of your data. 

## For values that are characters, you will just see the number of observations.

## For numbers, you will see the minimum, the 1st quartile, the median, the mean, the 3rd quartile, and the max. 
## This is incredibly helpful for understanding the distribution. 

## Now you can see overall that the minimum compensation of the Top 100 Private Company Salaries is $18.7m,
## the average is $30.3m and the median is somewhat lower at $23.6m and the max is $141.9m.

## For factors (categorical data), it will give you frequency. 

## In our data, you will see that the highest paid CEOs come from Tech, Energy, Finance and Media. There
## are five women and 95 men, and most of the companies have headquarters in New York City but the most
## common state is California. 

##### Sorting your data will help you understand it better. #####

## Sorting by one variable:
sorted_data_company = ceos_raw[order(ceos_raw$Company),] 
head(sorted_data_company)

sorted_data_industry = ceos_raw[order(ceos_raw$Industry),]
head(sorted_data_industry)

sorted_data_gender = ceos_raw[order(ceos_raw$Gender),]
head(sorted_data_gender)

## Sorting by two variables:
attach(ceos_raw)
sorted_data_state_ind <- ceos_raw[order(Headquarters_state,Industry),]
head(sorted_data_state_ind,10)

## Make it descending:
sorted_data_state_ind <- ceos_raw[order(Headquarters_state,-Compensation),]
head(sorted_data_state_ind,10)
detach(ceos_raw)

##### Quick visualizations can also help you understand your data better #####
gend_table = table(ceos_raw$Gender)
barplot(gend_table,ylim = c(0,100),ylab = "Frequency", xlab = "Gender", col = rainbow(2))
barplot(gend_table,ylim = c(0,100),ylab = "Frequency", xlab = "Gender", col = c("blue", "purple"))

### What if you want to look at the median income per industry or gender.
library(ggplot2)
?aggregate
average_compensation_industry_mean = aggregate(Compensation~Industry, ceos_raw, FUN = mean)
?qplot
qplot(x=Industry, y = Compensation,data=average_compensation_industry_mean,geom="bar", stat="identity") +  theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))

average_compensation_industry_median = aggregate(Compensation~Industry, ceos_raw, FUN = median)
qplot(x=Industry, y = Compensation,data=average_compensation_industry_median,geom="bar", stat="identity") +  theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))

average_compensation_gender = aggregate(Compensation~Gender, ceos_raw, FUN = mean)
qplot(x=Gender, y = Compensation,data=average_compensation_gender,geom="bar", stat="identity") +  theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))

average_compensation_city = aggregate(Compensation~Headquarters_city, ceos_raw, FUN = mean)
qplot(x=Headquarters_city, y = Compensation,data=average_compensation_city,geom="bar", stat="identity") +  theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))

new_order = head(average_compensation_city[order(-average_compensation_city$Compensation),],10)
qplot(x=Headquarters_city, y = Compensation,data=new_order,geom="bar", stat="identity") +  theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))



############# SECTION 6. REMINDERS FOR WHEN YOU GET STUCK############# 

# 1. R is case sensitive: If a package or variable has a name, the case matters!

# 2. Errors are common so get used to using help and ? as well as the online communities 
# so you can figure out what you want.

# 3. Commands can be separated by a newline or a semi-colon (‘;’)
##EX: 
x = 3+4 ; y = x*2 ; y

# 4. Comments can be made with hashtags(#) and these lines will not run in your console.

# 5. If you don't finish a command in the console, you will see a plus-sign (+) until you finish it!
##EX:
x = (1 +3) - (2*4
)

# 6. You must install packages before you use them. Once they are installed, you have to require or 
#load them.
##EX:
install.packages("ggplot2")
require("ggplot2")

# 7. To run code from the scripts, hold down command and hit return. For multiple lines, select all
#the lines, hold command and hit return.

# 8. R has some built in data sets that you can play with to get better (see package "datasets") and for a
# complete list > library(help = datasets)

# 9. When you get stuck and something is not working how you expect it to work, take a look at the types 
#of data you are trying to work with (use summary and str). These can be great diagnostic tools at 
#the beginning because not all functions work with all types of data.

# 10. SAVE ALL YOUR WORK. Obviously.

############# SECTION 7. HOW TO GET HELP ############# 

# The main R site: http://cran.r-project.org/
# This has everything from guides to R updates. It also has a comprehensive list of packages and lots
# of great tips on how to use R. 

# Official R Language Definition: http://cran.r-project.org/doc/manuals/r-release/R-lang.html

# An In-Depth Introduction to R: http://cran.r-project.org/doc/contrib/usingR.pdf

# Using R for Intro Stats: http://cran.r-project.org/doc/contrib/Verzani-SimpleR.pdf

# Quick R: http://www.statmethods.net/

# R Documentation Search: http://www.rdocumentation.org/

# R-bloggers: find out awesome things people are doing with R http://www.r-bloggers.com/

# Coursera Course on R: https://www.coursera.org/course/rprog

# Princeton Guide to R: http://libguides.princeton.edu/dss/R

# UCLA Guide to R: http://www.ats.ucla.edu/stat/r/sk/books_usingr.htm

# Stack overflow: http://stackoverflow.com/





##################################### GOOD LUCK AND LOVE R ############################################


