:- lib(fd).

% cafe(950, 320, [30,50,50,100,25], euro2=X200, euro1=X100, cent50=X50, cent20=X20, cent10=X10).

cafe(T,P,[E2,E1,C50,C20,C10], euro2=X200, euro1=X100, cent50=X50, cent20=X20, cent10=X10) :-
    X200 :: [0..E2],
    X100 :: [0..E1],
    X50  :: [0..C50],
    X20  :: [0..C20],
    X10  :: [0..C10],
    (200*X200 + 100*X100 + 50*X50 + 20*X20 + 10*X10) #= (T-P),
    labeling([X200,X100,X50,X20,X10]).

cafeun(T, P, E, L) :- cafe(T, P, E, L), !.

cafeall(T, P, E) :- findall(L, cafe(T, P, E, L), S),
    length(S, Nb),
    (foreach(X, S) do writeln(X)),
    printf("Nombre de solutions: %d%n", Nb).

cafeNbAll(T, P, E) :- findall(L, cafe(T, P, E, L), S),
    length(S, Nb),
    printf("Nombre de solutions: %d%n", Nb).

cafeOpti1(T,P,[E2,E1,C50,C20,C10], [euro2=X200, euro1=X100, cent50=X50, cent20=X20, cent10=X10]) :-
    X200 :: [0..E2],
    X100 :: [0..E1],
    X50  :: [0..C50],
    X20  :: [0..C20],
    X10  :: [0..C10],
    (200*X200 + 100*X100 + 50*X50 + 20*X20 + 10*X10) #= (T-P),
    NbPieces #= X20 + X100 + X50 + X20 + X10,
    minimize(labeling([X200,X100,X50,X20,X10]), NbPieces),
    printf("Nombre de pieces: %d%n", NbPieces).

cafeOptiMax(T,P,[E2,E1,C50,C20,C10], [euro2=X200, euro1=X100, cent50=X50, cent20=X20, cent10=X10]) :-\
    X200 :: [0..E2],
    X100 :: [0..E1],
    X50  :: [0..C50],
    X20  :: [0..C20],
    X10  :: [0..C10],
    (200*X200 + 100*X100 + 50*X50 + 20*X20 + 10*X10) #= (T-P),
    NbPieces #= X20 + X100 + X50 + X20 + X10,
    NbPiecesNeg #= - NbPieces,
    minimize(labeling([X200,X100,X50,X20,X10]), NbPiecesNeg),
    printf("Nombre de pieces: %d%n", NbPieces).

cafeOpti2(T,P,[E2,E1,C50,C20,C10], [euro2=X200, euro1=X100, cent50=X50, cent20=X20, cent10=X10]) :-
    X200 :: [0..E2],
    X100 :: [0..E1],
    X50  :: [0..C50],
    X20  :: [0..C20],
    X10  :: [0..C10],
    (200*X200 + 100*X100 + 50*X50 + 20*X20 + 10*X10) #= (T-P),
    mini([X200,X100,X50,X20,X10], [E2, E1, C50, C20, C10], NbMinPieces).
    NbMinPiecesNeg #= - NbMinPieces,
    minimize(labeling([X200,X100,X50,X20,X10]), NbMinPiecesNeg),
    printf("Nombre de pieces: %d%n", NbPieces).



































    
    
    