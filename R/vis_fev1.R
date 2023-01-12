packages <- c("dplyr",  "tidyr", "tidyverse", "mosaicData")
install.packages(setdiff(packages, rownames(installed.packages())))
lapply(packages, library, character.only = TRUE, quietly = T)
rm(packages)


#  Chart showing relationship between FEV1 and age

data(fev1)
fev1_temp_plot <- ggplot(data = fev1,
                          aes(x = age, y = FEV1)) + geom_point()



# read the data in
fev1 <- read_csv("data/fev1.csv", col_types = list('id' = 'f'))

# sample the data so that we have 20 patients with more than 6 observations

fev1_sampled <- fev1 %>% 
    count(id) %>%
    filter(n > 6) %>%
    slice_sample(n = 20) %>%
    select(id) %>%
    inner_join(fev1)

fev1_sampled

# Activity 5 - A simple scatter plot

# Calculate the correlation between age and FEV1
# (yes, this isn't strictly correct because there's repeated measures)


# Build a plot that shows the relationship between FEV1 and age
fev1_plot <- ggplot(fev1_sampled,
       aes(x = age,
           y = FEV1)) +
  geom_point(size = 3,
             alpha = .6) +
  labs(title = "Relationship between FEV1 and age")

fev1_plot

# Activity 6 - Improving the plot

# Add meaningful labels for the $x$ and $y$ axes, including units, and change the plot's colour theme from the default.

# Add a smooth line of best fit to the plot. 


# Activity 7

# Activity 7a - Showing further structure

# Determine a way to highlight which observations belong to the same individual in your plot


# Activity 7b - How many observations per individual?

# Count the number of times that each `id` is measured and make a bar plot 


# Activity 7c - Incorporating height

# Make a plot that shows both FEV1 and age but also includes height


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

