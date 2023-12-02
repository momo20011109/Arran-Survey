setwd("C:/Users/14681/Desktop/EcIA/Arran/data")

#Birds
#data of transects
BirdsT<-read.csv("Associated occurences(bird transect data).csv")
#data of point counts
BirdsP<-read.csv("Associated occurences(bird point count data).csv")
#data of incidental sightings
BirdsI<-read.csv("Incidental sightings.csv")
library(dplyr)
library(stats)
#data of north plot
north_birds_T <- BirdsT %>% filter(eventID %in% c("n1birds", "n2birds", "n3birds"))
north_birds_P <- BirdsP %>% filter(eventID %in% c("pointN"))
north_birds_I <- BirdsI %>% filter(eventID %in% c("n1birds", "n2birds", "n3birds","pointN"))

#data of south plot
south_birds_T <- BirdsT %>% filter(eventID %in% c("s1birds", "s2birds", "s3birds"))
south_birds_P <- BirdsP %>% filter(eventID %in% c("pointS"))
south_birds_I <- BirdsI %>% filter(eventID %in% c("s1birds", "s2birds", "s3birds","pointS","SLP1"))

#calculate species biodiversity of north
north_bird_biodiversity <- length(unique(c(north_birds_T$scientificName, north_birds_P$scientificName,north_birds_I$ScientificName)))

#calculate species biodiversity of south
south_bird_biodiversity <- length(unique(c(south_birds_T$scientificName, south_birds_P$scientificName,south_birds_I$ScientificName)))


#Trees
Trees<-read.csv("Associated Occurrences(trees transects).csv")

north_trees <- Trees %>% filter(eventID %in% c("n1trees", "n2trees", "n3trees"))
south_trees <- Trees %>% filter(eventID %in% c("s1trees", "s2trees", "s3trees"))
#calculate trees species biodiversity of north
north_trees_biodiversity <- length(unique(north_trees$scientificName))

#calculate trees species biodiversity of south
south_trees_biodiversity <- length(unique(south_trees$scientificName))


#Terrestrial invertebrates(FAMILY)
TInvert<-read.csv("Occurences (terrestrial invert data).csv")
north_Tinvert <- TInvert %>% filter(eventID %in% c("NHS1", "NHS2", "NHS3","NHS4","NHS5","NLP1","NLP2","NLP3","NLP4","NLP5","NLP6","NLP7","NLS1","NLS2","NLS3","NLS4","NLS5","NLS6","NMS1","NMS2","NMS3","NMS4","NMS5","NMS6","NMS7","NMS8"))
south_Tinvert <- TInvert %>% filter(eventID %in% c("SHS1", "SHS2", "SHS3", "SHS4", "SHS5", "SHS6", "SHS7", "SLP2", "SLP3", "SLP5", "SLS2", "SLS4", "SLS5", "SLS6", "SMS1", "SMS2", "SMS3", "SMS4", "SMS5"))

#calculate terrestrial invertebrates family biodiversity of north
north_Tinvert_familybiodiversity <- length(unique(north_Tinvert$family))

#calculate terrestrial invertebrates family biodiversity of south
south_Tinvert_familybiodiversity <- length(unique(south_Tinvert$family))


#Aquatic invertebrates(Order)
AInvert<-read.csv("Occurences (aquatic inverts).csv")

north_Ainvert <- AInvert %>% filter(eventID %in% c("N1Stream", "N2Stream", "N3Stream","N4Stream","N5Stream"))
south_Ainvert <- AInvert %>% filter(eventID %in% c("S1Stream", "S2Stream", "S3Stream","S4Stream","S5Stream","S1Marsh","S2Marsh","S3Marsh","S4Marsh","S5Marsh","S6Marsh"))

#calculate aquatic invertebrates order biodiversity of north
north_Ainvert_orderbiodiversity <- length(unique(north_Ainvert$order))

#calculate aquatic invertebrates order biodiversity of south
south_Ainvert_orderbiodiversity <- length(unique(south_Ainvert$order))


#Bats
North1Bats<-read.csv("Night_14-15_North(Audiomoths).csv")
North2Bats<-read.csv("Night_15-16_North(Audiomoths).csv")
South1Bats<-read.csv("Night_12-13_South (Audiomoths).csv")
South2Bats<-read.csv("Night_13-14_South (Audiomoths).csv")

#calculate bats biodiversity of north
north_bats_biodiversity <- length(unique(c(North1Bats$class,North2Bats$class)))

#calculate bats biodiversity of south
south_bats_biodiversity <- length(unique(c(South1Bats$class,South2Bats$class)))


#Other species
#data of incidental sightings
OtherI<-read.csv("Incidental sightings.csv")
#data of camera trap
OtherC<-read.csv("Occurences (Camera Traps).csv")

#data of north plot
north_OtherI <- OtherI %>% filter(eventID %in% c("Top of Northern Plot"))
north_OtherC <- OtherC %>% filter(eventID %in% c("north1-1","north7-1","north7-2","north7-3","north5-1","north5-2","north9-1"))
#data of south plot
south_OtherI <- OtherI %>% filter(eventID %in% c("SLP1", "SLP8", "SLP7","Southern Moorland","Marsh"))
south_OtherC <- OtherC %>% filter(eventID %in% c("south2-1","south4-1","south5-1","south5-2","south5-3"))

#calculate other species biodiversity of north
north_other_biodiversity <- length(unique(c(north_OtherI$ScientificName,north_OtherC$ScientificName)))

#calculate other species biodiversity of south
south_other_biodiversity <- length(unique(c(south_OtherI$ScientificName,south_OtherC$ScientificName)))




