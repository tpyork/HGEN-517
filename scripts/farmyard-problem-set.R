#########################################
# Farmyard Problem Set
#
# 
#
#########################################


# Read in the csv file and store it in an object called "farmyard"----------





# A bit about the dataset:----------------

# animal = species
# weight = in pounds
# age = in years
# color = coat color
# spots = binary (present (1) /not present (0))
# sex = Male (M) or Female (F)
# appetite = farmer rating of how hungry each animal is (higher numbers indicate bigger appetites)
# eyecolor = eye color
# aggressiveness = rating of aggressiveness (higher numbers indicate angrier animals)
# yard = which yard the animal lives in









# This dataset is styled after data available in R. 
# Call up a list of all available datasets in R. 
# (Hint: A question mark may be helpful.)












# dataset inspection------------------
#a. How many of each kind of animal is present on the farm? 
#b. How do you see the top of the dataset? The bottom?
#c. How would you display a count of all the animals and their coat colors?
#d. What are three ways to display the data in the column "eyecolor"?
#e. How many variables are in the dataset? How can you see a list of them?
#f. Find the typo in the column names and fix it. 













# General Tasks ----------------------
#a. How many goats have red eyes and a red coat color?
#b. How many unique weights are there?
#c. How many different horse coat colors are there?
#d. Make a new dataset that only includes animals that were heavier than average and does not include pigs. 
#e. Is there a difference in average weight between the sexes?
#f. Which yard has the largest number of animals?
#g. Create a data.frame of just horses. Sort it by weight.














# Basic animal round up. For the animal of your choice, determine how many: --------

#a. have spots
#b. have a red coat color
#c. are very aggressive (i.e., 1 is not aggressive at all, 5 is very aggressive)
#d. have blue eyes
#e. are female
#f. weight less than 1100lbs?













# Phenotypic Combinations ---------------
# That's great, but you also need to know a lot of attribute combinations
# For the animal of your choice, how many:

#a. do not have spots and are brown
#b. have blue eyes and are above the mean size
#c. are male and live in yard 3
#d. have black eyes and spots
#e. are white or have brown eyes
#f. are not very aggressive (2) and are under average weight
#g. have spots or blue eyes













# IT'S BROKEN-------------------------
# coding errors. For each of the following questions, if the code runs, explain what it is doing, and then fix
# the code so that it produces the desired result:



#a) Pull out all animals who are at least four years old
farmyard[, age >= 4]  



#b) Create a new object with weight and coat color
mat <- matrix(farmyard$weight, farmyard$color)




#c) Remove all of the female animals from the dataset
farmyard[farmyard$sex != F, ]




#d) Create a new object with the yard number and appetite of all goats
dat <- farmyard[farmyard == "goat", 7,10]




#e) Show all the animals with the highest aggression scores
farmyard[aggression == 5]





#f) Count up the number of white chickens
length(farmyard[farmyard$animal == chicken])





#g) Determine how many animals have black eyes
dim(farmyard$eyecolor == "black")





#h) Show all male animals
farmyard[farmyard$sex == 'm',]





#i) Sum up the weight of all the cows
sum(farmyard[farmyard$weight, "cow"])








# Additional Tasks-------------------------------
#a. Find the mode for weight. Replace that value with -9. 
#b. Create a vector of unique appetite values
#c. Create a new vector composed of only even numbered rows
#d. What are two ways that you could save the data object?
#e. Round appetite to one decimal place













# Bonus Round --------------######################
#
# If you finish early, you are welcome to work on the problems below. You are not expected to know how to do these problems yet,
# but all of these tasks will be doable by the end of the course.

#a. Create a new column called ID. Give each animal an ID based on its weight and species. The lightest animal will get a 1. For example, "pig_1" is the ID for the lightest pig. 
#b. Plot a histogram of weight for any animal
#c. Plot two histograms of weight side-by-side
#d. Create a scatterplot of weight vs. appetite. Is there a correlation? Change the color of the dots. 
#e. Test if there is a significant mean difference in weight by sex for horses. 

















