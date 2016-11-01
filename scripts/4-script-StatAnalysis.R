#=================================================================
# R FUNCTIONS FOR STATISTICAL ANALYSIS                       
# HMG 517                                                    
#=================================================================



# 1. SETUP -------------------------------------------------------

#setwd("C:/temp/HGEN517")                       # PC / Windows
setwd("/Users/york2/Dropbox")                   # Mac

#load("hmg517.Rdata")





# 2. READ IN DATA FILE -------------------------------------------

dx <- read.table(file.path(getwd(),"teaching/hgen-517/Fall-2016/data/disease.csv"), header=TRUE, sep=",")
dim(dx)
head(dx, 10)
tail(dx)
str(dx)





# 3. SIMPLE STATISTICS -------------------------------------------

mean(dx$weight, na.rm=T)

sd(dx$weight)
hist(dx$weight)
summary(dx$weight)

library(psych)
describe(dx)


# TRY:  Find the mean weight of the female sample






# EXAMPLE OF USER DEFINED FUNCTION -------------------------------

#INPUT:  numeric vector
#OUTPUT: summary statistics and plots
#BEGIN FUNCTION
varsum <- function(x) {
  if (is.numeric(x)) { 
    print(paste("Length of vector: ",length(x)))
    print(summary(x))
    par(mfrow=c(1,2))
    hist(x)
    boxplot(x)
  } else {
    print("This object is not a numeric vector")
  }
}
#END FUNCTION

varsum(dx$weight)





# RELATIONSHIPS BETWEEN VARIABLES -------------------------------

table(dx$sex, dx$country)

round(cor(dx[,c("weight","age","phenotype")]),3)
plot(dx[,c("weight","age","phenotype")])


#par(mfrow=c(2,2))
plot(dx$weight, dx$age)
plot(dx$weight, dx$phenotype)

#par(mfrow=c(1,1))




# SIMPLE LINEAR MODEL -------------------------------------------

plot(dx$weight, dx$phenotype)
abline(lm(phenotype ~ weight, data=dx))

a <- lm(phenotype ~ weight, data=dx)
summary(a)

names(a)
a$coefficients[2]





# Plot indicating sex membership
plot(dx$weight, dx$phenotype, pch=as.numeric(dx$sex), cex=0.7, col=as.numeric(dx$sex))


# Alternative method to plot by category
install.packages("car")
library(car)
scatterplot(weight ~ phenotype | sex, data=dx)


# TRY:  RUN SEPARATE REGRESSIONS BY SEX; PLOT EACH











# CREATING OBJECTS FROM STATISTICAL SUMMARIES -------------------

a <- summary(lm(weight ~ phenotype, data=dx))
names(a)

a$r.squared




# SIMPLE INFERENCE ----------------------------------------------


# correlation test

cor.test(dx$weight, dx$phenotype)




# Student's t

t.test(dx[dx$country=='US','weight'], dx[dx$country=='Sweden','weight'])

boxplot(weight ~ country, data=dx)




# can also be written in the form of an equation
t.test(weight ~ country, data=dx[dx$country %in% c('US','Sweden'),])

t.test(dx[dx$country=='US','weight'], dx[dx$country=='Sweden','weight'], alternative="two.sided")




# wilcoxon two-sample non-parametric test

wilcox.test(dx[dx$country=='US','weight'], dx[dx$country=='Sweden','weight'], conf.int=TRUE)




# chi-square test

table(dx$snp.A, dx$snp.B)

chisq.test(table(dx$snp.A, dx$snp.B))



# fisher's exact test
fisher.test(table(dx$snp.A, dx$snp.B), simulate.p.value=T)



library("gmodels")
CrossTable(dx$snp.A, dx$snp.B)





# ANALYSIS OF VARIANCE ------------------------------------------

a <- aov(phenotype ~ country, data=dx)
summary(a)
coef(a)


a <- aov(phenotype ~ factor(country, levels=c('US','Sweden')), data=dx)
summary(a)


a <- aov(phenotype ~ factor(country), data=dx)
a_hsd <- TukeyHSD(a)
plot(a_hsd)





# MULTIVARIATE REGRESSION ---------------------------------------

summary(lm(phenotype ~ snp.A + snp.B, data=dx))


# multivariate regression; include interaction term

summary(lm(phenotype ~ snp.A*snp.B, data=dx))

# compare both models with the same interaction term
summary(lm(phenotype ~ snp.A*snp.B*weight, data=dx))
summary(lm(phenotype ~ snp.A:snp.B:weight, data=dx))



# include higher order terms

summary(lm(phenotype ~ weight + I(weight^2), data=dx))



# logistic regression

dx$phenotype01 <- ifelse(dx$phenotype < 0, 0, 1)

table(dx$phenotype01)

a <- glm(phenotype01 ~ snp.B, data=dx, family= binomial())
summary(a)

# get odds and 95% confidence interval
exp(coef(a)["snp.B"])
exp(confint(a, parm= "snp.B"))





# apply() -------------------------------------------------------

sd(dx[,'weight'])


apply(dx[, c(2,4,8)], 2, sd)





# hetcor() ------------------------------------------------------

# Pearson correlations between numeric variables
# polyserial correlations between numeric and ordinal variables
# polychoric correlations between ordinal variables

# install.packages('polycor')

library(polycor)

hetcor(dx[,1:4])






# Practice -------------------------------------------------------

# 1. Regress phenotype on both SNPs separately in dx




# 2. For the SNP with a significant main effect, test whether this relationship is modified by country









# ---------------------------------------------------------------
save.image("hmg517.Rdata")
q()
# ---------------------------------------------------------------

