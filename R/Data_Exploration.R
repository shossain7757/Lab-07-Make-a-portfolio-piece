library(tidyverse)
library(ggplot2)
library(svglite)

clean_data <- read.table(here::here('Data','SEER_breast_cancer_Clean.csv'), header = TRUE, sep = ',')

## Change Variable Types

clean_data <- clean_data |>
  mutate_at(vars(-Year.of.diagnosis,-Survival.months),as.factor)



## Histogram of age of Breast Cancer Patients

age_dsitrbution <- ggplot(clean_data |>
                          group_by(Age_group)|>
                          summarise( N = n()))+
  aes(x=Age_group, y=N) + 
  geom_bar(stat = "identity") +
  coord_flip()+
  labs(title = 'Age distrbution of Breast Cancer Patients')


## Saving the plot


ggsave(here::here("Figures", "Age_Distribution.svg"), 
       age_dsitrbution,
       height = 6,
       width = 7
)


## Age x Race Barplot

agexrace <- ggplot(clean_data |>
                            group_by(Age_group,Race)|>
                            summarise( N = n()))+
  aes(x=Age_group, y=N, fill = Race) + 
  geom_bar(stat = "identity") +
  labs(title = 'Barplot of Age by Race of Breast Cancer Patients')

agexrace <- agexrace + guides(x = guide_axis(angle = 45))

## Saving the plot

ggsave(here::here("Figures", "Age X Race.svg"), 
       agexrace,
       height = 6,
       width = 7
)


## Survival distribution by Race

survivalxrace <- ggplot(clean_data)+
  aes(x=Survival.months, y = Race, fill = Race) + 
  ggridges::geom_density_ridges(size = .2, alpha = .5, scale = 3) +
  labs(title = 'Survival distribution by Race')


## Saving the plot

ggsave(here::here("Figures", "Survival X Race.svg"), 
       survivalxrace,
       height = 6,
       width = 7
)

## Survival distribution by Grade

survivalxgrade <- ggplot(clean_data|>
                           mutate(Cancer_grade = fct_relevel(Cancer_grade,
                                                             "Grade I", "Grade II",
                                                             "Grade III", "Grade IV")))+
  aes(x=Survival.months, y = Cancer_grade, fill = Cancer_grade) + 
  ggridges::geom_density_ridges(size = .2, alpha = .5, scale = 3) +
  labs(title = 'Survival distribution by Cancer_grade')



## Saving the plot

ggsave(here::here("Figures", "Survival X Grades.svg"), 
       survivalxgrade,
       height = 6,
       width = 7
)


## Survival Months by Age_group


survivalxage <- ggplot(clean_data) +
  aes(x = Age_group,
      y = Survival.months,
      color = Age_group) +
  geom_boxplot()


survivalxage <- survivalxage + guides(x = guide_axis(angle = 45))

survivalxage


## Saving the plot

ggsave(here::here("Figures", "Survival X Age.svg"), 
       survivalxage,
       height = 6,
       width = 7
)

## survival month by primary site

survivalxsite <- ggplot(clean_data) +
  aes(x = Primary_site,
      y = Survival.months,
      color = Primary_site) +
  geom_boxplot()


survivalxsite <- survivalxsite + guides(x = guide_axis(angle = 45))

survivalxsite


## Saving the plot

ggsave(here::here("Figures", "Survival X site.svg"), 
       survivalxsite,
       height = 6,
       width = 7
)


## Survival by surgery

survivalxsurgery <- ggplot(clean_data) +
  aes(x = Reason_for_no_surgery,
      y = Survival.months,
      color = Reason_for_no_surgery) +
  geom_boxplot()


survivalxsurgery <- survivalxsurgery + guides(x = guide_axis(angle = 45))

survivalxsurgery


## Survival by Laterality


survivalxlaterality <- ggplot(clean_data) +
  aes(x = Laterality,
      y = Survival.months,
      color = Laterality) +
  geom_boxplot()


survivalxlaterality <- survivalxlaterality + guides(x = guide_axis(angle = 45))

survivalxlaterality


## Survival by Histology type


survivalxhistology <- ggplot(clean_data) +
  aes(x = Histology_Type,
      y = Survival.months,
      color = Histology_Type) +
  geom_boxplot()


survivalxhistology <- survivalxhistology + guides(x = guide_axis(angle = 90))

survivalxhistology

