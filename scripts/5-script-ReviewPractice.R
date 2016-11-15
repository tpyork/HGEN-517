#=================================================================
# R FUNCTIONS FOR STATISTICAL ANALYSIS                       
# HMG 517                                                    
#=================================================================



# 1. SETUP -------------------------------------------------------

#setwd("C:/temp/HGEN517")                       # PC / Windows
setwd("/Users/york2/Dropbox/teaching/hgen-517/Fall-2016")                   # Mac



# READ DATA ------------------------------------------------------

pol <- read.table(file.path(getwd(), "data/president-general-polls_2016.csv"), sep=',', header= TRUE)
dim(pol)
head(pol)



# Practice -------------------------------------------------------



# Pick a state and answer the follow quesitons -------------------


nc <- pol[pol$state=='North Carolina', ]
nm <- pol[pol$state=='New Mexico', ]


# What is the average `rawpoll_clinton` and `rawpoll_trump` for your state?

mean(nc$rawpoll_clinton)
mean(nc$rawpoll_trump)


# Does the mean difference vary by `grade` ?

barplot(tapply(nc$rawpoll_clinton, nc$grade, mean) - tapply(nc$rawpoll_trump, nc$grade, mean))

barplot(tapply(nm$rawpoll_clinton, nm$grade, mean) - tapply(nm$rawpoll_trump, nm$grade, mean))


# Does the mean difference vary by `samplesize` ?

hist(nc$samplesize)



boxplot(nc$rawpoll_trump ~ nc$grade)

boxplot((nc$rawpoll_trump-nc$rawpoll_clinton) ~ nc$grade)

temp <- nc[nc$grade %in% c('A+','A','A-'),]

temp <- data.frame(percent= c(nc$rawpoll_trump, nc$rawpoll_clinton), 
        candidate= c(rep('trump', length(nc$rawpoll_trump)), rep('clinton', length(nc$rawpoll_clinton))))

boxplot(percent ~ candidate, data= temp, col= c('blue', 'red'))
t.test(percent ~ candidate, data= temp)

t.test(nc$rawpoll_trump, nc$rawpoll_clinton, paired=T)









# ---------------------------------------------------------------
save.image("hmg517.Rdata")
q()
# ---------------------------------------------------------------

