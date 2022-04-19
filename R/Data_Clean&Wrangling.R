library(tidyverse)

data <- read.table(here::here('Data','SEER_breast_cancer.csv'), header = TRUE, sep = ',')

# Data Cleaning

## Drop Repetitive Columns 

names(data)

## Rename Some Columns

data |>
  rename(Age_group = Age.recode.with..1.year.olds,
         Race = Race.recode..White..Black..Other.,
         Cancer_site_of_AYA = AYA.site.recode.2020.Revision,
         Tumor_type = ICCC.site.recode.3rd.edition.IARC.2017,
         Primary_site = Primary.Site...labeled,
         Histology_code = Histologic.Type.ICD.O.3,
         Cancer_grade = Grade..thru.2017.,
         ) |>
  names()
  





