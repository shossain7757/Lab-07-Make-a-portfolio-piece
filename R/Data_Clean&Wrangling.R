library(tidyverse)

data <- read.table(here::here('Data','SEER_breast_cancer.csv'), header = TRUE, sep = ',')

# Data Cleaning

## Drop Unnecessary Columns 

clean_data <- data |>
  select(-Primary.Site,-Histologic.Type.ICD.O.3,-ICD.O.3.Hist.behav,-ICD.O.3.Hist.behav..malignant,
         -ICCC.site.recode.3rd.edition.IARC.2017,-Site.recode.ICD.O.3.WHO.2008..for.SIRs.,
         -ICCC.site.recode.ICD.O.3.WHO.2008,-ICCC.site.rec.extended.ICD.O.3.WHO.2008,
         -Schema.ID..2018..,-AJCC.ID..2018..,-EOD.Schema.ID.Recode..2010..,
         -Site.recode...rare.tumors,-AYA.site.recode.WHO.2008,-RX.Summ..Surg.Prim.Site..1998..,
         -RX.Summ..Surg.Oth.Reg.Dis..2003..,-AYA.site.recode.2020.Revision,
         -ICCC.site.recode.extended.3rd.edition.IARC.2017,
         -SEER.other.cause.of.death.classification,-COD.to.site.recode)
  


## Rename Some Columns

clean_data <- clean_data |>
  rename(Age_group = Age.recode.with..1.year.olds,
         Race = Race.recode..White..Black..Other.,
         Primary_site = Primary.Site...labeled,
         Cancer_grade = Grade..thru.2017.,
         Cell_behavior = Behavior.recode.for.analysis,
         Cancer_grade_clinical = Grade.Clinical..2018..,
         Cancer_grade_pathological = Grade.Pathological..2018..,
         Histology_Type = Histology.recode...broad.groupings,
         Reason_for_no_surgery = Reason.no.cancer.directed.surgery,
         Cause_of_death = SEER.cause.specific.death.classification) 
  
  


## Label Missing Values 



clean_data |>
  select(everything())|>
  unlist()|>
  unique()

clean_data |>
  mutate(across(where(is.character), ~na_if(., list("Unknown","Blank(s)"))))|>
  unlist()|>
  unique()



## Change Variable Types

clean_data <- clean_data |>
  mutate_at(vars(-Year.of.diagnosis,-Survival.months),factor)

clean_data <- clean_data |>
  mutate_at(vars(Survival.months),as.numeric)

  

