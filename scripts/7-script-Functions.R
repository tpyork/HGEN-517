# ========================================================================
# R: PROGRAMMING USER-WRITTEN FUNCTIONS                    
# HMG 517                                                    
# ========================================================================



# 1. SETUP -------------------------------------------------------

#setwd("C:/temp/HGEN517")                                     # PC / Windows
setwd("/Users/york2/Dropbox/teaching/hgen-517/Fall-2016")     # Mac

#load("hmg517.Rdata")





# ------------------------------------------------------------------------
# NOTES

# Objects in the function are local to the function
# The object returned can be of any data type 






# ------------------------------------------------------------------------
# STRUCTURE OF A FUNCTION

new <- function(arg1, arg2, ...) {
  statement1
    .
    .
  statementN
  return(object)
}


new(arg1= , arg2= )









# ------------------------------------------------------------------------
# EXAMPLE USING 1 ARGUEMENT: Report the mean of a vector


myfunction <- function(x) {

  out <- mean(x, na.rm= TRUE)
  return(cat("Mean of this vector is:",out))

}


myfunction(x= c(1,2,3,NA))















# ------------------------------------------------------------------------
# EXAMPLE USING 2 ARGUEMENTS: 

myfunction2 <- function(x, na) {

  if (na) {
    out <- mean(x, na.rm= TRUE)
  }
  if (!na) {
    out <- mean(x, na.rm= FALSE)
  }
  return(cat("Mean of vector is:",out))

}



# x= numeric vector
# na= option whether missing should be excluded

myfunction2(x= c(1,2,3,4), na= F)









# ------------------------------------------------------------------------
# SOURCE YOUR FUNCTIONS

# 1. Create a file that contains all your functions
#    source("Your_File_Path/functions.R")

# 2. Create a .Rprofile file in the current working directory


# Read in the date2() function
source("/Users/york2/Dropbox/teaching/hgen-517/Fall-2016/scripts/myfunctions.R")   # this file could be anywhere (e.g., local machine, website)



# R base package function
date()


# Simpler output
date2()











# ------------------------------------------------------------------------
# STORING OUTPUT FROM FUNCTIONS IN A LIST


powers <- function(x) {
  out <- list(x2= x*x, x3= x*x*x, x4= x*x*x*x)
  return(out)
}

temp <- powers(2)

temp$x4










# ------------------------------------------------------------------------
# CREATE YOUR OWN BMI CALCULATOR



# INPUT= height, weight, formula (English/Metric)
# OUTPUT= "BMI is ___ for a height of ___ (lbs/kg) and weight of ___ (in/m)"


# English= (weight in pounds / (height in inches^2)) * 703
# Metric= (weight in kilograms / (height in meters^2)



BMICalc <- function(h, w, type) {


}













# ------------------------------------------------------------------------
save.image("hmg517.Rdata")
q()
# ------------------------------------------------------------------------
