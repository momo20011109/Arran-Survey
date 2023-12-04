setwd("C:/Users/14681/Desktop/EcIA/Arran/data/metadata/Aquatic invertebrates")
Aquatic<-read.csv("aquatic.csv")
##comparison of south and north(barplot)
ggplot(data = Aquatic, aes(x = order)) +
  geom_bar(aes(y = north, fill = "North"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = south, fill = "South"), stat = "identity", position = "dodge") +
  labs(x = "Invertebrates order", y = "Quantity", title = "Invertebrates order") +
  scale_fill_manual(values = c("North" = "lightblue", "South" = "purple"), name = "Region") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) +  
  labs(fill = "Region") 
#piechart of north
Aquaticnorth<-read.csv("aquaticinvertnorth.csv")
Aquaticnorth$Percentage <- Aquaticnorth$organismQuantity / sum(Aquaticnorth$organismQuantity) * 100
ggplot(data = Aquaticnorth, aes(x = "", y = Percentage, fill = order)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Aquatic invertebrates orders in North", x = NULL, y = NULL) +
  theme_minimal() +
  theme(legend.position = "bottom") +
  theme(plot.title = element_text(hjust = 0.5))+
  scale_fill_brewer(palette = "Set3", name = "") +
  scale_y_continuous(breaks = NULL)
#piechart of south
Aquaticsouth<-read.csv("aquaticinvertsouth.csv")
Aquaticsouth$Percentage <- Aquaticsouth$organismQuantity / sum(Aquaticsouth$organismQuantity) * 100
ggplot(data = Aquaticsouth, aes(x = "", y = Percentage, fill = order)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Aquatic invertebrates orders in South", x = NULL, y = NULL) +
  theme_minimal() +
  theme(legend.position = "bottom") +
  theme(plot.title = element_text(hjust = 0.5))+
  scale_fill_brewer(palette = "Set3", name = "") +
  scale_y_continuous(breaks = NULL)
