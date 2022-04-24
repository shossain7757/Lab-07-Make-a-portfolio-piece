library(tidyverse)
library(naniar)

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
         -SEER.other.cause.of.death.classification,-COD.to.site.recode,
         -Grade.Clinical..2018..,-Grade.Pathological..2018..)
  


## Rename Some Columns

clean_data <- clean_data |>
  rename(Age_group = Age.recode.with..1.year.olds,
         Race = Race.recode..White..Black..Other.,
         Primary_site = Primary.Site...labeled,
         Cancer_grade = Grade..thru.2017.,
         Cell_behavior = Behavior.recode.for.analysis,
         Histology_Type = Histology.recode...broad.groupings,
         Reason_for_no_surgery = Reason.no.cancer.directed.surgery,
         Cause_of_death = SEER.cause.specific.death.classification) 
  
  


## Label Missing Values 



clean_data |>
  select(everything())|>
  unlist()|>
  unique()


clean_data <- clean_data |>
  replace_with_na_if(.predicate = is.character,
                     condition = ~.x %in% (c("Unknown","Blank(s)","N/A not seq 0-59"))) 

## Drop missing values

clean_data <- clean_data |>
  drop_na()

## Change Variable Types

clean_data <- clean_data |>
  mutate_at(vars(-Year.of.diagnosis,-Survival.months),as.factor)

clean_data <- clean_data |>
  mutate_at(vars(Survival.months),as.numeric)


## Recode Values of Some Variables

## Primary_Site

clean_data |>
  select(Primary_site)|>
  unlist()|>
  unique()
  

clean_data <- clean_data |>
  mutate(
    Primary_site = recode(Primary_site, 
                          "C50.4-Upper-outer quadrant of breast" = "Upper-outer quadrant",
                          "C50.5-Lower-outer quadrant of breast" = "Lower-outer quadrant",
                          "C50.9-Breast, NOS" = "Breast, NOS",
                          "C50.8-Overlapping lesion of breast" = "Overlapping lesion",
                          "C50.3-Lower-inner quadrant of breast" = "Lower-inner quadrant",
                          "C50.6-Axillary tail of breast" = "Axillary tail",
                          "C50.2-Upper-inner quadrant of breast" = "Upper-inner quadrant",
                          "C50.1-Central portion of breast" = "Central portion",
                          "C50.0-Nipple" = "Nipple"),
    .after = Year.of.diagnosis
  )



## Race


clean_data |>
  select(Race)|>
  unlist()|>
  unique()


clean_data <- clean_data |>
  mutate(
    Race = recode(Race, 
                  "White" = "White",
                  "Black" = "Black",
                  "Other (American Indian/AK Native, Asian/Pacific Islander)" = "Other"),
    .after = Age_group
  )


## Histology Type

clean_data |>
  select(Histology_Type)|>
  unlist()|>
  unique()

clean_data <- clean_data |>
  mutate(
    Histology_Type = recode(Histology_Type, 
                            "8500-8549: ductal and lobular neoplasms" = "ductal and lobular neoplasms",
                            "8440-8499: cystic, mucinous and serous neoplasms" = "cystic, mucinous and serous neoplasms",
                            "8140-8389: adenomas and adenocarcinomas" = "adenomas and adenocarcinomas",
                            "8560-8579: complex epithelial neoplasms" = "complex epithelial neoplasms",
                            "8050-8089: squamous cell neoplasms" = "squamous cell neoplasms",
                            "8390-8429: adnexal and skin appendage neoplasms" = "adnexal and skin appendage neoplasms",
                            "9120-9169: blood vessel tumors" = "blood vessel tumors",
                            "8010-8049: epithelial neoplasms, NOS" = "epithelial neoplasms, NOS",
                            "8930-8999: complex mixed and stromal neoplasms" = "complex mixed and stromal neoplasms",
                            "8120-8139: transitional cell papillomas and carcinomas" = "transitional cell papillomas and carcinomas",
                            "9000-9039: fibroepithelial neoplasms" = "fibroepithelial neoplasms",
                            "8810-8839: fibromatous neoplasms" = "fibromatous neoplasms",
                            "8800-8809: soft tissue tumors and sarcomas, NOS" = "soft tissue tumors and sarcomas, NOS",
                            "8550-8559: acinar cell neoplasms" = "acinar cell neoplasms",
                            "8000-8009: unspecified neoplasms" = "unspecified neoplasms",
                            "8890-8929: myomatous neoplasms" = "myomatous neoplasms",
                            "9180-9249: osseous and chondromatous neoplasms" = "osseous and chondromatous neoplasms",
                            "8430-8439: mucoepidermoid neoplasms" = "mucoepidermoid neoplasms"),
    .after = Diagnostic.Confirmation
  )

## Cancer Grade

clean_data |>
  select(Cancer_grade)|>
  unlist()|>
  unique()

clean_data <- clean_data |>
  mutate(
    Cancer_grade = recode(Cancer_grade, 
                  "Moderately differentiated; Grade II" = "Grade II",
                  "Poorly differentiated; Grade III" = "Grade III",
                  "Well differentiated; Grade I" = "Grade I",
                  "Undifferentiated; anaplastic; Grade IV" = "Grade IV"),
    .after = Cell_behavior
  )

## Output the cleaned data


write_csv(
  clean_data, 
  here::here('Data','SEER_breast_cancer_Clean.csv')
)

