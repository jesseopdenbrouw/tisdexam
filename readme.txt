

DOCUMENT CLASS tisdexam
=======================

versie: 2.0h
datum:  04-jan-2021


-----------------------
Dit is de nieuwe document class tisdexam die geschikt is voor de
toetsvoorbladen vanaf het schooljaar 2020-2021.

Zowel de nederlandse als de engelse toetsvoorbladen zijn geimplementeerd.

Er is zoveel gewijzigd ten opzichte van het vorige toetsvoorblad (v1.8) zodat
er geen poging is gedaan om de oude opties en commando's af te vangen met
een foutmelding. De document class is tamelijk groot, zo'n 370 kB. Dat komt
omdat de logo's van TIS erg veel ruimte innemem.

LEES VOORAL DE DOCUMENTATIE.


Deze document class is getest met TeXlive 2022 en TexStudio 4.2.2

Nieuw in versie 2.0i
--------------------
* nameref wordt eerder geladen om een probleem met \AtBeginDocument te omzeilen.

Nieuw in versie 2.0h
--------------------
* De optie (aankruisvakje) 'Tekenbenodigheden' is verwijderd.

Nieuw in versie 2.0g
--------------------
* Er staat weer "Voor dit tentamen gelden de regels uit de toetsregeling van het Onderwijs- en Examenreglement."
  op het voorblad.

Nieuw in versie 2.0f
--------------------
* Op het voorblad staat nu weer "In te leveren door student bij surveillant:"


Nieuw in versie 2.0e
--------------------
* Het command \module is verwijderd.
* Het commando \cursuscode is toegevoegd.
* Op het Nederlandse voorblad is "module" gewijzigd in "cursuscode"


Nieuw in versie 2.0d
--------------------
* 10 pt is nu ook echt 10 pt
* class is Lualatex en Xelatex aware (Rufus)
* Diverse gecommentarieerde code verwijderd.


Jesse, 04-jan-2021
