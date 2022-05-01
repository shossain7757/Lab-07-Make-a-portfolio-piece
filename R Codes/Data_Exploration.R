library(tidyverse)
library(ggplot2)
library(svglite)

clean_data <- read.table(here::here('Data','SEER_breast_cancer_Clean.csv'), header = TRUE, sep = ',')

## Change Variable Types

clean_data <- clean_data |>
  mutate_at(vars(-Year.of.diagnosis,-Survival.months),as.factor)



## Histogram of age of Breast Cancer Patients

age_distribution <- ggplot(clean_data |>
                          group_by(Age_group)|>
                          summarise( N = n()))+
  aes(x=Age_group, y=N) + 
  geom_bar(stat = "identity") +
  coord_flip()+
  labs(title = 'Age distrbution of Breast Cancer Patients')

age_distribution

## Saving the plot

## Vector format

ggsave(here::here("Outputs", "Figures", "Age_Distribution.svg"), 
       age_distribution,
       height = 6,
       width = 7
)


## pdf format

ggsave(here::here("Outputs", "Figures", "Age_Distribution.pdf"),
       age_distribution,
       height = 6,
       width = 7)

## bitmap format

ggsave(here::here("Outputs", "Figures", "Age_Distribution.bmp"),
       age_distribution,
       height = 6,
       width = 7)



## Age x Race Barplot

agexrace <- ggplot(clean_data |>
                            group_by(Age_group,Race)|>
                            summarise( N = n()))+
  aes(x=Age_group, y=N, fill = Race) + 
  geom_bar(stat = "identity") +
  labs(title = 'Barplot of Age by Race of Breast Cancer Patients')

agexrace <- agexrace + guides(x = guide_axis(angle = 45))

agexrace



## Saving the plot


## vector format

ggsave(here::here("Outputs", "Figures", "Age X Race.svg"), 
       agexrace,
       height = 6,
       width = 7
)


## pdf format

ggsave(here::here("Outputs", "Figures", "Age X Race.pdf"), 
       agexrace,
       height = 6,
       width = 7
)


## bmp format


ggsave(here::here("Outputs", "Figures", "Age X Race.bmp"), 
       agexrace,
       height = 6,
       width = 7
)


## Survival distribution by Race

survivalxrace <- ggplot(clean_data)+
  aes(x=Survival.months, y = Race, fill = Race) + 
  ggridges::geom_density_ridges(size = .2, alpha = .5, scale = 3) +
  labs(title = 'Survival distribution by Race')

survivalxrace



## Saving the plot



## vector format

ggsave(here::here("Outputs", "Figures", "Survival X Race.svg"), 
       survivalxrace,
       height = 6,
       width = 7
)


## pdf format

ggsave(here::here("Outputs", "Figures", "Survival X Race.pdf"), 
       survivalxrace,
       height = 6,
       width = 7
)

## bmp format

ggsave(here::here("Outputs", "Figures", "Survival X Race.bmp"), 
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

survivalxgrade




## Saving the plot

## vector format

ggsave(here::here("Outputs", "Figures", "Survival X Grades.svg"), 
       survivalxgrade,
       height = 6,
       width = 7
)


## pdf format

ggsave(here::here("Outputs", "Figures", "Survival X Grades.pdf"), 
       survivalxgrade,
       height = 6,
       width = 7
)


## bmp format

ggsave(here::here("Outputs", "Figures", "Survival X Grades.bmp"), 
       survivalxgrade,
       height = 6,
       width = 7
)




## Survival Months by Age_group


survivalxage <- ggplot(clean_data) +
  aes(x = Age_group,
      y = Survival.months,
      color = Age_group) +
  geom_boxplot()+
  labs(title = "Boxplot of Survival Months by Age Group")


survivalxage <- survivalxage + guides(x = guide_axis(angle = 45))

survivalxage


## Saving the plot


## vector format

ggsave(here::here("Outputs", "Figures", "Survival X Age.svg"), 
       survivalxage,
       height = 6,
       width = 7
)


## pdf format

ggsave(here::here("Outputs", "Figures", "Survival X Age.pdf"), 
       survivalxage,
       height = 6,
       width = 7
)


## bmp format


ggsave(here::here("Outputs", "Figures", "Survival X Age.bmp"), 
       survivalxage,
       height = 6,
       width = 7
)



## survival month by primary site

survivalxsite <- ggplot(clean_data) +
  aes(x = Primary_site,
      y = Survival.months,
      color = Primary_site) +
  geom_boxplot()+
  labs(title = "Boxplot of Survival Months by Primary Site")


survivalxsite <- survivalxsite + guides(x = guide_axis(angle = 45))

survivalxsite


## Saving the plot


## vector format

ggsave(here::here("Outputs", "Figures", "Survival X site.svg"), 
       survivalxsite,
       height = 6,
       width = 7
)


## pdf format

ggsave(here::here("Outputs", "Figures", "Survival X site.pdf"), 
       survivalxsite,
       height = 6,
       width = 7
)


## bmp format


ggsave(here::here("Outputs", "Figures", "Survival X site.bmp"), 
       survivalxsite,
       height = 6,
       width = 7
)



## Survival by surgery

survivalxsurgery <- ggplot(clean_data) +
  aes(x = Surgery,
      y = Survival.months,
      color = Surgery) +
  geom_boxplot()+
  labs(title = "Boxplot of Survival Months by Surgery")


survivalxsurgery <- survivalxsurgery + guides(x = guide_axis(angle = 45))

survivalxsurgery



## Saving the plot

## vector format

ggsave(here::here("Outputs", "Figures", "Survival X Surgery.svg"),
       survivalxsurgery,
       height = 6,
       width = 5)


## pdf format

ggsave(here::here("Outputs", "Figures", "Survival X Surgery.pdf"),
       survivalxsurgery,
       height = 6,
       width = 5)




## bmp format


ggsave(here::here("Outputs", "Figures", "Survival X Surgery.bmp"),
       survivalxsurgery,
       height = 6,
       width = 5)



## Survival by Laterality


survivalxlaterality <- ggplot(clean_data) +
  aes(x = Laterality,
      y = Survival.months,
      color = Laterality) +
  geom_boxplot()+
  labs(title = "Boxplots of Survival Months by Laterality")


survivalxlaterality <- survivalxlaterality + guides(x = guide_axis(angle = 45))

survivalxlaterality

## Saving the plot

## vector format


ggsave(here::here("Outputs", "Figures","Survival X Laterality.svg"),
       survivalxlaterality,
       height = 6,
       width = 10)


## pdf format

ggsave(here::here("Outputs", "Figures","Survival X Laterality.pdf"),
       survivalxlaterality,
       height = 6,
       width = 10)



## bmp format


ggsave(here::here("Outputs", "Figures","Survival X Laterality.bmp"),
       survivalxlaterality,
       height = 6,
       width = 10)


## Survival by Histology type


survivalxhistology <- ggplot(clean_data) +
  aes(x = Histology_Type,
      y = Survival.months,
      color = Histology_Type) +
  geom_boxplot()+
  labs(title = "Boxplot of Survival Months by Histology Type")


survivalxhistology <- survivalxhistology + guides(x = guide_axis(angle = 90))

survivalxhistology

## Saving the plot

## vector format

ggsave(here::here("Outputs", "Figures", "Survival X Histology.svg"),
       survivalxhistology,
       height = 10,
       width = 10)

## pdf format

ggsave(here::here("Outputs", "Figures", "Survival X Histology.pdf"),
       survivalxhistology,
       height = 10,
       width = 10)


## bmp format


ggsave(here::here("Outputs", "Figures", "Survival X Histology.bmp"),
       survivalxhistology,
       height = 10,
       width = 10)


## Survival by Cause of Death


survivalxcod <- ggplot(clean_data) +
  aes(x = Cause_of_death,
      y = Survival.months,
      color = Cause_of_death) +
  geom_boxplot()+
  labs(title = "Boxplot of Survival Months by Cause of Death")


survivalxcod <- survivalxcod + guides(x = guide_axis(angle = 45))

survivalxcod

## Two Way table proportions


clean_data |>
  group_by(Histology_Type, Surgery) |>
  summarise(n=n()) |>
  mutate(prop = n/sum(n)) |>
  subset(select = c("Surgery", "Histology_Type", "prop"))|>
  spread(Surgery, prop) 




clean_data |>
  group_by(Race, Cause_of_death) |>
  summarise(n=n()) |>
  mutate(prop = n/sum(n)) |>
  subset(select = c("Race", "Cause_of_death", "prop"))|>
  spread(Cause_of_death, prop) 

