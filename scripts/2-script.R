# =============================================================================
# HMG 517: INTRODUCTION TO R PROGRAMMING FOR STATISTICAL GENETICS                     
# SCRIPT 2                                                                  
# =============================================================================




# 1. SETUP --------------------------------------------------------------------

#setwd("C:/temp/HGEN517")                       # PC / Windows
setwd("/Users/york2/Dropbox/temp")              # Mac


# this function recalls the current working directory
getwd()




# need to create this file first using save.image(); see eof
load("hmg517.Rdata")




#---------------------------------------------------------------------------#
# NOTE: all commands for a session are saved in '.Rhistory'                 #
#       use separate .Rdata files for different analysis projects           #
#---------------------------------------------------------------------------#



#---------------------------------------------------------------------------#
# NOTE: most work in R is done through functions. If you can think it,      #
#       there is likely a function already written to do it..               #
#---------------------------------------------------------------------------#





# Getting Help ----------------------------------------------------------------
help(mean)
?mean
help("mean")
help.start()
example(mean)
help.search("mean")

# www.rseek.org
# stackoverflow.com




# 2. EXPRESSIONS VS ASSIGNMENTS -----------------------------------------------


# Assignments evaluate Expressions and pass value to an object 
# Commands can be separated by ';' or a new line 


1 + 2                     # Expression
x <- 1 + 2                # Assignment '<-'
#or#
assign("x", 1 + 5)

y <- z <- x

x <- 3





# 3. NUMERIC VECTORS -----------------------------------------------------------

z <- 7                    # scaler
x <- c(1,2,3,4,5)         # c is combine/concatenate
c(1,2,3,4,5) -> y         # arrows point both ways (but discouraged)



# TRY:  Create a new object called x5 that repeats vector x five times


x5 <- rep(x, 5)

x5 <- c(x, x, x, x, x)

x5 <- c(1:5, 1:5, 1:5, 1:5, 1:5)





# Simple vector manipulation using mathematical operators
x <- 1:10
2 * x + 4

y <- 10:1
x + y



# Recycling vectors of different lengths 
y <- 1:15
x <- 1:5

y/x



# Simple vector manipulation using logical operators
x > 5
x <= y





# PROPOSITION:  (Logic) a statement that is either TRUE or FALSE, but not both
# the conjunction of x and y is:  x & y
# the disjunction of x and y is:  x | y

# Truth table
TRUE & TRUE
TRUE & FALSE
TRUE | FALSE



# Patterned vectors

# seq()
7:34
seq(7, 34, by=.1)


# rep()
rep(17, 5)


# TRY: repeat the sequence 0 to 8 seven times


rep(x= 0:8, times= 7)






# 4. INDEXING AND SUBSETING A VECTOR -------------------------------------------

x <- seq(5,200)

length(x)
x[3]
length(x[-5])          #NOTE: you can't mix positive and negative subscripts



# TRY: index the 1st, 2nd, and 50th position in a single command

x[c(1,2,50)]


# TRY: create a new object where the elements of 'x' have a value greater than 122


x[]

x[x > 122]



# TRY: create a new object with all values of 'x' not including the first and last position





# 5. MISSING DATA --------------------------------------------------------------

# NOTE: In general any operation on NA results in a NA value

z <- c(4,5,6,NA,3,6)

3 + z

sd(z, na.rm=TRUE)

table(is.na(z))

which(is.na(z))



# TRY: create a new object containing all non-missing values of 'z'





# 6. CHARACTER VECTORS ---------------------------------------------------------

# NOTE: vectors can be of only one mode

r <- c("a","b","c")


is.numeric(r)
is.character(r)


# combining characters and numbers
c("red","green","blue",8)
is.character(c("red","green","blue",8))

color <- c("red","indigo","sepia","fushcia","ultramarine","navy")


# character substrings
substr(color, 1, 3)


#TRY: extract only the first letter from each element in the string from the object color




# PASTE
paste("t",1, sep="_")



#TRY: use paste to create a character vector 'z1, z2,...,z10'





# 7. FACTORS -------------------------------------------------------------------

grp <- c("control", "treatment", "treatment", "control","control")
mode(grp)
class(grp)

grp <- factor(grp)   # coerce mode character to mode numeric
mode(grp)            # mode denotes basic structure of object (numeric, character, logic)
class(grp)           # class denotes how generic functions operate on object
                     #  this classification is of more importance to us     

as.integer(grp)
levels(grp)





# 8. LISTS VERSUS DATA.FRAMES --------------------------------------------------

# Lists are a collection arbitrary objects (can be of different types) under a single name
# Data.frames have the structure of a type of list.  requirement that all list elements are of the same length.


# Create a data.frame

dat <- data.frame(x= 1:20, y= letters[1:20], z= round(rnorm(20),3), w= c(rep(1,5),rep(2,15)))
dat

is.data.frame(dat)
is.list(dat)
class(dat)

names(dat) <- c('number','letter','intensity','group')


# Create a list

alist <- list(one= 1:100, two= c("a","b",LETTERS[18]), three= pi, four= TRUE)
is.data.frame(alist)
is.list(alist)
class(alist)


#subscripting (indexing) data.frames and lists

# 3 main types

dat[,4]

dat[,"group"]

dat$group

dat[2:5, 3:4]


#~

# [ ] and [[ ]] indexing

alist[1]
alist[[4]]

mode(alist[1])
mode(alist[[1]])





# 9. DATA.FRAMES VERSUS MATRICES -----------------------------------------------
# All elements of a matrix have the same mode (numeric or character) 
#  they allow for efficient mathematical operations and manipulation not
#  available for data.frames


dat.m <- as.matrix(dat)
class(dat.m[1,])

mat <- matrix(1:25, 5, 5, byrow=T)


# TRY:  create a 5x5 identity matrix



iden <- matrix(0, 5, 5)

iden[1,1] <- 1

diag(1, 5)


REVIEW:       So, in practice, when do i use lists, data.frames and matrices?
LIST:         Useful for object oriented programming. Usually the default storage from functions. 
MATRIX:       When all data is of the same mode. When matrix operations are necessary. 
DATA.FRAME:   Combines the best properties of lists and matrices. Data storage and quick access to variables.
              Data analysis. Most statistical functions work off of data.frames and vectors.





# 10. WRITING DATA TO EXTERNAL FILE --------------------------------------------

write.table(dat, file= "temp.csv", sep=",", row.names=FALSE, quote=FALSE)





# 11. READING EXTERNAL DATA ----------------------------------------------------

dat <- read.table("temp.csv", sep=",",header=TRUE, col.names=c('one','two','three','four'))
dim(dat)
names(dat)
edit(dat)           #or fix(dat)

names(dat)                                    #try:  length(names(dat))
names(dat)[1]                                 #access an element in the vector
names(dat)[1] <- "y"                          #rename first variable in data.frame
dat$new <- 1:dim(dat)[1]                      #add a new variable
dat$new <- NULL                               #remove a variable

#rename as before
names(dat) <- c('number','letter','intensity','group')




#TRY:  create a subset of dat where rows of group only equals 2 from 'dat'


dat[ dat$group==2 ,  ]






#TRY:  create a vector of intensity values where group equals 1

x <- dat[dat$group==1, "intensity"]
x$intensity



#TRY:  create a new variable that has the value of 'neg' if intensity is negative and 'pos' if intensity is positive

neg <- dat[dat$intensity <= 0,]


dat$sign <- ifelse(dat$intensity > 0, 'pos', 'neg')

x <- 0:5

ifelse(x > 0, 'pos', 'neg')



#TRY:  create a new data.frame that contains only those rows where number equals 3,5,7,13,17,19


dat[dat$number %in% c(3,5,7,13,17,19), ]

is.element()



# 12. OTHER USEFUL FUNCTIONS ---------------------------------------------------



# Commands can be entered from outside the GUI

source("test.R")        #TRY: create this file and run!



sink("output.txt")        # File is automatically created

sin(.55)                  # Output is written to file

sink()                    # Restores output to GUI Console



#removing objects
x <- 1:10
pie <- pi

ls()                      #or objects()
rm(x, pie)
#rm(list=ls())            #Careful! This removes all created objects w/out warning







# SAVING OBJECTS ---------------------------------------------------------------

save.image("hmg517.Rdata")
q()


# EOF
