#       _/_/    _/  _/      _/_/      _/   
#    _/    _/  _/  _/    _/    _/  _/_/    
#       _/    _/_/_/_/    _/_/_/    _/     
#    _/          _/          _/    _/      
# _/_/_/_/      _/    _/_/_/    _/_/_/     

# Exploratory Data Analysis of Gestation data

library(tidyverse)
library(mosaicData)
# if you don't have mosaicData, install it

data(Gestation)

# Activity 1 - Quick look at the data

# number of observations
count(Gestation)

# number of observations per racial group
count(Gestation, race)

# number of observations by racial group and level of mother's education
Gestation_n_race_ed <- count(Gestation, race, ed) %>% arrange(-n)
Gestation_n_race_ed

# Activity 2 - Further summary statistics
summary(Gestation)

# mean age of mothers across all births
# ensure you use a human friendly name for the value you're creating

# calculate both mothers' mean age and babies' mean weight
summarise(Gestation, 
          `Mean age` = mean(age, na.rm=TRUE),
          `Mean wt`  = mean(wt, na.rm=TRUE))


# Activity 3 - Grouped summaries

# make a new data frame containing only id, age and race variables
Gestation_new <- Gestation %>% select(id, age, race)

# calculate the mean age by race
summarise(group_by(Gestation, race),
          `Mean Age` = mean(age, na.rm=T))

# Activity 4 - Extensions


# Activity 4a - Correlation

# Calculate the correlation between age and weight across all births

#first plot age and weight to see the nature of the relationship
with(Gestation, plot(age, wt)) #There does not appear to be a clear relationship
with(Gestation, cor.test(age, wt, method="pearson"))
#There is no evidence of correlation between the variables

# Calculate the correlation between age and weight for each race group



# Activity 4b - Multiple summary statistics

# Calculate the sample mean of the ages and weights of the mothers in each race group


# Activity 4c - Pivoting wider

# Make a wide table from the summary data frame calculated in Activity 1 that has the number of observations for each combination of mother's education level and race. Make each row is an education level and each column a race group.

# Hint: Look at the help file for `pivot_wider` for what to do with missing cells (where there is no combination of these variables) and set the argument to be 0.


# Activity 4d - Multiple summary statistics

# Calculate the mean, standard deviation, minimum, maximum and proportion of values missing for the mothers' ages for each race group.
# Hint: you *can* use summarise_at() for this but you could also just summarise()