kpiESR : des indicateurs clés de performance pour les établissements de
l’ESR, des données ouvertes aux représentations graphiques
================
Pauline Boyer et Julien Gossa, Laboratoire SAGE, Université de
Strasbourg, CPESR
2024-07-11

## Enjeu et contexte

De profonds changements sont en cours dans l’enseignement supérieur et
la recherche (ESR) en France, en accélération depuis le début du XXIe
siècle (Musselin (2022)). Plusieurs réformes ont modifié la manière dont
les établissements d’enseignement supérieur sont gérés et évalués. La
création de l’Agence Nationale de la Recherche (ANR) en 2005 a modifié
la manière dont les moyens sont alloués aux établissements, tandis que
la Loi libertés et responsabilités des universités (LRU) en 2007 a
amorcé un mouvement d’autonomisation des universités, les invitant à
développer leur propre politique d’emploi. En 2013, l’Agence
d’évaluation de la recherche et de l’enseignement supérieur (AÉRES) a
été remplacée par le Haut Conseil de l’évaluation de la recherche et de
l’enseignement supérieur (Hcéres), modifiant la manière dont les
établissements sont évalués.

L’Initiative d’excellence (IDEX) a également été lancée, sélectionnant
onze universités pour un projet de gouvernance différenciant dans le
cadre du Plan d’investissement d’avenir (PIA) (Aust, Mazoyer, et
Musselin (2018)). De plus, un grand nombre de fusions et de
regroupements d’établissements d’enseignement supérieur ont eu lieu,
tels que les Pôles de recherche et d’enseignement supérieur (PRES) et
les Communautés d’universités et d’établissements (COMUE), et plus
récemment les Etablissement publics expérimentaux (EPE).

Ces changements ont entraîné des évolutions structurelles locales,
visant la différenciation des établissements de l’ESR. Cela a créé un
besoin croissant d’outils de suivi et d’analyse pour comprendre les
caractéristiques et les politiques des établissements de l’ESR. Dans le
même temps, le ministère de l’ESR puis l’Etat ont développé une
politique d’ouverture des données administratives, dans la lignée de la
Loi pour une république numérique.

## Problématique de recherche

Un pan important de la recherche sur les politiques publiques de l’ESR
repose sur des analyses quantitatives à partir de données
institutionnelles. Cependant, les données utilisées sont des données à
l’accès régulé par la signature de conventions de recherche, directement
auprès de l’organisation fournissant les données (composante,
établissement, Ministère, agence) ou via le CASD ou Progedo. Si des
travaux utilisent des données administratives scrappées (par exemple
(Clément, Couto, et Blanchard (2019),Couto, Bugeja-Bloch, et Frouillou
(2021)), à notre connaissance, aucun travail n’exploite les données
ouvertes.

Pourtant, le Ministère de l’ESR alimente depuis 2014 une plateforme
d’open data de nombreux jeux de données structurés (196 disponibles en
juillet 2024). Cette non-utilisation des données ouvertes est d’autant
plus étonnante que, dans la communication ministérielle, la provision de
données pour la recherche figure parmi les objectifs revendiqués de
l’open data. Il semble donc légitime de questionner la pertinence de la
réutilisation de données ouvertes pour la recherche.

En effet, leur réutilisation expose les chercheurs à de nombreuses
contraintes liées à leurs conditions de production et d’ouverture. Tout
d’abord, la structure des jeux de données est déterminée par les usages
(Bittner et Garfinkel (1967)) avant tout gestionnaires de ces données,
tels que l’allocation de moyens aux universités, tout en étant
contrainte par l’impératif de protection de l’anonymat. Par ailleurs,
les travaux séminaux de Desrosières nous ont appris que les données ne
reflètent pas le monde social mais le « reconfigurent et \[le\]
transforment » (Desrosières (2008)), la mesure étant précédée d’une
étape techno-politique de définition des conventions d’équivalence à
appliquer. Enfin, tandis que la Loi pour une République numérique
faisant de l’ouverture des données un principe par défaut demeure très
vague, un soupçon plane encore sur la transparence réalisée lors de
l’ouverture des données, une transparence qualifiée de « stratégiquement
opaque » (Ruijer et al. (2020)): il n’est pas dans l’intérêt d’une
organisation de rendre accessibles des données permettant de critiquer
son action.

Ces obstacles nous renvoient à une question centrale en sociologie
(Kitsuse et Cicourel (1963)) : si les données institutionnelles ne sont
pas des enregistrements neutres d’actes ou d’effectifs mais le produit
de déterminations sociales complexes, dans quelle mesure peut-on les
utiliser pour évaluer l’action publique ? Autrement dit, peut-on
dépasser la porosité de la double fonction des statistiques, à la fois
outils de preuve et outils de gouvernement (Desrosières (2008)) ?

Cette proposition de communication prend le parti de la perspective
réformiste du statactivisme, en acceptant « de se placer dans un cadre
préétabli, mais y trouv\[er\] les marges de liberté suffisantes pour le
modifier » (Bruno et al. (2014)).

## Méthodologie

L’approche développée au sein de la Conférence des praticien⋅ne⋅s de
l’ESR (CPESR) consiste à exploiter les données administratives ouvertes
par le ministère pour élaborer des indicateurs clés de performances
(kpi) à la fois exhaustifs et synthétiques. Ce travail s’inscrit à la
croisée des sciences des données, avec l’agrégation et la représentation
des informations ; et des sciences de l’action publique, avec la
sélection d’un sous-ensemble d’indicateur prioritairement pertinents, et
la conception d’indicateurs clés composites.

Notre objectif est de construire des tableaux de bord permettant de
percevoir les politiques publiques de l’ESR, en se confrontant à
plusieurs objectifs contradictoires :

- lisibilité vs. exhaustivité : la lisibilité demande de limiter au
  maximum le nombre d’indicateurs, alors que l’exhaustivité invite à les
  démultiplier ;
- robustesse vs. finesse : agréger les données permet de gommer leurs
  imperfections, mais réduit la finesse des analyses permises ;
- localité vs. globalité : agréger les données au niveau des
  établissements permet de percevoir les différenciations locales, mais
  agréger au niveau national est indispensable pour percevoir les
  transformations globales ;
- contextualisation vs. compétition : les différenciations locales ne se
  comprennent qu’avec une contextualisation dans le temps et par rapport
  aux autres établissements, mais ces comparaisons portent le risque
  d’une mise en compétition[^1].

Les traitements sont effectués avec R (R Core Team 2013) et les
visualisations avec ggplot (Wickham 2016), en respectant les principes
fondamentaux établis dans (Wilke 2019) et les procédures de production
et publication RMarkdown (Xie, Allaire, et Grolemund 2019).

## Principaux résultats

Les données ouvertes sont mises à disposition par le SIES[^2], et nous
exploitons pour ces travaux les jeux suivants :

- [fr-esr-statistiques-sur-les-effectifs-d-etudiants-inscrits-par-etablissement](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-statistiques-sur-les-effectifs-d-etudiants-inscrits-par-etablissement)
- [fr-esr-personnels-biatss-etablissements-publics](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-personnels-biatss-etablissements-publics)
- [fr-esr-enseignants-titulaires-esr-public](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-titulaires-esr-public/)
- [fr-esr-enseignants-nonpermanents-esr-public](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-enseignants-nonpermanents-esr-public/information/)
- [fr-esr-operateurs-indicateurs-financiers](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-operateurs-indicateurs-financiers/information/)
- [fr-esr-principaux-etablissements-enseignement-superieur](https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-principaux-etablissements-enseignement-superieur/information/?disjunctive.type_d_etablissement)

Le projet kpiESR[^3] assemble les données à trois granularités
différentes : MESR, groupes d’établissements, et établissement. Les
indicateurs retenus sont de quatre ordres : effectifs étudiants,
effectifs BIATSS, effectifs enseignants et données financières.

Ces indicateurs sont déclinés en deux types :

- **Les indicateurs primaires et secondaires** : au plus proche des jeux
  de données ouvertes, ils présentent les effectifs étudiants et
  personnels, ainsi que les finances.
- **Les indicateurs clés de performance** : combinaisons des précédents,
  plus représentatives des missions.
  - **Taux de titularité** : effectifs titulaires / total des effectifs
  - **Taux de SCSP** : subvention pour charge de service public / total
    des ressources
  - **Taux d’encadrement pédagogique** : nombre d’enseignants titulaires
    pour 100 étudiants
  - **Taux d’encadrement administratif** : effectifs administratifs /
    total des effectifs
  - **Ressources par étudiant** : total des ressources / effectifs
    étudiant en Licence et Master
  - **Recettes formation par étudiant** : total des recettes formation
    (droits d’inscription, alternance, VAE, etc.) / effectifs étudiants
  - **Recette recherche par EC** : total des recettes recherche (ANR,
    contrat, IDEx) / effectifs enseignant-chercheur

Trois représentations sont ensuite utilisées :

- **Valeurs absolues** : permettant de connaitre les valeurs à la
  dernière année ;
- **Evolutions normalisées** : permettant de percevoir l’évolution dans
  le temps, en valeur 100 pour une année de référence ;
- **Valeurs normalisées** : permettant connaitre un rapport et de le
  comparer aux autres établissements.

Ces représentations permettent de produire des tableaux de bord pour
tous les établissements, avec des informations contextualisées dans le
temps et dans l’espace ESR. Ces tableaux de bord sont réunis dans un
document unique[^4] mais aussi accessibles par une interface web
interactive[^5].

### Tableaux de bord

Les différentes représentations mises ensemble constituent un tableau de
bord en deux volets, d’abord les indicateurs clés de performance, et
ensuite les données primaires. Par exemple, voici les tableaux de bord
pour l’ensemble du MESR :

<embed src="esr-proposition_files/figure-gfm/tdb.kpi-1.pdf" width="100%" style="display: block; margin: auto;" type="application/pdf" />
<embed src="esr-proposition_files/figure-gfm/tdb.series-1.pdf" width="100%" style="display: block; margin: auto;" type="application/pdf" />
### Séries temporelles

Les séries temporelles permettent de percevoir des évolutions. Par
exemple, voilà la représentation, en valeur 100 pour 2013 et dans le
périmètre MESR, des effectifs enseignants et étudiants, ainsi que du
taux d’encadrement. Cette représentation est déclinable par
établissement.

<embed src="esr-proposition_files/figure-gfm/serie-1.pdf" width="100%" style="display: block; margin: auto;" type="application/pdf" />

### Représentations spatiales

Les représentations spatiales permettent de comparer les établissements
entre eux, selon tous les indicateurs du projet. C’est un outil qui peut
s’avérer utile au *benchmarking*, comme à l’identifier de corrélations.
Par exemple, voici les universités en fonction des taux d’encadrement
pédagogique et des budgets par étudiant, selon le périmètre
d’excellence, en 2020.

<embed src="esr-proposition_files/figure-gfm/unnamed-chunk-1-1.pdf" width="100%" style="display: block; margin: auto;" type="application/pdf" />

## Limites de l’approche et éléments de discussion

Bien qu’étant le projet public le plus avancé en matière d’agrégation
des données de l’ESR, kpiESR présente plusieurs limites, d’abord dûes à
l’utilisation des données ouvertes :

- disponibilité : les séries temporelles sont courtes (la plus ancienne
  débute en 2006), varient en fonction du jeu de données, et on
  généralement 18 mois de retard par rapport à l’année courante ;
- limitation : en partant des données disponibles plutôt que des
  besoins, on limite le nombre et le type d’indicateurs calculables ;
- qualité : de nombreux établissements présentent des données partielles
  ou de mauvaises qualité, ainsi que des ruptures de séries à l’occasion
  des réformes et transformations telles que les regroupements (fusions,
  COMUEs, EPE).

Le projet est aussi totalement dépendant de la mise à jour régulière des
données ouvertes, ce qui peut poser problème si l’État ralentit ou cesse
leur publication. Le projet est donc tributaire de ce que l’Etat
souhaite et peut montrer, en quantité comme dans la définition de chaque
variable.

Mais le projet est également tributaire de ce que les établissements
peuvent et souhaitent montrer. Nous avons ainsi identifié plusieurs cas
de chanstique (Bruno et Didier (2013)), c’est-à-dire de manipulation des
indicateurs, ainsi que plusieurs techniques de « transparence
stratégiquement opaque », notamment pour les informations financières.

Enfin, le projet pouvant servir au *benchmarking*, se pose la question
de la mise en compétition des établissements, qui se matérialise
notamment par la possibilité de fabriquer des classements. Cela
interroge directement les choix de définition des indicateurs, qui
peuvent tous être retournés. Par exemple, le budget par étudiant reflète
l’investissement de l’État, quand son inverse, le nombre d’étudiants
formés pour un budget donné, reflète la productivité des établissements.
Il s’agit donc de choix éminemment techno-politiques, qui conduisent à
des classements totalement inversés, à partir des mêmes données.

Si elle est retenue, la communication décrira la définition des
indicateurs sélectionnés et les choix qui les sous-tendent, expliquera
en détail les représentations graphiques, puis présentera quelques
enseignements sur les politiques publiques de l’ESR, ainsi que des
illustrations concrètes des limites de l’approche.

## Références

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-austSeMettreIDEX2018" class="csl-entry">

Aust, Jérôme, Harold Mazoyer, et Christine Musselin. 2018. « Se mettre à
l’IDEX ou être mis à l’index: Conformations, appropriations et
résistances aux instruments d’action publique dans trois sites
d’enseignement supérieur ». *Gouvernement et action publique* 4 (4): 9.
<https://doi.org/ggqsfw>.

</div>

<div id="ref-BitGar67" class="csl-entry">

Bittner, E, et H Garfinkel. 1967. « "Good" Organizational Reasons for
"Bad" Clinical Records ». In *Studies in Ethnomethodology*. Englewood
Cliffs: Prentice Hall.

</div>

<div id="ref-brunoBenchmarkingEtatSous2013" class="csl-entry">

Bruno, Isabelle, et Emmanuel Didier. 2013. *Benchmarking: l’État sous
pression statistique*. Paris: Zones.

</div>

<div id="ref-bruno_introduction_2014" class="csl-entry">

Bruno, Isabelle, Emmanuel Didier, Julien Prévieux, et Cyprien Tasset.
2014. « Introduction. Pour Un Statactivisme ! » In *Statactivisme*,
édité par Isabelle Bruno, Emmanuel Didier, et Julien Prévieux, 5‑30.
Zones. Paris: La Découverte.

</div>

<div id="ref-clement_parcoursup_2019" class="csl-entry">

Clément, Pierre, Marie-Paule Couto, et Marianne Blanchard. 2019.
« Parcoursup : infox et premières conséquences de la réforme ». *La
Pensée* 399 (3): 144‑56. <https://doi.org/10.3917/lp.399.0144>.

</div>

<div id="ref-couto_parcoursup_2021" class="csl-entry">

Couto, Marie-Paule, Fanny Bugeja-Bloch, et Leïla Frouillou. 2021.
« Parcoursup : les prémices d’un accroissement de la stratification
sociale et scolaire des formations du supérieur ». *Agora
debats/jeunesses* 89 (3): 23‑38.

</div>

<div id="ref-desrosieres_pour_2008" class="csl-entry">

Desrosières, Alain. 2008. *Pour une sociologie historique de la
quantification : L’Argument statistique I*. Sciences sociales. Paris:
Presses des Mines.

</div>

<div id="ref-kitsuse_note_1963" class="csl-entry">

Kitsuse, John I., et Aaron V. Cicourel. 1963. « A Note on the Uses of
Official Statistics ». *Social Problems* 11 (2): 131‑39.
<https://doi.org/10.2307/799220>.

</div>

<div id="ref-musselinLongueMarcheUniversites2022" class="csl-entry">

Musselin, Christine. 2022. *La longue marche des universités
françaises*. Paris: Sciences po, les presses.

</div>

<div id="ref-rcoreteamLanguageEnvironmentStatistical2013"
class="csl-entry">

R Core Team. 2013. *R: A Language and Environment for Statistical
Computing*. Vienna, Austria: R Foundation for Statistical Computing.

</div>

<div id="ref-ruijer_politics_2020" class="csl-entry">

Ruijer, Erna, Francoise Détienne, Michael Baker, Jonathan Groff, et
Albert J. Meijer. 2020. « The Politics of Open Government Data:
Understanding Organizational Responses to Pressure for More
Transparency ». *The American Review of Public Administration* 50 (3):
260‑74. <https://doi.org/10.1177/0275074019888065>.

</div>

<div id="ref-wickhamGgplot2ElegantGraphics2016" class="csl-entry">

Wickham, Hadley. 2016. *Ggplot2: Elegant Graphics for Data Analysis*.
2nd ed. 2016. Use R! Cham: Springer International Publishing : Imprint:
Springer. <https://doi.org/10.1007/978-3-319-24277-4>.

</div>

<div id="ref-wilkeFundamentalsDataVisualization2019b" class="csl-entry">

Wilke, C. 2019. *Fundamentals of Data Visualization: A Primer on Making
Informative and Compelling Figures*. First edition. Sebastopol, CA:
O’Reilly Media.

</div>

<div id="ref-xieMarkdownDefinitiveGuide2019" class="csl-entry">

Xie, Yihui, Joseph J. Allaire, et Garrett Grolemund. 2019. *R Markdown:
The Definitive Guide*. Chapman & Hall/CRC, the R Series. Boca Raton
London New York: CRC Press, Taylor & Francis Group.

</div>

</div>

[^1]: On retrouve habituellement cette mise en compétition dans les
    classements, qui s’appuient toujours sur des indicateurs de
    performance.

[^2]: <https://www.enseignementsup-recherche.gouv.fr/fr/statistiques-et-analyses-50213>

[^3]: <https://github.com/cpesr/kpiESR>

[^4]: <https://cpesr.fr/tableau-de-bord-esr/>

[^5]: <https://data.cpesr.fr/tdbesr/>
