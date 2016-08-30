# =============================================================================
# HMG 517: INTRODUCTION TO STATISTICAL PROGRAMMING IN R      
# SCRIPT 1                                                   
# =============================================================================




# CONSIDERATIONS FOR STATISTICAL PROGRAMMING ----------------------------------
# (Derived from Wickham, Grolemund 2011, Assessing data analysis and programming)

# "Data analysis, the craft of turning data into knowledge, insight and understanding, is a critical skill for statistic graduates"
# "..data analysis is impossible without the right tools, a secondary focus is programming..a dirty word in statistics.."
# "..classes that teach both data analysis and programming are rare.."

# 'learning some type of programming is a vital skill for every analyst who will be working intensely with data'
# VIPBGers usually learn programming and data analysis under an apprenticeship model
# "..while the course uses computational tools extensively, it is not computational: it focuses on the tools to do data analysis.."

# 'working with a GUI is ultimately limiting and hampers three properties for good data analysis:
#    reproducibility, automation, communication'
# 'data analysis is a high level skill, and there is typically no right answer (although there are better or worse answers)'




# R BASICS --------------------------------------------------------------------

# Using R as a calculator

5 + 6

5 + 6 * 7
6-2




# Using R to store and create objects -----------------------------------------


x <- 5

ls()



# Using R to create summaries of objects created -----------------------------

x <- 1:10


mean(1:10)
mean(x)
sd(x)




# Using R to visualize objects -----------------------------------------------

y <- rnorm(mean=0, sd=1, 100)

hist(y)






# Review style guide ---------------------------------------------------------

http://adv-r.had.co.nz/Style.html





#-----------------------------------------------------------------------------
q()


#EOF
