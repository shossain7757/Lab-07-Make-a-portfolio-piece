# SEER Breast Cancer Dataset

The Surveillance, Epidemiology, and End Results (SEER) program of the National Cancer Institute collects cancer incidence and survival information covering over 30% of the population in the U.S. The variables in the dataset mostly provide information on the primary diagnostic history of the patient e.g. primary site, laterality etc and their corresponding information on surgery. The dataset also includes survival months for each of those patients and whether patient died of the cancer or not. For this report we took a subset of breast cancer patients as breast cancer as a disease case is the highest cause of death behind cardiovascular disease. The table below shows the list of variables available along with a description.

The *SEER_breast_cancer.csv* is the raw dataset that contains all the variables. The *SEER_breast_cancer_Clean.csv* is the cleaned dataset which was further used in exploratory analysis.

Variable | Type 
------|---- 
`Age.recode.with..1.year.olds` | Chr 
`Race.recode..White..Black..Other.` | Chr 
`Sex`  | Chr
`Year.of.diagnosis` | Chr
`AYA.site.recode.2020.Revision` | Chr
`ICCC.site.recode.3rd.edition.IARC.2017` | Chr
`Primary.Site...labeled` | Chr
`Primary.Site` | Chr
`Histologic.Type.ICD.O.3` | Chr
`Behavior.recode.for.analysis` | Chr
`Grade..thru.2017.` | Chr
`Grade.Clinical..2018..` | Chr
`Grade.Pathological..2018..` | Chr
`Laterality` | Chr
`Diagnostic.Confirmation` | Chr
`ICD.O.3.Hist.behav` | Chr
`ICD.O.3.Hist.behav..malignant` | Chr
`Histology.recode...broad.groupings` | Chr
`ICCC.site.recode.extended.3rd.edition.IARC.2017` | Chr
`Site.recode.ICD.O.3.WHO.2008..for.SIRs.` | Chr
`ICCC.site.recode.ICD.O.3.WHO.2008` | Chr
`ICCC.site.rec.extended.ICD.O.3.WHO.2008` | Chr
`Schema.ID..2018..` | Chr
`AJCC.ID..2018..` | Chr
`EOD.Schema.ID.Recode..2010..` | Chr
`Site.recode...rare.tumors` | Chr
`AYA.site.recode.WHO.2008` | Chr 
`RX.Summ..Surg.Prim.Site..1998..` | Chr
`RX.Summ..Surg.Oth.Reg.Dis..2003..` | Chr
`Reason.no.cancer.directed.surgery` | Chr
`COD.to.site.recode` | Chr
`SEER.cause.specific.death.classification` | Chr
`SEER.other.cause.of.death.classification` | Chr
`Survival.months` | Int