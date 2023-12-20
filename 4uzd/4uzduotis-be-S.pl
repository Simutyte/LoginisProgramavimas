/* Rugilė Simutytė 4 kursas, 1 grupė

1.Vandens perpylimo uždavinys.
Duotos trijų indų talpos, kurios visos yra skirtingos. 
Pirmasis indas pilnas vandens, kiti du tušti. 
Iš vieno indo į kitą galima perpilti lygiai tiek vandens, kiek telpa kitame inde arba lygiai tiek, 
kiek yra pirmajame (žiūrint, kuris dydis mažesnis). 
Uždavinio rezultatas - vykdomų perpylimų seka.
Nustatykite, kaip galima, perpilant vandenį iš vienų indų į kitus, gauti pirmajame inde tam tikrą vandens kiekį
*/


/* bendras perpylinejimas */
perpilti((X, Y, Z), (X1, Y1, Z1), (T1, T2, T3), Veiksmas) :-
    perpilti_is_pirmo_i_antra(X, Y, Z, X1, Y1, Z1, T2, Veiksmas) ;
    perpilti_is_antro_i_trecia(X, Y, Z, X1, Y1, Z1, T3, Veiksmas) ;
    perpilti_is_trecio_i_pirma(X, Y, Z, X1, Y1, Z1, T1, Veiksmas);

    perpilti_is_pirmo_i_trecia(X, Y, Z, X1, Y1, Z1, T3, Veiksmas) ;
    perpilti_is_antro_i_pirma(X, Y, Z, X1, Y1, Z1, T1, Veiksmas) ;
    perpilti_is_trecio_i_antra(X, Y, Z, X1, Y1, Z1, T2, Veiksmas).

/* perpylimai */
perpilti_is_pirmo_i_antra(X, Y, Z, X1, Y1, Z, T2, "1 -> 2") :-
    X > 0,
    Y < T2,
    Perpilama is min(X, T2 - Y),
    X1 is X - Perpilama,
    Y1 is Y + Perpilama.

perpilti_is_pirmo_i_trecia(X, Y, Z, X1, Y, Z1, T3, "1 -> 3") :-
    X > 0,
    Z < T3,
    Perpilama is min(X, T3 - Z),
    X1 is X - Perpilama,
    Z1 is Z + Perpilama.

perpilti_is_antro_i_trecia(X, Y, Z, X, Y1, Z1, T3, "2 -> 3") :-
    Y > 0,
    Z < T3,
    Perpilama is min(Y, T3 - Z),
    Y1 is Y - Perpilama,
    Z1 is Z + Perpilama.

perpilti_is_antro_i_pirma(X, Y, Z, X1, Y1, Z, T1, "2 -> 1") :-
    Y > 0,
    X < T1,
    Perpilama is min(Y, T1 - X),
    Y1 is Y - Perpilama,
    X1 is X + Perpilama.

perpilti_is_trecio_i_pirma(X, Y, Z, X1, Y, Z1, T1, "3 -> 1") :-
    Z > 0,
    X < T1,
    Perpilama is min(Z, T1 - X),
    Z1 is Z - Perpilama,
    X1 is X + Perpilama.

perpilti_is_trecio_i_antra(X, Y, Z, X, Y1, Z1, T2, "3 -> 2") :-
    Z > 0,
    Y < T2,
    Perpilama is min(Z, T2 - Y),
    Y1 is Y + Perpilama,
    Z1 is Z - Perpilama.




/* Paieska */
ieskoti(Tikslas, _, _, Tikslas, [(Tikslas, 'Tikslas pasiektas')]).

ieskoti(Busena, Aplankyta, Talpos, Tikslas, [(KitaBusena, Veiksmas)|Kelias]) :-
    perpilti(Busena, KitaBusena, Talpos, Veiksmas),
    \+ member(KitaBusena, Aplankyta),
    ieskoti(KitaBusena, [KitaBusena|Aplankyta], Talpos, Tikslas, Kelias).


/* Pradedam paieska 
Tn - talpos, 
I - ieskomas kiekis
*/
pradeti(T1, T2, T3, I) :-
    ieskoti((T1, 0, 0), [], (T1, T2, T3), (I, _, _), Kelias),
    isvedimas([((T1, 0, 0), 'Pradinis:')|Kelias]).

/*
pradeti(8,5,3,4).
*/


/* isvedimas */
isvedimas([]).
isvedimas([(Busena, Veiksmas)|T]) :-
    write(Veiksmas), write('   '), write(Busena), nl,
    isvedimas(T).
