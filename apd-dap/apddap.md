---
title: "apddap"
author: "Julien Gossa"
date: "2022-10-01"
output: 
  pdf_document:
    dev: cairo_pdf
    includes:
      in_header: header.tex
    latex_engine: xelatex
lang: "fr-FR"
geometry: margin=1.5cm
---



# #dataESR test

Lancée en 2014, #dataESR est la première plateforme ministérielle de données ouvertes. Alimentée régulièrement par le département des outils d'aide à la décision (SIES) du Ministère de l'enseignement supérieur et de la recherche, elle rassemble aujourd'hui 152 jeux de données sur plusieurs thématiques au coeur de l'ESR (ressources humaines, finances, étudiants et diplômes, valorisation, ...). 

Ces données sont, pour la plupart d'entre elles, collectées directement auprès des établissements par le Ministère, au cours de campagnes de collecte cycliques, gage de leur fiabilité et de leur comparabilité.

Cette plateforme se distingue par un vrai travail de mise en qualité des données (utilisation de
référentiels officiels pour croiser et enrichir les données, élaboration de métadonnées) et par des outils d'exploration et de visualisation, ce que n'offre pas la plateforme interministérielle data.gouv.fr gérée par la mission Etalab. Tous les jeux de données sont exportables dans différents formats (CSV, JSON, EXCEL) et peuvent être utilisés via les APIs de la plateforme. 

https://data.enseignementsup-recherche.gouv.fr

## Une plateforme alimentée régulièrement depuis 2014

<img src="figure/visu_rythme_ouv_jdd, -1.png" title="plot of chunk visu_rythme_ouv_jdd, " alt="plot of chunk visu_rythme_ouv_jdd, " width="100%" style="display: block; margin: auto;" />

## Des jeux de données portant sur des thématiques variées...

<img src="figure/visu_typolo_them-1.png" title="plot of chunk visu_typolo_them" alt="plot of chunk visu_typolo_them" width="100%" style="display: block; margin: auto;" />


## ... avec des couvertures temporelles variables.


<img src="figure/creation_var_couv_tempo_gp-1.png" title="plot of chunk creation_var_couv_tempo_gp" alt="plot of chunk creation_var_couv_tempo_gp" width="100%" style="display: block; margin: auto;" />



