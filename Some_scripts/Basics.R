library(tidyverse)
getwd()     #getting working directory
setwd()     #
# More setting on bottom right console.
?getwd     # activates help page/manual
??kruskal  # search result of all the documentation in R that deals with kruskal
?mean      # Provides help discription to explain mean
sessionInfo()    #Gives info relevant to your infomation on R
3+5
5/2
165*pi
weight_kg <- 55
(weight_kg <- 55) # echos in the console
2.2*weight_kg      #Using created value
weighht_lb <- 2.2*weight_kg
. # refrain frm using - dot used in methods

# Ontop in the code option your are allowed to cmmnt and uncoment// shit cntrl C

mass <- 47.5            # mass?
age  <- 122             # age?
mass <- mass * 2.0      # mass?
age  <- age - 20        # age?
mass_index <- mass/age  # mass_index?

# looking at functions- steps encapsulated in a single name
sqrt(2)
round(24526.222222)
round(24526.222222, 3)  #Rounding off to three decimals
args(round)    # Asking R what the inputs are
args(sqrt)


# Vectors
weight_g <- c(50, 60, 65, 82) #Creating a vector - using integers here. 
animals <-  c("mouse", "rat", "dog") #creating a vector - using strings here.
length(weight_g)          # How many elements are in this vector
length(animals)           # 3 elements inside this vector
class (animals)           # determining the class of the vector - class characteer
class (weight_g)          # class numeric
str(animals)              # Doesnt only work with vectors -str: gives us a sumamary of the objject
str(weight_g)             # rows and colums [1:4]
1:10                      # vector of numbers starting at 1 and ending at 10
10:1                      # reverse of above
str      # shows structure of the dataframe

# Adding elements to Vectors
weight_g <- c(weight_g,90) #Adding 90 to the end of the vector
weight_g

weight_g <- c(22, weight_g) #Adding 90 to the begining vector
weight_g


# creating vector by mixing data types
mixing <- c(1,2,"a")
mixing
class(mixing)

# Vectors mixing numbers with boolians
c(1,2,3, FALSE)     # False is a boolian - boolians: only take on two values - true (1) or false (0)

#Indeces from a vector
animals
animals[2]              # this is done to exract the element of the second vector - use square bracket


# Extracting a range of elements from a vector
weight_g
weight_g[c(2:4)]          #Extracting the value for indext 2-4 #Extracting a range of elements


weight_g[weight_g < 60]   # extract elements based on a logical condition - extracting all values less that 60
weight_g[weight_g < 60 | weight_g == 60]   # extract elements based on a logical condition - extracting all values less that 60 and those equal to 60
# \ - Or opporator
weight_g[weight_g < 60 & weight_g == 60]  # Empty set. 


# Messy data
# R accomidates for untidy data - no other program does this
# messy data : most common type pf messy data is missing value; R makes this NA
heights <- c(2,3,4,NA,5)             #NA - is case sensitive so "na" wont work. Creating a dataset with missing data
heights
mean(heights)                        # Missing data so this wont work
mean(heights, na.rm = TRUE)          # Calculate by ignorimg the missing data
na.omit(heights)
heights[complete.cases(heights)]

# Create folders data, data_output, fig_output, download in project
download.file("https://ndownloader.figshare.com/files/2292169","data/portal_data_joined.csv") #Download the data into Rstudio and paste it in the folder called data
surveys <- read.csv("data/portal_data_joined.csv")                                            # Reading data into R - Dataframe: ordered collection of vectors
# 34thousand observations
# Each column is a vector


# Exploring the data 
unique(surveys)
summary(surveys)
colnames(surveys)
head(surveys)
tail(surveys)
plot(surveys$sex)
plot(surveys$species_id)
plot(surveys$hindfoot_length)
View(surveys)             # Opens the data in the script area
dim(surveys)              # Determining the dims of the object - 34thousand observations, 13columns
nrow(surveys)             # 34thousands rows
ncol(surveys)             # 13columns
str(surveys)

sex <- factor(c("male", "female", "male", "male", "female"))  #looking at it in the to right pane: factor, not an object: also shows how many levels are observed
levels(sex)              #Shows us what levels are available
nlevels(sex)             #Different levels present nlevels: tells u the amount of levels
sex                   

# Some plotting
ggplot(surveys, aes(x = species_id, y = hindfoot_length, colour = sex)) +
  geom_point() +
  geom_smooth(method = "lm")

ggplot(data = surveys, aes(x = hindfoot_length)) +
  geom_histogram(aes(fill = sex), position = "dodge") +
  facet_wrap(~sex, ncol = 1, scales = "free_x")














