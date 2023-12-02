setwd("C:/Users/14681/Desktop/EcIA/Arran/data/Terrestrial insert")
Insect<-read.csv("insectquality.csv")
library(stringr)
#comparison of south and north(barplot)
ggplot(data = Insect, aes(x = family)) +
  geom_bar(aes(y = north, fill = "North"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = south, fill = "South"), stat = "identity", position = "dodge") +
  labs(x = "Invertebrates Family", y = "Quantity", title = "Quantities of Invertebrates Family in North and South") +
  scale_fill_manual(values = c("North" = "pink", "South" = "lightgreen"), name = "Region") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1)) +  
  labs(fill = "Region") +
  theme(legend.position = "bottom")

#piechart of north
Insectnorth<-read.csv("northinsectquality.csv")
Insectnorth$Percentage <- Insectnorth$organismQuantity / sum(Insectnorth$organismQuantity) * 100

library(viridis)

colors <- viridis_pal()(37)

ggplot(data = Insectnorth, aes(x = "", y = Percentage, fill = family)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Quantities of invertebrates family in North", x = NULL, y = NULL) +
  theme_minimal() +
  theme(legend.position = "bottom", plot.title = element_text(hjust = 0.5)) +
  scale_fill_manual(values = colors, name = "")

#piechart of south
Insectsouth<-read.csv("southinsectquality.csv")
Insectsouth$Percentage <- Insectsouth$organismQuantity / sum(Insectsouth$organismQuantity) * 100

library(viridis)

colors <- viridis_pal()(37)

ggplot(data = Insectsouth, aes(x = "", y = Percentage, fill = family)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Quantities of invertebrates family in South", x = NULL, y = NULL) +
  theme_minimal() +
  theme(legend.position = "bottom", plot.title = element_text(hjust = 0.5)) +
  scale_fill_manual(values = colors, name = "")