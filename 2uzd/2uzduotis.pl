/* Rugilė Simutytė 4 kursas, 1 grupė
   variantai: 1.1; 4.3 */

/*
Kelių tinklas. Keliai vienakrypčiai, nesudarantys ciklų. Kiekvienas kelias turi savo ilgį
kelias(Miestas1, Miestas2, Atstumas).
Apibrėžkite predikatą „galima nuvažiuoti iš miesto X į miestą Y“:
1.1. taip kad bendras nuvažiuotas atstumas neviršytų L kilometrų.
*/

kelias(marijampole, kaunas, 60).

kelias(kaunas, elektrenai, 50).
kelias(elektrenai, vilnius, 50).
kelias(vilnius, moletai, 60).
kelias(vilnius, ignalina, 110).
kelias(moletai, utena, 40).
kelias(utena, ignalina, 50).

kelias(kaunas, klaipeda, 210).
kelias(klaipeda, palanga, 30).

kelias(kaunas, siauliai, 170).
kelias(siauliai, kursenai, 30).
kelias(kursenai, akmene, 30).

kelias(kaunas, jonava, 30).
kelias(jonava, panevezys, 90).
kelias(jonava, ukmerge, 40).

galima_nuvaziuot(Miestas1, Miestas2, MaxAtstumas):-
   kelias(Miestas1, Miestas2, Ats),
   Ats =< MaxAtstumas.

galima_nuvaziuot(Miestas1, Miestas2, MaxAtstumas):-
   kelias(Miestas1, Tarpinis, Ats1),
   NaujasMaxAtstumas is MaxAtstumas - Ats1,
   NaujasMaxAtstumas > 0,
   galima_nuvaziuot(Tarpinis, Miestas2, NaujasMaxAtstumas).


/*
galima_nuvaziuot(vilnius, ignalina, 110). - T
galima_nuvaziuot(marijampole, akmene, 290). - T
galima_nuvaziuot(marijampole, akmene, 289). - F
galima_nuvaziuot(marijampole, utena, 300). - T
galima_nuvaziuot(ukmerge,marijampole, 300). - F
*/



/*
Duotas natūrinis skaičius N. Naudodami rekursyvųjį algoritmą, raskite:
4.3 N-ąjį Pelo skaičių. Pavyzdžiui:
?- pell(10,Pel).
Pel = 2378.
*/

pell(0, 0).
pell(1, 1).
pell(N, Pel) :-
   N > 1,
   N1 is N-1,
   N2 is N-2,
   pell(N1, Pel1),
   pell(N2, Pel2),
   Pel is 2*Pel1 + Pel2.

/*
3 -> 5
6 -> 70
8 -> 408
*/
