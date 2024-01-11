#       _/_/    _/  _/      _/_/      _/   
#    _/    _/  _/  _/    _/    _/  _/_/    
#       _/    _/_/_/_/    _/_/_/    _/     
#    _/          _/          _/    _/      
# _/_/_/_/      _/    _/_/_/    _/_/_/     

# Exploratory Data Analysis of FEV1 data

library(tidyverse)
library(here)
here()
# read the data in
fev1 <- read_csv("2491_eda/data/fev1.csv", col_types = list('id' = 'f'))

# sample the data so that we have 20 patients with more than 6 observations

fev1_sampled <- fev1 %>% 
  count(id) %>%
  filter(n > 6) %>%
  slice_sample(n = 20) %>%
  select(id) %>%
  inner_join(fev1)

fev1_sampled

# Activity 5 - A simple scatter plot
plot(FEV1~age,data=fev1_sampled, main='age against FEV1')
cor(fev1_sampled$FEV1,fev1_sampled$age)
# Calculate the correlation between age and FEV1
# (yes, this isn't strictly correct because there's repeated measures)


# Build a plot that shows the relationship between FEV1 and age

fev1_plot <- ggplot(data = fev1_sampled, 
                    aes(x = age, y = FEV1)) +
  ggtitle("FEV against age")+
  geom_point()

fev1_plot

# Activity 6 - Improving the plot

# Add meaningful labels for the $x$ and $y$ axes, including units, and change the plot's colour theme from the default.

fev1_plot <- ggplot(data = fev1_sampled, 
                    aes(x = age, y = FEV1)) +
  geom_point()+
  ggtitle("FEV against age")+
  xlab("age(years)")+
  ylab("FEV1(L)")+
  theme_classic()


fev1_plot

# Add a smooth line of best fit to the plot. 
fev1_plot <- ggplot(data = fev1_sampled, 
                    aes(x = age, y = FEV1)) +
  geom_point()+
  ggtitle("FEV against age")+
  xlab("age(years)")+
  ylab("FEV1(L)")+
  theme_classic()+
  geom_smooth(method="lm",se=TRUE)


fev1_plot


# Activity 7

# Activity 7a - Showing further structure

# Determine a way to highlight which observations belong to the same individual in your plot
fev1_plot <- ggplot(data = fev1_sampled, 
                    aes(x = age, y = FEV1, color = id)) +
  geom_point() +
  ggtitle("FEV against age") +
  xlab("age (years)") +
  ylab("FEV1 (L)") +
  theme_classic() +
  scale_color_discrete()+
  geom_smooth(aes(x = age, y = FEV1), method = "lm", se = TRUE, color = "black") 
fev1_plot

#hehehaha

# Activity 7b - How many observations per individual?

# Count the number of times that each `id` is measured and make a bar plot 
count_id<-fev1_sampled %>%
  count(id)

ggplot(data=count_id,aes(x=id, y=n))+
  geom_bar(stat = "identity", fill = "blue", color = "black")+
  ggtitle("count of each id")+
  ylab('times of appearance ')

# Activity 7c - Incorporating height

# Make a plot that shows both FEV1 and age but also includes height
fev1_plot <- ggplot(data = fev1_sampled, 
                    aes(x = age, y = FEV1, color = height)) +
  geom_point() +
  ggtitle("FEV against age") +
  xlab("age (years)") +
  ylab("FEV1 (L)") +
  theme_classic() +
  scale_color_continuous()+
  geom_smooth(aes(x = age, y = FEV1), method = "lm", se = TRUE, color = "black") 
fev1_plot

# Activity 7d - skimr

# Use skimr::skim() to generate a summary table of the data.
# You'll need to install skimr if you don't already have it


# Activity 7e - GGally

# Generate a pairs plot with GGally::ggpairs(), for all columns except id
# You'll need to install GGally if you don't already have it

# Activity 7f - Accounting for repeat measurement

# Build a regression model to look at how FEV1 varies with age, accounting for the
# structure by including a random effect mean for each id and a spline curve for
# the effect of age

