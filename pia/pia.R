
library(tidyverse)
library(ggcpesrthemes)

etu <- read.csv2("fr-esr-statistiques-sur-les-effectifs-d-etudiants-inscrits-par-etablissement-hcp.csv") %>%
  transmute(
    exercice = rentree ,
    UAI = Identifiant.s..UAI,
    étudiants = Cycle.universitaire..cursus.LMD....L..1er.cycle. + Cycle.universitaire..cursus.LMD....M..2ème.cycle.
  )

ens <- read.csv2("fr-esr-enseignants-titulaires-esr-public.csv") %>%
  group_by(exercice = Rentrée, UAI = Identifiant.établissement) %>%
  summarise(titulaires = sum(effectif, na.rm=TRUE))

etab <- read.csv2("fr-esr-principaux-etablissements-enseignement-superieur.csv") %>%
  transmute(
    UAI = uai...identifiant,
    sigle,
    nom_court
  )

fin <- read.csv("fr-esr-operateurs-indicateurs-financiers.csv",sep=";",quote='"') %>%
  mutate(exercice = as.factor(exercice)) %>%
  mutate(groupe = case_when(
    startsWith(groupe,"université") ~ "université",
    groupe == "école d'ingénieurs" ~ "écoles d'ingénieurs",
    groupe == "communauté d'universités et établissements" ~ "COMUE",
    groupe == "autres établissements d'enseignement et de recherche" ~ "autres",
    str_length(groupe) == 0 ~ "autres",
    TRUE ~ groupe
  )) %>%
  mutate(etablissement = case_when(
    str_length(etablissement) == 0 ~ uai...identifiant,
    TRUE ~ etablissement
  )) %>%
  mutate(
    groupe = as.factor(groupe),
    etablissement = as.factor(etablissement))

etiquettes <- read.csv("etiquettes.csv") %>%
  mutate(étiquettes = factor(case_when(
    IDEx ~ "Univ. IDEx",
    ISITE ~ "Univ. ISITE",
    TRUE ~ "Univ. NINI"),
    levels=c("Univ. IDEx","Univ. ISITE","Univ. NINI","Non Université"))
  ) 


anr <- fin %>% 
  group_by(exercice) %>%
  transmute(
    UAI = as.character(uai...identifiant),
    etablissement = etablissement,
    groupe = groupe,
    exercice = as.numeric(as.character(exercice)),
    ANR.PIA = ANR.investissements.d.avenir,
    RP = Ressources.propres.encaissables,
    SCSP = Produits.de.fonctionnement.encaissables - Ressources.propres.encaissables,
    PFE = Produits.de.fonctionnement.encaissables,
    RPF = Droits.d.inscription + Taxe.d.apprentissage + Formation.continue..diplômes.propres.et.VAE
  ) %>%
  ungroup() %>%
  #left_join(ens) %>%
  #left_join(etab) %>%
  left_join(etu) %>%
  left_join(ens) %>%
  mutate(
    taux.d.encadrement = titulaires / étudiants * 100,
    SCSP.par.étudiant = SCSP / étudiants,
    PFE.par.étudiant = PFE / étudiants,
    RPF.par.étudiant = RPF / étudiants,
    SCSP.par.titulaire = SCSP / titulaires,
    PFE.par.titulaire = PFE / titulaires
  ) %>%
  left_join(etab) %>%
  left_join(etiquettes %>% select(UAI,étiquettes,etab)) %>%
  mutate(
    #exercice = factor(exercice),
    UAI = factor(UAI),
    sigle = nom_court) %>%
  mutate(
    SCSP = ifelse(SCSP < 0, NA, SCSP)
  ) %>%
  group_by(UAI) %>%
  ungroup() %>%
  #mutate(groupe = as.factor(ifelse(etablissement == "Université Paris-Dauphine", "université", as.character(groupe)))) %>%
  mutate(étiquettes = factor(case_when(
    groupe != "université" ~ "Non université",
    is.na(étiquettes) ~ "Univ. NINI",
    TRUE ~ as.character(étiquettes)),
    levels=c("Univ. IDEx","Univ. ISITE","Univ. NINI","Non université")))



exercice.ref <- 2019

etab.filter <- c("Centre Universitaire de Mayotte",
                 "Institut national universitaire Jean-François Champollion",
                 "Université de la Nouvelle-Calédonie",
                 "Université des Antilles",
                 "Université de la Polynésie Française",
                 "Université de Guyane",
                 "Université d'Artois",
                 "Université Paris-Saclay")

rangs <- anr %>%
  filter(exercice == exercice.ref) %>%
  transmute(UAI, 
            rang.pia=rank(-ANR.PIA),
            rang.pfe=rank(-PFE),
            rang.scsp=rank(-SCSP),
            rang.scsp.etu=rank(-SCSP.par.étudiant),
            )

get_anr_pivot <- function(exercice.min) {
  anr %>%
    filter(exercice >= exercice.min, exercice <= exercice.ref) %>% 
    pivot_longer(ANR.PIA:PFE.par.titulaire, names_to = "Indicateur", values_to = "Valeur") %>%
    mutate(Indicateur = factor(Indicateur, 
                               levels=names(select(anr,ANR.PIA:PFE.par.titulaire)),
                               labels=str_replace_all(names(select(anr,ANR.PIA:PFE.par.titulaire)),"\\."," ") )
    ) %>%
    left_join(rangs) %>%
    group_by(UAI,Indicateur) %>%
    arrange(exercice) %>%
    mutate(
      Evolution =  (Valeur / first(Valeur)) - 1,
      Diff = Valeur - first(Valeur)) %>%
    filter(!etablissement %in% etab.filter) %>%
    filter(exercice == exercice.ref) %>%
    filter(groupe == "université") %>%
    mutate(etab_label = str_replace(etablissement,"^Université( de)*",""))
}
anr.pivot <- get_anr_pivot(2013)

