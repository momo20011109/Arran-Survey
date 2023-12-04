setwd("C:/Users/14681/Desktop/EcIA/Arran/data/metadata/Birds")
Birds<-read.csv("Birds_survey_comparison.csv")
library(ggplot2)
install.packages("stringr")
library(stringr)

#highlight protected/invasive/priority species
species_to_highlight <- c("Anthus pratensis", "Parus major", "Prunella modularis","Troglodytes troglodytes","Falco tinnunculus")
#comparison of south and north
ggplot(data = Birds, aes(x = scientificName)) +
  geom_bar(aes(y = North, fill = "North"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = South, fill = "South"), stat = "identity", position = "dodge") +
  labs(x = "Scientific species name", y = "Quantity", title = "Quantities of bird species in North and South") +
  scale_fill_manual(values = c("North" = "orange", "South" = "lightblue"), name = "Region") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 10)) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(fill = "Region") +
  geom_text(data = subset(Birds, scientificName %in% species_to_highlight),
            aes(x = scientificName, y = 0, label = "★"), 
            vjust = -1, color = "red", size = 4)+
  annotate("text", x = Inf, y = Inf, hjust = 1, vjust = 1,
           label = "★ Protected species", color = "red", size = 3) +
  theme(legend.position = "bottom")
#piechart of north bird data
BirdsN<-read.csv("Birds_quantity_north.csv")
BirdsN$Percentage <- BirdsN$Quantity / sum(BirdsN$Quantity) * 100
colors <- viridis_pal()(14)
ggplot(data = BirdsN, aes(x = "", y = Percentage, fill = Scientific_species_name)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Quantities of bird species in North", x = NULL, y = NULL) +
  theme_minimal() +
  theme(legend.position = "bottom") +
  theme(plot.title = element_text(hjust = 0.5))+
  scale_fill_manual(values = colors, name = "") +
  scale_y_continuous(breaks = NULL)
#piechart of south bird data
BirdsS<-read.csv("Birds_quantity_south.csv")
BirdsS$Percentage <- BirdsS$Quantity / sum(BirdsS$Quantity) * 100
colors <- viridis_pal()(14)
ggplot(data = BirdsS, aes(x = "", y = Percentage, fill = Scientific_species_name)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Quantities of bird species in South", x = NULL, y = NULL) +
  theme_minimal() +
  theme(legend.position = "bottom") +
  theme(plot.title = element_text(hjust = 0.5))+
  scale_fill_manual(values = colors, name = "") +
  scale_y_continuous(breaks = NULL)