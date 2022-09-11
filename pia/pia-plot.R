source("pia.R")

theme_cpesr_setup(authors = "Julien Gossa, Camille Nous", camille=FALSE, source = "data.enseignementsup-recherche.gouv.fr", base_family = "" )
theme_set(theme_cpesr(base_family = "") + theme(legend.position="right", plot.title = element_blank()))


étiquettes.pal = RColorBrewer::brewer.pal(4,'Paired')
#étiquettes.pal = ggthemes::colorblind_pal()(4)[c(2,1,3,4)]
étiquettes.pal = c(étiquettes.pal[2],étiquettes.pal[1],étiquettes.pal[3:4])

## 

pia.total <- anr %>%
  group_by(exercice,étiquettes) %>%
  summarise(ANR.PIA = sum(ANR.PIA, na.rm = TRUE) / 1e6) %>%
  mutate(étiquettes = fct_rev(étiquettes)) %>%
  ggplot(aes(x=exercice,y=ANR.PIA,fill=étiquettes)) +
  geom_col() +
  xlab("exercice") + ylab("ANR PIA (M€)") +
  scale_fill_manual(values=rev(étiquettes.pal), name="Labellisation") +
  ggtitle("Répartition des montants du PIA distribués par l'ANR aux établissements de l'ESR")

pia.total

## 


pia.univ <- anr.pivot %>% 
  mutate(Valeur = Valeur / 1e6) %>%
  filter(Indicateur == "ANR PIA") %>%
  filter(!is.na(Valeur)) %>%
  
  ggplot(aes(x=reorder(etab_label,-Valeur),y=Valeur,fill=étiquettes)) +
  geom_col() +
  #geom_text(aes(label=etablissement), y=0, angle=90, hjust=0, size=2) +
  facet_grid(Indicateur~.) +
  ylab("Montant (M€)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  theme(axis.text.x = element_text(angle=90,hjust=1, size=5)) +
  ggtitle("Répartition des montants du PIA entre les universités")

pia.univ


##


all.univ <- anr.pivot %>% 
  mutate(Valeur = Valeur / 1e6) %>%
  filter(Indicateur %in% c("ANR PIA","SCSP", "RP","PFE")) %>%
  
  ggplot(aes(x=reorder(etab_label,-Valeur, FUN=first),y=Valeur,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~.) +
  ylab("Montant (M€)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  theme(axis.text.x = element_blank())

all.univ

##

pfe.univ <- anr.pivot %>% 
  mutate(Valeur = Valeur / 1e6) %>%
  filter(Indicateur %in% c("PFE")) %>%
  
  ggplot(aes(x=reorder(etab_label,rang.pia, FUN=first),y=Valeur,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~.) +
  ylab("Montant (M€)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  theme(axis.text.x = element_text(angle=90,hjust=1, size=5)) +
  ggtitle("Répartition des montants du PIA entre les universités")

pfe.univ

##

pfe.univ.sort <- anr.pivot %>% 
  mutate(Valeur = Valeur / 1e6) %>%
  filter(Indicateur %in% c("PFE")) %>%
  
  ggplot(aes(x=reorder(etab_label,-Valeur, FUN=first),y=Valeur,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~.) +
  ylab("Montant (M€)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  theme(axis.text.x = element_text(angle=90,hjust=1, size=5)) +
  ggtitle("Répartition des montants du PIA entre les universités")

pfe.univ.sort


##

pfe.univ.etu.ens <- anr.pivot %>% 
  filter(Indicateur %in% c("PFE","étudiants","titulaires")) %>%
  
  ggplot(aes(x=reorder(etab_label,-Valeur, FUN=first),y=Valeur,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~., scales = "free_y") +
  ylab("Valeur") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  theme(axis.text.x = element_blank()) +
  ggtitle("Répartition des montants du PIA entre les universités")


pfe.univ.etu.ens


##

pfe.univ.size <- anr.pivot %>% 
  filter(Indicateur %in% c("PFE par étudiant")) %>%
  mutate(Valeur = Valeur / 1e3) %>%
  
  ggplot(aes(x=reorder(etab_label,rang.pfe, FUN=first),y=Valeur,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~., scales = "free_y") +
  ylab("Montant (k€)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  theme(axis.text.x = element_text(angle=90,hjust=1, size=5)) +
  ggtitle("Répartition des montants du PIA entre les universités")

pfe.univ.size


##

pfe.univ.size.sort <- anr.pivot %>% 
  filter(Indicateur %in% c("PFE par étudiant")) %>%
  mutate(Valeur = Valeur / 1e3) %>%
  
  ggplot(aes(x=reorder(etab_label,-Valeur, FUN=first),y=Valeur,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~., scales = "free_y") +
  ylab("Montant (k€)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  theme(axis.text.x = element_text(angle=90,hjust=1, size=5)) +
  ggtitle("Répartition des montants du PIA entre les universités")

pfe.univ.size.sort


##

pfe.univ.size.tit.sort <- anr.pivot %>% 
  filter(Indicateur %in% c("PFE par titulaire")) %>%
  mutate(Valeur = Valeur / 1e3) %>%
  
  ggplot(aes(x=reorder(etab_label,-Valeur, FUN=first),y=Valeur,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~., scales = "free_y") +
  ylab("Montant (k€)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  theme(axis.text.x = element_text(angle=90,hjust=1, size=5)) +
  ggtitle("Répartition des montants du PIA entre les universités")

pfe.univ.size.tit.sort



###

scsp.univ <- anr.pivot %>% 
  filter(Indicateur %in% c("SCSP")) %>%
  mutate(Valeur = Valeur / 1e6) %>%
  
  ggplot(aes(x=reorder(etab_label,rang.scsp, FUN=first),y=Valeur,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~., scales = "free_y") +
  ylab("Montant (M€)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  theme(axis.text.x = element_text(angle=90,hjust=1, size=5)) +
  ggtitle("Répartition des montants du PIA entre les universités")

scsp.univ

##

scsp.univ.size.tit.sort <- anr.pivot %>% 
  filter(Indicateur %in% c("SCSP par titulaire")) %>%
  mutate(Valeur = Valeur / 1e3) %>%
  
  ggplot(aes(x=reorder(etab_label,-Valeur, FUN=first),y=Valeur,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~., scales = "free_y") +
  ylab("Montant (k€)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  theme(axis.text.x = element_text(angle=90,hjust=1, size=5)) +
  ggtitle("Répartition des montants du PIA entre les universités")

scsp.univ.size.tit.sort

##

scsp.univ.size.etu.sort <- anr.pivot %>% 
  filter(Indicateur %in% c("SCSP par étudiant")) %>%
  mutate(Valeur = Valeur / 1e3) %>%
  
  ggplot(aes(x=reorder(etab_label,-Valeur, FUN=first),y=Valeur,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~., scales = "free_y") +
  ylab("Montant (k€)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  theme(axis.text.x = element_text(angle=90,hjust=1, size=5)) +
  ggtitle("Répartition des montants du PIA entre les universités")

scsp.univ.size.etu.sort


## 

scsp.univ.evol <- anr.pivot %>% 
  filter(Indicateur %in% c("SCSP par étudiant")) %>%
  filter(!sigle %in% c("UVSQ","UNÎMES")) %>%
  filter(etab != "ARTOIS") %>%
  
  ggplot(aes(x=reorder(etab_label,rang.scsp, FUN=first),y=Evolution,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~., scales = "free_y") +
  ylab("Evolution depuis 2013 (%)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  scale_y_continuous(labels = scales::percent) +
  theme(axis.text.x = element_text(angle=90,hjust=1, size=5)) +
  ggtitle("Répartition des montants du PIA entre les universités")

scsp.univ.evol



## 

scsp.univ.evol.sort <- anr.pivot %>% 
  filter(Indicateur %in% c("SCSP par étudiant")) %>%
  filter(!sigle %in% c("UVSQ","UNÎMES")) %>%
  filter(etab != "ARTOIS") %>%
  
  ggplot(aes(x=reorder(etab_label,-Evolution, FUN=first),y=Evolution,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~., scales = "free_y") +
  ylab("Evolution depuis 2013 (%)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  scale_y_continuous(labels = scales::percent) +
  theme(axis.text.x = element_text(angle=90,hjust=1, size=5)) +
  ggtitle("Répartition des montants du PIA entre les universités")

scsp.univ.evol.sort



## 

tit.univ.diff.sort <- get_anr_pivot(2010) %>% 
  filter(Indicateur %in% c("titulaires")) %>%
  filter(!etablissement %in% c("Université de Nîmes","Université de Guyane","Université d'Artois")) %>%
  
  ggplot(aes(x=reorder(etab_label,-Diff, FUN=first),y=Diff,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~., scales = "free_y") +
  ylab("Evolution depuis 2010 (unité)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  theme(axis.text.x = element_text(angle=90,hjust=1, size=5)) +
  ggtitle("Répartition des montants du PIA entre les universités")

tit.univ.diff.sort


##

tde.univ.diff.sort <- anr.pivot %>% 
  filter(Indicateur %in% c("taux d encadrement")) %>%
  mutate(Valeur = Valeur / 1e3) %>%
  
  ggplot(aes(x=reorder(etab_label,-Evolution, FUN=first),y=Evolution,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~., scales = "free_y") +
  ylab("Evolution depuis 2013 (%)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  scale_y_continuous(labels = scales::percent) +
  theme(axis.text.x = element_text(angle=90,hjust=1, size=5)) +
  ggtitle("Répartition des montants du PIA entre les universités")

tde.univ.diff.sort


##

rpf.univ.diff.sort <- anr.pivot %>% 
  filter(Indicateur %in% c("RPF")) %>%
  mutate(Valeur = Valeur / 1e3) %>%
  
  ggplot(aes(x=reorder(etab_label,-Evolution, FUN=first),y=Evolution,fill=étiquettes)) +
  geom_col() +
  facet_grid(Indicateur~., scales = "free_y") +
  ylab("Evolution depuis 2013 (%)") + xlab("Universités") +
  scale_fill_manual(values=étiquettes.pal, name="Labellisation") +
  scale_y_continuous(labels = scales::percent) +
  theme(axis.text.x = element_text(angle=90,hjust=1, size=5)) +
  ggtitle("Répartition des montants du PIA entre les universités")

rpf.univ.diff.sort

