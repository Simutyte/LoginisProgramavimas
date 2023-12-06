/* Rugilė Simutytė 4 kursas, 1 grupė
   variantai: 16; 28; 31; 34 */

/*asmuo(Vardas, Lytis, Amžius, Pomėgis);*/

asmuo(aldona, moteris, 75, maisto-gaminimas).
asmuo(antanas, vyras, 80, masinos).

asmuo(renata, moteris, 54, maisto-gaminimas).
asmuo(arunas, vyras, 56, futbolas).
asmuo(greta, moteris, 32, piesimas).
asmuo(laura, moteris, 30, maisto-gaminimas).
asmuo(rugile, moteris, 22, futbolas).

asmuo(rokas, vyras, 32, krepsinis).
asmuo(patricija, moteris, 3, piesimas).

asmuo(antonijus, vyras, 88, grybavimas).
asmuo(stanislava, moteris, 85, grybavimas).

asmuo(laima, moteris, 74, muzika).
asmuo(kazimieras, vyras, 79, krepsinis).

asmuo(antaninas, vyras, 54, grybavimas).
asmuo(jolanta, moteris, 52, muzika).
asmuo(ovidijus, vyras, 30, krepsinis).
asmuo(marius, vyras, 28, grybavimas).

asmuo(vitalija, moteris, 25, maisto-gaminimas).
asmuo(jonas, vyras, 5, krepsinis).

/* mama(Mama, Vaikas);*/

mama(aldona, renata).

mama(renata, greta).
mama(renata, laura).
mama(renata, rugile).

mama(greta, patricija).

mama(stanislava, arunas).
mama(stanislava, antaninas).

mama(laima, jolanta).

mama(jolanta, ovidijus).
mama(jolanta, marius).

mama(vitalija, jonas).

/* pora(Vyras, Žmona).*/

pora(antanas, aldona).
pora(arunas, renata).
pora(rokas, greta).
pora(antonijus, stanislava).
pora(antaninas, jolanta).
pora(ovidijus, vitalija).
pora(kazimieras, laima).


tetis_mama(TetisMama, Vaikas) :- mama(TetisMama, Vaikas).
tetis_mama(TetisMama, Vaikas) :- mama(Mama, Vaikas), pora(TetisMama, Mama).

/* 16.anukas(Anukas, SenelisSenele) - Pirmasis asmuo (Anukas) yra antrojo (SenelisSenele) anūkas (bet ne anūkė!); */

anukas(Anukas, SenelisSenele) :- asmuo(Anukas, vyras, _, _),
                                 tetis_mama(TetisMama, Anukas),
                                 tetis_mama(SenelisSenele, TetisMama).

/* 
iš mamos mamos pusės
anukas(ovidijus, laima).

iš mamos tėčio pusės
anukas(marius, kazimieras).

iš tėčio mamos pusės
anukas(ovidijus, stanislava).
anukas(marius, stanislava).

iš tėčio tėčio pusės
anukas(ovidijus, antonijus).
anukas(marius, antonijus).*/


/* 28.turi_vaiku(TevasMama) - Asmuo TevasMama turi vaikų; */

turi_vaiku(TevasMama) :- mama(TevasMama, _).
turi_vaiku(TevasMama) :- pora(TevasMama, Mama),
                         mama(Mama, _).

/*
turi_vaiku(ovidijus).
turi_vaiku(greta).
turi_vaiku(rugile). - F
*/

/* 31.vpjz(Vyras) - Asmuo Vyras yra „vyras pačiame jėgų žydėjime“: jo amžius yra iš tam tikro intervalo (nuspręskite patys, kokio); */
/* 20-50 */
vpjz(Vyras) :- asmuo(Vyras, vyras, Amzius, _), 
               Amzius >= 20,
               Amzius =< 50.

/*
vpjz(rokas).
vpjz(greta). - F
*/

/* 34.paveldejo(Asmuo, Pomegis) - Asmuo Asmuo turi tokį patį pomėgį Pomegis kaip ir vienas iš tėvų; */

paveldejo(Asmuo, Pomegis) :- asmuo(Asmuo, _, _, Pomegis),
                             tetis_mama(TetisMama, Asmuo), 
                             asmuo(TetisMama, _, _, Pomegis).

/*
paveldejo(laura, maisto-gaminimas).
paveldejo(antaninas, grybavimas). 
paveldejo(greta, futbolas). - F
*/