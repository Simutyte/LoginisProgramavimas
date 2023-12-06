/* Rugilė Simutytė 4 kursas, 1 grupė
   variantai: 1.3; 2.7; 3.6; 4.9 */

/*
paprasti predikatai su sveikųjų sk sąrašais
šalia esančių narių skirtumas vienodas
1.3. progr(S) - teisingas, kai visi duoto sveikųjų skaičių sąrašo S elementai sudaro aritmetinę progresiją. Pavyzdžiui:
?- progr([1,4,7,10]).
true.
*/

progr([X, Y | Tail]) :- 
      Z is Y-X, 
      tikrinti_progresija(Z, [Y | Tail]),
      !.

tikrinti_progresija(_, [_]).
tikrinti_progresija(S, [X, Y | Tail]) :-
      S =:= Y-X, 
      tikrinti_progresija(S, [Y | Tail]).

/*
progr([1,4,7,10]). - T
progr([1,4,7,11]). - F
progr([2,0,-2, -4]). - T
*/


/*
paprasti nearitmetiniai predikatai
2.7. posarasis(S1,S2) - sąrašas S1 susideda iš (gal būt ne visų) sąrašo S2 elementų, išdėstytų ta pačia tvarka, kaip ir sąraše S1. Kitaip tariant, iš sąrašo S2 išmetus tam tikrus elementus, galime gauti sąrašą S1. Pavyzdžiui:
?- posarasis([1,3],[1,8,3,5]).
true.
*/

% jei pirmam nebeliko elementu - tinkamas
posarasis([], _).

% jei ir tam ir tam yra, sumazinam ir siunciam toliau
posarasis([X | Tail1], [X| Tail2]) :-
   !, posarasis(Tail1, Tail2).

% jei nesutampa einam per antra sarasa toliau
posarasis([X | Tail1], [_| Tail2]) :-
    posarasis([X | Tail1], Tail2).
   
/*
posarasis([1,3],[8,3,1,5]). - F
posarasis([1,3],[1,8,3,5]). - T
posarasis([1,3],[2,4,8,5]). - F
posarasis([1,3],[2,1,8,5]). - F
*/


/*
3.6. rusiuoti(S,R) - sąrašas R gaunamas išrūšiavus duotojo skaičių sąrašo S elementus didėjimo tvarka. Pavyzdžiui:
?- rusiuoti([1,23,5,1,2],R).
R = [1,1,2,5,23].
*/

rusiuoti([], []).
rusiuoti([X|T], R) :-
   rusiuoti(T, BeveikR),
   iterpti(X, BeveikR, R), !.

iterpti(X, [], [X]).
iterpti(X, [Y|T], R) :- X > Y, iterpti(X, T, Rest), R = [Y|Rest].
iterpti(X, [Y|T], R) :- X =< Y,  R = [X, Y | T].

/*
rusiuoti([1,23,5,1,2],R). - R = [1,1,2,5,23].
rusiuoti([1,2,1,2,1],R). - R = [1, 1, 1, 2, 2].
rusiuoti([5,4,-2,3,0,-17],R). - R = [-17, -2, 0, 3, 4, 5].

Operacijos su natūraliaisiais skaičiais, išreikštais skaitmenų sąrašais. 
Skaitmenų sąrašo elementai turi būti natūralūs skaičiai nuo 0 iki 9 (ne simboliai '0', '1',...). 
Nenaudokite Prolog konvertavimo tarp sąrašo ir skaičiaus predikatų (number_chars/2, number_codes/2 ir kt...):
4.9. didesnis(S1,S2) - S1 ir S2 yra skaičiai vaizduojami skaitmenų sąrašais. Predikatas didesnis(S1,S2) teisingas tada ir tiktai data, kai pirmasis skaičius yra didesnis už antrąjį. Pavyzdžiui:
?- didesnis([1,4,6,1,3,4],[9,8]).
true
*/


didesnis(S1, S2):- saraso_skaicius(S1, 0, Sk1), saraso_skaicius(S2, 0, Sk2), Sk1 > Sk2.

% is saraso i skaiciu
saraso_skaicius([X|T], LaikRez, Rez) :-
      LaikRez2 is LaikRez*10+X,
      saraso_skaicius(T, LaikRez2, Rez).

saraso_skaicius([], Rez, Rez).


/*
didesnis([1,4,6,1,3,4],[9,8]). - T
didesnis([1,4,6,1,3,4],[9,8]). - F
didesnis([0,0,0,0,9,8],[0,0,1,0,9,8]). - F
*/


/*
146:
0*10+1 = 1
1*10+4 = 14
14*10+6 = 146
*/