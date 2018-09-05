library(tidyverse)
surveys_complete <- read_csv("data_output/surveys_complete.csv")
# plotting with ggplot
# Flexible
# ggplot you can add layers, so could first plot points
# then add lines to point 
#bla bla bla....

ggplot(data = surveys_complete)

ggplot(data = surveys_complete, aes(x =weight, y = hindfoot_length)) +
  geom_point(aes(color = species_id), alpha = 0.1)
# R has different colour pallets internally....
# Can also specify other pallets -colour Cheatsheet
# aes # Means the features of the graph 

#Box and wisker plot when having distinct values -eg. Species ID
# Here we plot along columns
ggplot(data = surveys_complete, aes(x = species_id, y = weight)) +
  geom_boxplot(fill = "green") +
  facet_grid(~sex) +
  theme_bw()

?facet_grid

# How to interpret the images

#overlaying point on a boxplot
#Using geom jitter
ggplot(data = surveys_complete, aes(x = species_id, y = weight)) +
  geom_jitter(alpha = 0.1, colour = "salmon") +
  geom_boxplot(fill = "green") +
  facet_grid(~sex) +
  theme_bw()

# Yearly counts
yearly_counts <- surveys_complete %>% 
  count(year, species_id)  # Count creates a new column (n) with the total number

# Over years of studies how did the species vary in number etc
Coolplot <- ggplot(yearly_counts, aes(x = year, y = n, group = species_id)) +
  geom_line(aes(colour = species_id)) +
  facet_wrap(~ species_id) +
  theme_bw()
Coolplot


ggsave("fig_output/Coolplot.png") # Specifying the folder to save plot

