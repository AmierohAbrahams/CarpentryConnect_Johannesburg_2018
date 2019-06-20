library(tidyverse)
str(surveys)
select(surveys, species_id, weight)              # Slecting specific columns by identifying the names with in the dataset named survey
# dplyr - to select rows


#Selecting rows
filter(surveys, year == 1995)                   # Selecting a specific year using filter
# %>%                                           #cntrl shift m

surveys %>% 
  select(species_id, weight, year) %>% 
  filter(year  == 1995)

OR

surveys %>% 
  filter(year == 1995) %>% 
  select(species_id, weight)

# Select only the rows with species weight less than  5 
# Then select only species id, sex and weight

exercise1 <- surveys %>% 
  filter(weight < 5) %>% 
  select(species_id, weight, sex)
  
# create a new column
new_dataframe <- surveys %>% 
  mutate(weight_kg = weight/1000)       # Adding a column

new_dataframe2 <- surveys %>% 
  mutate(weight_kg = weight/1000, weight_kg2 = weight_kg*2)    # Adding a column and multiplying weight by 2


newdataframe3 <- surveys %>% 
  mutate(weight_kg = weight/1000, weight_kg2 = weight_kg*2) %>% 
  head()

surveys %>% 
  filter(!is.na(weight))%>%   #! - Not
  mutate(weight_kg = weight/1000, weight_kg2 = weight_kg*2) %>% 
  head()

# Splitting the data based on a specific column

mean_sex <- surveys %>% 
  group_by(sex) %>% 
  summarise(mean_weight = mean(weight, na.rm = TRUE))
mean_sex

# Removing the missing values

mean_sex_remove <- surveys %>% 
  filter((!sex == "")) %>% 
  group_by(sex) %>% 
  summarise(mean_weight = mean(weight, na.rm =TRUE))
mean_sex_remove

# Group by two columns
summarised_data <- surveys %>% 
  filter(!sex == "") %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id, sex) %>% 
  summarise(mean_weight = mean(weight),
            min_weight = min(weight),
            max_weight = max(weight))
summarised_data
plot(summarised_data)
barplot(summarised_data$min_weight)

# Counting
surveys %>% 
  count(sex) # Determining the amount of time that males and females appeared in the data

surveys %>% 
  filter((!sex == "")) %>% # Removing the unknown missing values within the daataset
  count(sex)
# filter always work on rows
# ! - not/ exclude
# Keep all the rows for sex where there are no empty strings (Describing the line 77) as a story

#Counting with two variaables the gender and species

surveys %>% 
  filter(!sex == "") %>% 
  count(sex, species) %>% 
  arrange(species,desc(n))

#Some plotting
surveys_plot <- ggplot(surveys, aes(x = weight, y = hindfoot_length)) +
  geom_point(aes(color = species_id))
surveys_plot

surveys %>% 
  filter(sex == "F") %>% 
  count(species) %>% 
  arrange(species,desc(n)) #@ Only looking at females, count females in alll species in desc order

#Reshaping the data

# Downloading a file from the internet and saving it in a portal
# download.file("https://www.dropbox.com/s/n4s3ojxy74wy7hg/surveys_complete.csv?dl=0","data_output/surveys_complete.csv")

#Exercise 
# Creating additional graphs and then pushing it to github
# Additional graph
# Tracking Git changes

dat1 <- surveys_complete %>% 
  group_by(species_id) %>% 
  summarise(mn.weight = mean(weight),
            sd.weight = sd(weight))

ggplot(dat1, aes(x = species_id, y = mn.weight)) +
  geom_col(aes(fill = species_id)) +
  geom_errorbar(aes(ymin = mn.weight - sd.weight, 
                    ymax = mn.weight + sd.weight)) +
  scale_fill_brewer(palette = "Spectral") +
  labs(x = "Species_id", y = "Average weight")









