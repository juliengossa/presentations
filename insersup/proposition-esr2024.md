Mesures et démesure de l’insertion professionnelle pour le pilotage de
l’offre de formation
================
Julien Gossa
2024-06-27

| Method          | koRpus      | stringi       |
|:----------------|:------------|:--------------|
| Word count      | 1649        | 1707          |
| Character count | 10594       | 11925         |
| Sentence count  | 68          | Not available |
| Reading time    | 8.2 minutes | 8.5 minutes   |

# Enjeu et problématique de recherche

Cette proposition de communication prend pour problématique la mesure de
l’insertion professionnelle des diplômés de l’enseignement supérieur, en
l’inscrivant dans la question du pilotage de l’offre de formation.

L’articulation entre formation est emploi est étudiée depuis longtemps
(Lucie Tanguy (1986);Blanchard Marianne et al. (2020);Glaymann, Maillard
(2021)) et se confronte rapidement à des enjeux de quantification et de
gouvernance (Eyraud et al. (2011);Vinokur (2017)) et des enjeux
économiques (Leclair, Veniez (2024))

Le « pilotage de l’offre de formation » désigne la gestion et
l’ajustement des programmes éducatifs proposés par les établissements
d’enseignement en fonction des besoins économiques, sociaux et
professionnels. Il implique la planification, la régulation et
l’évaluation des formations pour aligner les compétences des diplômés
avec les attentes du marché du travail et les priorités nationales, tout
en tenant compte des capacités des institutions éducatives et des
aspirations des étudiants. C’est, en quelque sorte, la facette étatique
de l’orientation, par opposition à la facette qui s’intéresse à la
trajectoire de chaque jeune.

Ce pilotage a pris une ampleur inédite ces dernières années, avec un
intérêt accru des gouvernements pour les flux d’étudiants dans le
supérieur, qui se matérialise par :

- des modifications fréquentes de la partie « Objectifs et missions de
  l’enseignement supérieur » du code de l’éducation[^1] : en 2004, 2005,
  2006, 2007 (ajout de la mission d’insertion professionnelle), 2008,
  2013 (ajout de la mission de réussite), 2014, 2019, 2020 et 2022 ;
- des réformes donnant plus de contrôle et de visibilité à l’Etat :
  ORE/Parcoursup (2018) transfère le contrôle des capacités d’accueil et
  des quotas aux rectorats, à l’articulation -3/+3, MonMaster
  (2017-2023) donne de la visibilité à l’articulation +3/+5 ;
- des discours clairement orientés vers la seule insertion
  professionnelle, à tous les niveaux : par exemple, à propos du Lycée
  Professionnel « *L’objectif est de transformer le quart de ces
  formations dont ces taux sont les plus faibles pour qu’elles ne soient
  plus proposées aux élèves à la rentrée 2026* »[^2], et à propos de
  l’université « *Il faut avoir le courage de revoir nos formations à
  l’université* », « *on doit réallouer les choses* »[^3].

Ainsi, depuis la loi LRU, « Le pilotage ministériel de l’insertion
professionnelle s’est traduit par une intense action normative » (Éric
Piozin et al. (2020))

Ainsi, le premier des quatre « objectifs de politique publique » des
contrats d’objectifs, de moyens et de performances (COMP), dont
l’ambition est de moduler les dotations des établissements, est « *la
mobilisation de l’enseignement supérieur et de la recherche en faveur de
formations préparant les étudiants à exercer des ***métiers d’avenir, en
tension ou en évolution***, et prenant en compte les nécessités de leur
territoire* »(gras d’origine) (DGESIP (2023)).

L’ajout de l’insertion professionnelle comme mission de l’enseignement
supérieur est donc en réalité très récente, et s’inscrit à une période
très particulière de ciseau entre les effectifs de Licence et de Master,
qui s’explique notamment car « *L’enjeu est de préserver le taux
d’insertion professionnelle* »[^4].

<img src="proposition-esr2024_files/figure-gfm/l3m1.decal-1.png" width="672" height="60%" />

### Du « GPEC de la nation » à InserSup, sans oublier l’enquête IP

L’Etat cherche donc à développer une politique de « gestion
prévisionnelle des emplois et des compétences (GPEC) de la nation »[^5],
et pour cela développe plusieurs outils de pilotage, tels que FRESQ
(Formations Reconnues de l’Enseignement Supérieur de Qualité)[^6] et
Quadrant (positionnement des mentions en fonction du taux de réussite et
du taux d’insertion professionnelle).

Pour fonctionner, ces outils ont besoin d’être alimentés en données
précises et exhaustives sur l’insertion professionnelle des diplômés.
C’est l’objet du dispositif InserSup[^7] porté par le MESR et développé
par le SIES. Ce projet à vocation à remplacer les enquêtes d’insertion
professionnelle (IP), traditionnellement menées dans les établissements
par les observations de la vie étudiante (OVE).

Cette communication propose de décrire comment sont produites ces
données, et d’identifier les différences entre les deux dispositifs de
production et leurs résultats. Cette analyse permet d’étudier la mise en
place du pilotage de l’offre de formation, qui *in fine* décrit notre
politique d’enseignement supérieur au niveau national.

## Méthodologie

Cet travail s’appuie d’une part sur l’analyse des méthodologie de
InserSup (SIES (2023)) et de l’enquête IP, et d’autre part sur la
plublication en données ouvertes de leurs résultats[^8].

Il s’inscrit donc à la croisée entre la sociologie des instruments et la
science des données.

Les traitements sont effectués avec R (R Core Team 2013) et les
visualisations avec ggplot (Wickham 2016), en respectant les principes
fondamentaux établis dans (Wilke 2019) et les procédures de production
et publication RMarkdown (Xie et al. 2019).

L’analyse se concentre sur les diplômés de Master de la session 2020, à
30 mois, hors Master d’enseignement. Des informations additionnelles
sont issues du projet kpiESR[^9] qui compile plusieurs jeux de données
ouvertes.

## Principaux résultats

Notre analyse montre que les méthodes de production sont radicalement
différentes : enquête auprès des étudiants pour IP ; et croisement de
fichiers administratifs pour InserSup. Ces méthodes de production
présentent des limites très différentes : taux de réponse, imprécisions
et suspicion de chanstique d’un côté ; aveuglement aux informations non
quantifiées dans les fichiers de l’autre.

Au final, on dispose de trois indicateurs :

- Taux d’insertion : diplômés en emploi / diplômés sur le marché du
  travail (emploi + chômage, ou taux d’emploi net) ;
- Taux d’emploi : diplômés en emploi / diplômés ;
- Taux d’emploi salarié en France : diplômés en emploi seulement salarié
  en France / diplômés.

Leur définition dépend essentiellement de contingences techniques mais
aboutissent à des considérations très différentes : satisfaction des
étudiants d’un côté, satisfaction des besoins de l’emploi français de
l’autre. La comparaison de ces trois indicateurs permet de faire
plusieurs observations.

Premièrement, la vision rapportée par InserSup est globalement 10 points
en dessous de IP, mais s’effondre en Lettres-Langues-Arts (LLA).

<img src="proposition-esr2024_files/figure-gfm/tdx.dom-1.png" width="672" />

Mais cette différence s’explique essentiellement par la nature des
emplois dans ces disciplines : il n’y a rien d’étonnant à ce que
Français-Langue étrangère conduise à des emplois en dehors du
territoire. L’indicateur peut donc être perçu en opposition avec la
mission de l’ESR « promotion et à diffusion de la francophonie dans le
monde ».

<img src="proposition-esr2024_files/figure-gfm/tdx.disc-1.png" width="672" />

Deuxièmemement, l’analyse des indicateurs montre de bien plus grandes
différences entre les établissements, y compris avec des chutes
spectaculaires. L’université de Lorraine passe ainsi d’un taux global de
92% d’insertion professionnelle à à peine plus de 50%.

<img src="proposition-esr2024_files/figure-gfm/tds.vs.tip3-1.png" width="672" />

Cette piètre performance ne s’explique pas par des raisons pédagogiques,
mais plutôt par des particularités du bassin d’emplois : Lorraine est
frontalière avec le Luxembourg, qui embauche une grande partie des
diplômés en Droit et en Informatique, notamment.

<img src="proposition-esr2024_files/figure-gfm/lorraine2-1.png" width="672" />

Ainsi, nous voyons que ces indicateurs ne mesurent pas tant les
performances intrinsèques des établissements, que des particularités des
secteurs d’emplois, sur lesquelles les universités n’ont aucune prise.
L’utilisation des indicateurs pour piloter leur offre de formation est
beaucoup moins technique qu’elle ne soulève des questions hautement
politiques, telles que la francophonie ou la formation d’étudiants pour
l’international.

En croisant le taux d’emploi salarié en France avec d’autres
indicateurs, d’autres questions se soulèvent systématiquement. Par
exemple, une utilisation directe du taux d’emplois salarié en France
pour moduler les capacités d’acceuil des établissements peut conduire à
une réduction du nombre de places dans les filières les plus féminisées.

<img src="proposition-esr2024_files/figure-gfm/unnamed-chunk-1-1.png" width="672" />

Un croisement avec le budget par étudiant et le périmètre d’excellence
conduit également à devoir interroger la pertinence des « politiques
d’excellence » et des « dialogues stratégiques et de gestion » (qui
aboutissent à l’allocation des moyens aux établissements) en terme
d’insertion professionnelle.

<img src="proposition-esr2024_files/figure-gfm/unnamed-chunk-2-1.png" width="672" />

Il faut ici noter que toutes les différences que nous venons de voir
trouvent facilement des explications légitimes. Or, ces explications
neutralisent l’information portée par la donnée dès lors qu’on veut s’en
servir pour du pilotage : même si on estime souhaitable de réduire la
dépense publique dans les filières « qui ne mènent pas à l’emploi », il
sera difficile d’assumer d’affaiblir la francophonie ou les poursuite
d’édute des femmes, et il sera impossible d’empêcher les diplômés
d’aller travailler à l’étranger si les conditions d’embauche y sont
meilleures.

Il y a donc ici une forme de démesure dans l’ambition prêtée à ces
mesures de l’insertion professionnelle : si elles sont extrêmement
intéressantes pour comprendre le système et suivre son évolution, elles
deviennent extrêmement médiocres dès lors qu’on s’en sert pour prendre
des décisions de pilotage de l’offre de formation. C’est une parfaite
illustration de la « Loi de Goodhart » : « lorsqu’une mesure devient un
objectif, elle cesse d’être une bonne mesure » (Strathern (1997)).

En conclusion, la mesure de l’insertion professionnelle se confronte
donc à des méthodologiques qui limitent leur utilisabilité en terme de
pilotage de l’offre de formation. Ces limites sont d’abord
méthologiques, mais se révèlent ensuite être plus fondamentales,
questionnant l’idée même de les utiliser à des fins de pilotage. Même si
l’enquête InserSup devrait rapidement s’améliorer, d’abord en tenant
compte des critiques qui lui sont adressées, ensuite en augmentant son
périmètre, rien n’indique à ce stade que ses données seront un jour
utilisables pour adapter l’offre de formation.

# Eléments de discussion

Cette proposition présente plusieurs éléments de discussion, dont
notamment :

- Si une utilisation directe des indicateurs est impossible, est-ce
  qu’une utilisation indirecte reste envisageable pour un pilotage de
  l’offre de formation ?
- Quelles sont les autres utilisations possibles ?
- Est-ce que tous les objectifs de l’ESR peuvent être réductibles à des
  indicateurs de pilotage ?
- Est-ce que les observatoires effectuant les enquêtes IP sont destinés
  à disparaitre ou à redefinir leurs missions ?
- Est-ce que la bascule d’une production de données locales par enquête
  à une production de données nationales par croisement de fichiers
  présente des dangers ?

# Principales références bibliographiques

<div id="refs" class="references csl-bib-body">

<div id="ref-blanchardmarianneSelectionsSystemeEducatif2020"
class="csl-entry">

BLANCHARD MARIANNE, BOUDESSEUL GÉRARD, COUPPIÉ THOMAS, EPIPHANE
DOMINIQUE, GIRET JEAN-FRANÇOIS, LEMISTRE PHILIPPE, MANIFET CHRISTELLE,
MÉNARD BORIS, SACCOMANNO BENJAMIN, SOLDANO CATHERINE et WERQUIN PATRICK,
2020. 16 : *Sélections, Du Système Éducatif Au Marché Du Travail*. S.l.
Céreq.

</div>

<div id="ref-dgesipLancementContratsObjectifs2023" class="csl-entry">

DGESIP, 2023. *Lancement Des Contrats d’objectifs, de Moyens et de
Performances (COMP)*. mars 2023. S.l. : s.n.

</div>

<div id="ref-ericpiozinMissionInsertionProfessionnelle2020"
class="csl-entry">

ÉRIC PIOZIN, ASTRID KRETCHNER, CLAUDINE PICARONNY et OLIVIER REY, 2020.
*La mission d’insertion professionnelle de l’université : bilan dix ans
après la loi relative aux libertés et responsabilités des universités*.
S.l. IGESR.

</div>

<div id="ref-eyraudEnjeuxQuantificationDans2011" class="csl-entry">

EYRAUD, Corine, MIRI, Mustapha El et PEREZ, Patrick, 2011. Les enjeux de
quantification dans la LOLF. Le cas de l’enseignement supérieur. In :
*Revue Francaise de Socio-Economie*. 2011. Vol. n$^\circ$ 7, n° 1,
pp. 147‑168.

</div>

<div id="ref-glaymannProfessionnalisationFormationsScolaires2021"
class="csl-entry">

GLAYMANN, Dominique et MAILLARD, Fabienne, 2021. La professionnalisation
des formations scolaires et universitaires, entre discours et mises en
œuvre. In : *Formation emploi*. 2021. Vol. 156, n° 4, pp. 7‑12.
DOI [10.4000/formationemploi.10148](https://doi.org/10.4000/formationemploi.10148).

</div>

<div id="ref-leclairEnjeuxEconomiquesOrientation2024" class="csl-entry">

LECLAIR, Blaise et VENIEZ, Agathe, 2024. 344 : *Les enjeux économiques
de l’orientation scolaire et universitaire*. S.l. Directin générale du
Trésor.

</div>

<div id="ref-lucietanguyIntrouvableRelationFormation1986"
class="csl-entry">

LUCIE TANGUY, 1986. *L’Introuvable Relation Formation/Emploi: Un État
Des Recherches En France*. Paris : Documentation française.
ISBN 978-2-11-001660-7.

</div>

<div id="ref-rcoreteamLanguageEnvironmentStatistical2013"
class="csl-entry">

R CORE TEAM, 2013. *R: A Language and Environment for Statistical
Computing*. Vienna, Austria : R Foundation for Statistical Computing.

</div>

<div id="ref-siesInserSupNoteMethodologique2023" class="csl-entry">

SIES, 2023. *InserSup - Note méthodologique*. S.l.

</div>

<div id="ref-strathernImprovingRatingsAudit1997" class="csl-entry">

STRATHERN, Marilyn, 1997. « Improving Ratings »: Audit in the British
University System. In : *European Review*. juillet 1997. Vol. 5, n° 3,
pp. 305‑321.
DOI [10.1002/(SICI)1234-981X(199707)5:3\<305::AID-EURO184\>3.0.CO;2-4](https://doi.org/10.1002/(SICI)1234-981X(199707)5:3<305::AID-EURO184>3.0.CO;2-4).

</div>

<div id="ref-vinokurGouvernanceUniversitesPar2017" class="csl-entry">

VINOKUR, Annie, 2017. La Gouvernance Des Universités Par La Qualité.
In : *Recherche et pratiques pédagogiques en langues de spécialité \[En
ligne\]*. mars 2017. Vol. Vol. 36, pp. 1‑17.

</div>

<div id="ref-wickhamGgplot2ElegantGraphics2016" class="csl-entry">

WICKHAM, Hadley, 2016. *[Ggplot2: Elegant Graphics for Data
Analysis](https://doi.org/10.1007/978-3-319-24277-4)*. 2nd ed. 2016.
Cham : Springer International Publishing : Imprint: Springer. Use R!
ISBN 978-3-319-24277-4.

</div>

<div id="ref-wilkeFundamentalsDataVisualization2019b" class="csl-entry">

WILKE, C., 2019. *Fundamentals of Data Visualization: A Primer on Making
Informative and Compelling Figures*. First edition. Sebastopol, CA :
O’Reilly Media. ISBN 978-1-4920-3108-6.

</div>

<div id="ref-xieMarkdownDefinitiveGuide2019" class="csl-entry">

XIE, Yihui, ALLAIRE, Joseph J. et GROLEMUND, Garrett, 2019. *R Markdown:
The Definitive Guide*. Boca Raton London New York : CRC Press, Taylor &
Francis Group. Chapman & Hall/CRC, the R Series. ISBN 978-1-138-35942-0
978-1-138-35933-8.

</div>

</div>

[^1]: 
    <https://www.legifrance.gouv.fr/codes/section_lc/LEGITEXT000006071191/LEGISCTA000006166563/#LEGISCTA000006166563>

[^2]: <https://www.liberation.fr/societe/education/reforme-du-lycee-professionnel-carole-grandjean-detaille-lannee-de-terminale-20231122_ATPXLTUVJJCUBKDBS66IKTI7GQ/>

[^3]: <https://www.youtube.com/watch?v=3Z6HnUJ3hcw>

[^4]: <https://www.lefigaro.fr/actualite-france/frederique-vidal-l-enjeu-est-de-preserver-le-taux-d-insertion-professionnelle-20210921>

[^5]: <https://education.newstank.fr/article/view/306378/rencontre-emmanuel-macron-etablissements-themes-discutes-elysee-14-11-2023.html>

[^6]: <https://choisirleservicepublic.gouv.fr/offre-emploi/c-esr-a2-3---cheffe-de-projet-informatique---domaine--formations--hf-reference-2024-1477164/>

[^7]: <https://www.enseignementsup-recherche.gouv.fr/fr/insersup-note-methodologique-94050>

[^8]: <https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-insersup>

[^9]: <https://github.com/cpesr/kpiESR>
