library(rio)
library(here)
library(apyramid)
library(tidyverse)

linelist <- import(here("data","linelist_cleaned.xlsx"))
summary(linelist$age_cat5)

linelist$age_cat5 <- as.factor(linelist$age_cat5)
summary(linelist$age_cat5)



age_pyramid(data = linelist, 
            age_group = "age_cat5", 
            split_by = "gender")

age_pyramid(
  linelist,                    # use case linelist
  "age_cat5",                  # age group column
  "gender",                    # split by gender
  proportional = TRUE,         # percents instead of counts
  pal = c("orange", "purple")  # colors
)

class(linelist)

class(linelist$age)

class(linelist$gender)

summary(linelist$age)[["Median"]]

# View first 100 rows
linelist %>% head(100)

# Show row 5 only
linelist %>% filter(row_number() == 5)

# View rows 2 through 20, and three specific columns (note no quotes necessary on column names)
linelist %>% filter(row_number() %in% 2:20) %>% select(date_onset, outcome, age)
