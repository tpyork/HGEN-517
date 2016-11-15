#=================================================================
# R FLOW CONTROL                       
# HMG 517                                                    
#=================================================================







# 1. SETUP -------------------------------------------------------

#setwd("C:/temp/HGEN517")                                     # PC / Windows
setwd("/Users/york2/Dropbox/teaching/hgen-517/Fall-2016")     # Mac

#load("hmg517.Rdata")






# 2. READ IN DATA FILE -------------------------------------------

dx <- read.table(file.path(getwd(),"data/disease.csv"), header=TRUE, sep=",")
dim(dx)
head(dx, 10)
tail(dx)
str(dx)





# 3. LOOPING AND CONDITIONAL STATEMENTS --------------------------

# Simple Loop, incrementing over a numeric vector

for ( condition ) { task }


for (i in 1:5) {
  
  print(i) 
  
}







# Simple Loop, incrementing over a character string

C <- paste("var",1:5, sep="")


for (i in C) {
 
  print(i)
   
}






# "IF THEN ELSE" Statement

if ( condition ) { task1|TRUE }  else { task2|FALSE }


x <- 3

if (x > 5) {
  1
} else {
  0
}





# "IF THEN ELSE" Loops


x <- 1:20

z <- numeric()
for (i in 1:length(x)) {

  if (x[i] > 5) {
    z[i] <- 1
  } else {
    z[i] <- 0
  }
  
}
z




# Achieve the same logic using ifelse()

ifelse(x > 5, 1, 0)








# PRACTICE -------------------------------------------------------

# 1. Write a loop to calculate how many `age` in `dx` are greater than 40.






# 2. Write a loop to regress `weight` on `snp.A` and `snp.B` separately; store the `r.squared` estimate in a vector







# 3. Compute the empirical p-value of the nonsignificant gene using a loop and the sample() function


# A., compute the observed F value



# B., compute the F value expected by chance from 10k random permutations of the data



# C., what proportion of times does the observed F exceed the 'permuted' F ?









#------------------------------------------------------------#
save.image("hmg517.Rdata")
q()
#------------------------------------------------------------#

