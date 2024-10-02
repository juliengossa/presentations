Mesures et démesure de l’insertion professionnelle pour le pilotage de
l’offre de formation
================
Marie Lapeyronnie, ResoSup - RESeau des Observatoires de l’enseignement
SUPérieurJulien Gossa, Laboratoire SAGE, Université de Strasbourg
2024-09-30

# Enjeu et problématique de recherche

Cette proposition de communication prend pour problématique la mesure de
l’insertion professionnelle des diplômés de l’enseignement supérieur, en
l’inscrivant dans la question du pilotage de l’offre de formation.

Dans la longue transformation de l’ESR (Musselin (2022)), l’articulation
entre formation et emploi est un questionnement permanent (Lucie Tanguy
(1986);Blanchard Marianne et al. (2020);Glaymann and Maillard (2021)),
qui se confronte à des enjeux de quantification et de gouvernance
(Eyraud, Miri, and Perez (2011);Vinokur (2017)) et des enjeux
économiques (Leclair and Veniez (2024))

Le « pilotage de l’offre de formation » désigne la gestion et
l’ajustement des formations proposées par les établissements en fonction
des différents besoins, qui sont généralement économiques, sociaux ou
professionnels. Il implique la planification, la régulation et
l’évaluation des formations pour aligner les savoirs et compétences des
diplômés avec les attentes du marché du travail et les priorités
nationales, tout en tenant compte des capacités des institutions
éducatives et des aspirations des étudiants. C’est, en quelque sorte, la
facette étatique de l’orientation, par opposition à la facette qui
s’intéresse à la trajectoire de chaque jeune.

Ce pilotage a pris une ampleur inédite ces dernières années, avec un
intérêt accru des gouvernements pour les flux d’étudiants dans le
supérieur, qui se matérialise par :

- des modifications fréquentes de la partie « Objectifs et missions de
  l’enseignement supérieur » du code de l’éducation[^1] : en 2004, 2005,
  2006, 2007 (ajout de la mission d’insertion professionnelle), 2008,
  2013 (ajout de la mission de réussite), 2014, 2019, 2020 et 2022 ;
- des réformes donnant plus de contrôle et de visibilité à l’Etat : à
  l’articulation -3/+3, ORE/Parcoursup (2018) transfère le contrôle des
  capacités d’accueil et des quotas aux rectorats, et MonMaster
  (2017-2023) donne de la visibilité à l’articulation +3/+5 ;
- des discours clairement orientés vers la seule insertion
  professionnelle, à tous les niveaux : par exemple, à propos du Lycée
  Professionnel « *L’objectif est de transformer le quart de ces
  formations dont ces taux sont les plus faibles pour qu’elles ne soient
  plus proposées aux élèves à la rentrée 2026* »[^2], et à propos de
  l’université « *C’est exactement comme on fait pour le Lycée pro..
  Vous avez deux critères. 1. Est-ce que les étudiants ont un diplôme
  ? 2. Est-ce qu’après le diplôme, ils ont des emplois ?* », et de
  conclure « *On doit réallouer les choses* »[^3].

Ainsi, depuis la loi LRU, « *Le pilotage ministériel de l’insertion
professionnelle s’est traduit par une intense action normative* » (Éric
Piozin et al. (2020)). Récemment, le premier des quatre « *objectifs de
politique publique* » des contrats d’objectifs, de moyens et de
performances (COMP), dont l’ambition est de moduler les dotations des
établissements, est « *la mobilisation de l’enseignement supérieur et de
la recherche en faveur de formations préparant les étudiants à exercer
des* ***métiers d’avenir, en tension ou en évolution,*** *et prenant en
compte les nécessités de leur territoire* »(gras d’origine) (DGESIP
(2023)).

L’ajout de l’insertion professionnelle comme mission de l’enseignement
supérieur est donc en réalité très récente, et s’inscrit à une période
très particulière de ciseau entre les effectifs de Licence et de Master,
qui s’explique notamment car « *L’enjeu est de préserver le taux
d’insertion professionnelle* »[^4].

<img src="proposition-esr2024_files/figure-gfm/l3m1.decal-1.png" height="60%" style="display: block; margin: auto;" />

### Du « GPEC de la nation » à InserSup, sans oublier l’enquête IP

L’État cherche donc à développer une politique de « gestion
prévisionnelle des emplois et des compétences (GPEC) de la nation »[^5],
et pour cela développe plusieurs outils de pilotage, sans forcément en
faire la publicité, tels que FRESQ (Formations Reconnues de
l’Enseignement Supérieur de Qualité)[^6] et Quadrant (positionnement des
mentions en fonction du taux de réussite et du taux d’insertion
professionnelle).

Pour fonctionner, ces outils ont besoin d’être alimentés en données
précises et exhaustives sur l’insertion professionnelle des diplômés.
C’est l’objet du dispositif InserSup (SIES (2023)) porté par le MESR et
développé par le SIES. Ce projet à vocation à remplacer, au niveau
central, les enquêtes d’insertion professionnelle (IP),
traditionnellement menées dans les établissements par les observations
de la vie étudiante (OVE). Insersup incarne ainsi la double fonction des
statistiques, à la fois outils de preuve et outils de
gouvernement (Desrosières (2008))

Cette communication propose de décrire comment sont produites ces
données, et d’identifier les différences entre les deux dispositifs de
production et leurs résultats. Cette analyse permet d’étudier la mise en
place du pilotage de l’offre de formation, qui *in fine* décrit notre
politique d’enseignement supérieur au niveau national.

## Méthodologie

Ce travail prend appui sur les travaux séminaux de Desrosières, qui nous
ont appris que les données ne reflètent pas le monde social mais le
« reconfigurent et \[le\] transforment » (Desrosières (2008)), la mesure
étant précédée d’une étape techno-politique de définition des
conventions d’équivalence à appliquer.

Pour identifier les conséquences de cette étape techno-politique, nous
analysons la méthodologie de InserSup (SIES (2023)) et de l’enquête IP,
puis nous exploitons les données ouvertes de leurs résultats[^7].

Les traitements sont effectués avec R (R Core Team 2013) et les
visualisations avec ggplot (Wickham 2016), en respectant les principes
fondamentaux établis dans (Wilke 2019) et les procédures de production
et publication RMarkdown (Xie, Allaire, and Grolemund 2019).

L’analyse se concentre sur les diplômés de Master de la session 2020, à
30 mois, hors Master d’enseignement. Des informations additionnelles
sont issues du projet kpiESR[^8] qui compile plusieurs jeux de données
ouvertes.

## Principaux résultats

Notre analyse montre que les méthodes de production sont radicalement
différentes : enquête auprès des étudiants pour IP ; et croisement de
fichiers administratifs pour InserSup. Ces méthodes de production
présentent des limites très différentes : taux de réponse, imprécisions
et suspicion de chanstique[^9] (Bruno and Didier (2013)) d’un côté ;
cécité aux informations non quantifiées dans les fichiers de l’autre.

Au final, on dispose de trois indicateurs :

- taux d’insertion (IP) : diplômés en emploi / diplômés sur le marché du
  travail (emploi + chômage, ou taux d’emploi net) ;
- taux d’emploi (IP) : diplômés en emploi / diplômés ;
- taux d’emploi salarié en France (InserSup) : diplômés en emploi
  seulement salarié en France / diplômés.

Leur définition dépend essentiellement de contingences techniques mais
aboutissent à des considérations politiques très différentes :
satisfaction des étudiants d’un côté, satisfaction des besoins de
l’emploi français de l’autre.

Dans le cadre du pilotage de l’offre de formation, la valeur absolue des
indicateurs compte moins que les comparaisons qui peuvent être faites :
si on souhaite par exemple « transformer le quart \[des\] formations »,
le choix de l’indicateur peut donc conduire à des décisions de pilotage
différentes, si l’ordre entre les formations est différent.

La comparaison de ces trois indicateurs permet de faire plusieurs
observations.

Premièrement, la vision rapportée par InserSup est globalement 10 points
en dessous de IP, mais s’effondre en Lettres-Langues-Arts (LLA).

<img src="proposition-esr2024_files/figure-gfm/tdx.dom-1.png" style="display: block; margin: auto;" />

Mais cette différence s’explique essentiellement par la nature des
emplois dans ces disciplines : il n’y a rien d’étonnant à ce que
Français-langue étrangère passe de 85% de taux d’insertion à moins de
50% de taux d’emploi salarié en France, car cette filière conduit à des
emplois à l’international. L’indicateur peut donc être perçu en
opposition avec la mission de l’ESR « promotion et à diffusion de la
francophonie dans le monde ».

<img src="proposition-esr2024_files/figure-gfm/tdx.disc-1.png" style="display: block; margin: auto;" />

Deuxièmement, l’analyse des indicateurs montre de bien plus grandes
différences entre les établissements, y compris avec des chutes
spectaculaires. L’université de Lorraine passe ainsi d’un taux global de
92% d’insertion professionnelle à à peine plus de 50%.

<img src="proposition-esr2024_files/figure-gfm/tds.vs.tip3-1.png" style="display: block; margin: auto;" />

Cette piètre performance ne s’explique pas par des raisons pédagogiques,
mais plutôt par des particularités du bassin d’emplois : la Lorraine est
frontalière avec le Luxembourg, qui embauche une grande partie des
diplômés en Droit et en Informatique, notamment.

<img src="proposition-esr2024_files/figure-gfm/lorraine2-1.png" style="display: block; margin: auto;" />

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

<img src="proposition-esr2024_files/figure-gfm/unnamed-chunk-1-1.png" style="display: block; margin: auto;" />

Un croisement avec le budget par étudiant et le périmètre d’excellence
conduit également à devoir interroger la pertinence des « politiques
d’excellence » et des « dialogues stratégiques et de gestion » (qui
aboutissent à l’allocation des moyens aux établissements) en terme
d’insertion professionnelle.

<img src="proposition-esr2024_files/figure-gfm/unnamed-chunk-2-1.png" style="display: block; margin: auto;" />

Il faut ici noter que toutes les différences que nous venons de voir
trouvent facilement des explications légitimes, souvent sans rapport
avec les politiques académiques de réussite. Or, ces explications
neutralisent l’information portée par la donnée dès lors qu’on veut s’en
servir pour du pilotage : même si on estime souhaitable de réduire la
dépense publique dans les filières « qui ne mènent pas à l’emploi », il
sera difficile d’assumer d’affaiblir la francophonie ou les poursuite
d’étude des femmes, et il sera impossible d’empêcher les diplômés
d’aller travailler à l’étranger si les conditions d’embauche y sont
meilleures.

Le pilotage de l’offre de formation qui prend forme croise difficilement
les grands enjeux portés par les universités et leur obligation
d’informer les étudiants et d’accompagner leur choix d’orientation. La
publication des indicateurs de pilotage issus d’insersup sur la
plateforme MonMaster et les interrogations qu’ils ont engendrées auprès
de la communauté universitaire en sont une des illustrations.

Il y a donc ici une forme de démesure dans l’ambition prêtée à ces
mesures de l’insertion professionnelle : si elles sont intéressantes
pour comprendre le système et suivre son évolution, elles deviennent
médiocres dès lors qu’on s’en sert pour prendre des décisions de
pilotage de l’offre de formation. C’est une parfaite illustration de la
« Loi de Goodhart » : « lorsqu’une mesure devient un objectif, elle
cesse d’être une bonne mesure » (Strathern (1997)).

En conclusion, la mesure de l’insertion professionnelle se confronte
donc à des limites qui menacent leur utilisabilité en terme de pilotage
de l’offre de formation. Ces limites sont d’abord méthologiques, mais se
révèlent ensuite être plus fondamentales, questionnant l’idée même de
les utiliser à des fins de pilotage. Même si l’enquête InserSup devrait
rapidement s’améliorer, d’abord en tenant compte des critiques qui lui
sont adressées, ensuite en augmentant son périmètre, rien n’indique à ce
stade que ses données seront utilisables pour rationaliser la
transformation de l’offre de formation.

# Eléments de discussion

Cette proposition amène plusieurs éléments de discussion, qui pourront
être développées dans la communication si elle est retenue, dont
notamment :

- Si une utilisation directe des indicateurs est impossible, est-ce
  qu’une utilisation indirecte reste envisageable pour un pilotage de
  l’offre de formation ?
- Quelles sont les autres utilisations possibles ?
- Quelles pourraient être les conséquences d’une extension d’InserSup au
  secteur privé ?
- Est-ce que tous les objectifs de l’ESR peuvent être réductibles à des
  indicateurs de pilotage ?
- Est-ce que les observatoires effectuant les enquêtes IP sont destinés
  à disparaitre ou à redefinir leurs missions ?
- Est-ce que la bascule d’une production de données locales par enquête
  à une production de données nationales par croisement de fichiers
  présente des dangers ?

# Principales références bibliographiques

<div id="refs" class="references csl-bib-body hanging-indent"
entry-spacing="0">

<div id="ref-blanchardmarianneSelectionsSystemeEducatif2020"
class="csl-entry">

Blanchard Marianne, Boudesseul Gérard, Couppié Thomas, Epiphane
Dominique, Giret Jean-François, Lemistre Philippe, Manifet Christelle,
et al. 2020. “Sélections, Du Système Éducatif Au Marché Du Travail.” 16.
Céreq.

</div>

<div id="ref-brunoBenchmarkingEtatSous2013" class="csl-entry">

Bruno, Isabelle, and Emmanuel Didier. 2013. *Benchmarking: l’État sous
pression statistique*. Paris: Zones.

</div>

<div id="ref-desrosieres_pour_2008" class="csl-entry">

Desrosières, Alain. 2008. *Pour une sociologie historique de la
quantification : L’Argument statistique I*. Sciences sociales. Paris:
Presses des Mines.

</div>

<div id="ref-dgesipLancementContratsObjectifs2023" class="csl-entry">

DGESIP. 2023. “Lancement Des Contrats d’objectifs, de Moyens Et de
Performances (COMP).”

</div>

<div id="ref-ericpiozinMissionInsertionProfessionnelle2020"
class="csl-entry">

Éric Piozin, Astrid Kretchner, Claudine Picaronny, and Olivier Rey.
2020. “La mission d’insertion professionnelle de l’université : bilan
dix ans après la loi relative aux libertés et responsabilités des
universités.” IGESR.

</div>

<div id="ref-eyraudEnjeuxQuantificationDans2011" class="csl-entry">

Eyraud, Corine, Mustapha El Miri, and Patrick Perez. 2011. “Les enjeux
de quantification dans la LOLF. Le cas de l’enseignement supérieur.”
*Revue Francaise de Socio-Economie* n$^\circ$ 7 (1): 147–68.

</div>

<div id="ref-glaymannProfessionnalisationFormationsScolaires2021"
class="csl-entry">

Glaymann, Dominique, and Fabienne Maillard. 2021. “La
professionnalisation des formations scolaires et universitaires, entre
discours et mises en œuvre.” *Formation emploi* 156 (4): 7–12.
<https://doi.org/10.4000/formationemploi.10148>.

</div>

<div id="ref-leclairEnjeuxEconomiquesOrientation2024" class="csl-entry">

Leclair, Blaise, and Agathe Veniez. 2024. “Les enjeux économiques de
l’orientation scolaire et universitaire.” 344. Directin générale du
Trésor.

</div>

<div id="ref-lucietanguyIntrouvableRelationFormation1986"
class="csl-entry">

Lucie Tanguy. 1986. *L’Introuvable Relation Formation/Emploi: Un État
Des Recherches En France*. Edited by Lucie Tanguy and Programme
mobilisateur technologie, emploi, travail (France). Paris: Documentation
française.

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

<div id="ref-siesInserSupNoteMethodologique2023" class="csl-entry">

SIES. 2023. “InserSup - Note méthodologique.”

</div>

<div id="ref-strathernImprovingRatingsAudit1997" class="csl-entry">

Strathern, Marilyn. 1997. “‘Improving Ratings’: Audit in the British
University System.” *European Review* 5 (3): 305–21.
[https://doi.org/10.1002/(SICI)1234-981X(199707)5:3\<305::AID-EURO184\>3.0.CO;2-4](https://doi.org/10.1002/(SICI)1234-981X(199707)5:3<305::AID-EURO184>3.0.CO;2-4).

</div>

<div id="ref-vinokurGouvernanceUniversitesPar2017" class="csl-entry">

Vinokur, Annie. 2017. “La Gouvernance Des Universités Par La Qualité.”
*Recherche Et Pratiques pédagogiques En Langues de Spécialité \[En
Ligne\]* Vol. 36 (March): 1–17.

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

Xie, Yihui, Joseph J. Allaire, and Garrett Grolemund. 2019. *R Markdown:
The Definitive Guide*. Chapman & Hall/CRC, the R Series. Boca Raton
London New York: CRC Press, Taylor & Francis Group.

</div>

</div>

[^1]: 
    <https://www.legifrance.gouv.fr/codes/section_lc/LEGITEXT000006071191/LEGISCTA000006166563/#LEGISCTA000006166563>

[^2]: Carole Grandjean, ministre déléguée chargée de l’Enseignement et
    de la Formation professionnels, pour Libération
    <https://www.liberation.fr/societe/education/reforme-du-lycee-professionnel-carole-grandjean-detaille-lannee-de-terminale-20231122_ATPXLTUVJJCUBKDBS66IKTI7GQ/>

[^3]: Emmanuel Macron, Président de la République, face à Hugo Decrypte
    <https://www.youtube.com/watch?v=3Z6HnUJ3hcw>

[^4]: Frédérique Vidal, Ministre de l’ESR,
    <https://www.lefigaro.fr/actualite-france/frederique-vidal-l-enjeu-est-de-preserver-le-taux-d-insertion-professionnelle-20210921>

[^5]: <https://education.newstank.fr/article/view/306378/rencontre-emmanuel-macron-etablissements-themes-discutes-elysee-14-11-2023.html>

[^6]: <https://choisirleservicepublic.gouv.fr/offre-emploi/c-esr-a2-3---cheffe-de-projet-informatique---domaine--formations--hf-reference-2024-1477164/>

[^7]: <https://data.enseignementsup-recherche.gouv.fr/explore/dataset/fr-esr-insersup>

[^8]: <https://github.com/cpesr/kpiESR>

[^9]: La *chanstique* réfère à la manipulation des indicateurs.
