library(tidyverse)
library(ggplot2)
library(ggbeeswarm)
library(ggthemes)
library(gganimate)

bl2map <- read.csv("bl2map.csv")
bl2mapv <- as.character(bl2map$bl.name)
names(bl2mapv) <- bl2map$map.name

bl_map_data <- map_data("world") %>%
  mutate(
    region = case_when(
      subregion == "Macao" ~ "Macao",
      subregion == "Hong Kong" ~ "Hong Kong",
      TRUE ~ region
    )) %>%
  mutate(
    country = recode(region, !!!bl2mapv)
  )

bl <- read.csv("BL_v3_MF1564.csv")

label_M <- function(x) sprintf("%3.0fM",x/1e3)

bl.map.plot <- function(theyear, abs = FALSE) {
  bl %>%
  filter(year == theyear) %>%
  select(country,year,lh,pop) %>%
  mutate(lh = lh / 100) %>%
  { if(abs) mutate(., lh = lh * pop) else .} %>%
  left_join(bl_map_data) %>% 
  ggplot(aes(x = long, y = lat, group = group, fill = lh)) +
  geom_polygon(colour = "black", size=0.1) +
  scale_fill_distiller(palette="Purples", na.value = "white", direction=1, 
                       labels = ifelse(abs, label_M , scales::percent),
                       name ="") +
  theme_void() + theme(
    panel.grid.major.y = element_blank(),
    legend.position = "right",
    #plot.margin = margin(1, 2, 1, 4, "cm"),
    plot.title=element_text(size=25, hjust=0.5, vjust=1, face="bold", colour="grey"),
    plot.subtitle=element_text(size=18, hjust=0.5, vjust=1, face="italic", color="grey"),
    plot.caption=element_text(size=16, hjust=0.5, vjust=1, face="italic", color="grey")
  )
}

#bl.map.plot(2015, abs = TRUE)
