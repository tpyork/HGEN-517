# =============================================================================
# HMG 517: INTRODUCTION TO R PROGRAMMING FOR STATISTICAL GENETICS                     
# SCRIPT 3                                                                  
# Data Manipulation 1                                                       
# =============================================================================




# 1. SETUP --------------------------------------------------------------------

#setwd("C:/temp/HGEN517")                       # PC / Windows
setwd("/Users/york2/Dropbox/temp")              # Mac

#load("hmg517.Rdata")






# 2. READ DATA ----------------------------------------------------------------

# Read in data file generated and written in Script 2

dat <- read.table("temp.csv", sep=",",header=TRUE)





# 3. ENVIRONMENTS -------------------------------------------------------------

# An Environment binds a set of names to a set of values
# The Global Environment is the interactive workspace
#  attach():  object in current database is added to search path

search()          #lists all the parents of the global environment
environment()     #current environment
attach(dat)
search()
detach(dat)
search()





# 4. MERGE --------------------------------------------------------------------

#  merge():  combining two data.frames

set.seed(345)
dataA <- data.frame(subject= 1:10, A= round(rnorm(10),2))
dataB <- data.frame(subject= 6:10, B= letters[1:5])


# Intersection.
merge(dataA, dataB, by="subject") 


# Union.
merge(x=dataA, y=dataB, by="subject", all.x=T, all.y=T)





# 5. SORTING ------------------------------------------------------------------

#  reverse, sort and order

sort(dat$intensity)
rev(sort(dat$intensity))
order(dat$intensity)


#TRY:  Create a data.frame with the rows sorted on intensity values from highest to lowest





# 7. OTHER USEFUL FUNCTIONS ---------------------------------------------------


# append(); combine vectors

x <- 10:15
y <- 50:59

append(x, y)
c(x,y)

append(x, y, after=2)



# replace() and ifelse(); replace values in vectors

replace(x, c(1,3,5), 0)

replace(x, 1:3, 0)

replace(x, 1:length(x), x)

ifelse(x==12, NA, x)




# unique(); extract unique values

state <- as.data.frame(state.x77)
state$Name <- state.name

table(state$Frost)

length(unique(state$Frost))



# select a single row
state[state$Name=='Virginia' , ]





# duplicated(); extract duplicated values

duplicated(state$Frost)

state[duplicated(state$Frost),]



#TRY: Create a new data.frame with only the rows with duplicated Frost values







# g/re/p == grep();  search for patterns in characters

grep("New",state$Name)

state[grep("New ", state$Name),]







# extract part of string

substr(state$Name, 1, 2)

state$Name <- toupper(state$Name)

state$Name <- NULL






# match / which

match("red", c("blue","yellow","red"))

which(c("blue","yellow","red") == "red")





#  row bind

newdata <- data.frame(number=21, letter="A", intensity=.34, group=3)

dat2 <- rbind(dat, newdata)





#  column bind

dat3 <- data.frame(varX= round(rnorm(20,18,1.5),2), state= sample(state$Name, 20, replace=T))

cbind(dat , dat3)





# PRACTICE PROBLEMS -----------------------------------------------------------

#1.  show two ways to reorder the columns of dat ("temp.csv") in the following order "group,intensity,letter,number"

#2.  sort dat by decending group number.

#3.  show two ways to determine the number of unique Species in the "iris" data.frame (this is already pre-loaded in base R).

#4.  how many unique values of Petal.Length are in the iris data.frame?

#5.  how many states in the "state" data.frame contain the letter 't'?  name these states.

#6.  how many states have a two word name?

#7.  run the following code and merge the result with the state data.frame. call the new data.frame "state2".






# -----------------------------------------------------------------------------
save.image("hmg517.Rdata")
q()
# -----------------------------------------------------------------------------

