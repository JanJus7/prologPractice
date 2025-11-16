pere(marcel,mario).
pere(marcel,anne).
pere(mario,theo).
pere(mario,ines).
pere(aime,marcel).
pere(luc,emma).
pere(marc,enzo).

mere(marthe,mario).
mere(marthe,anne).
mere(julie,theo).
mere(julie,enzo).
mere(dorothee,ines).
mere(anne,emma).

parent(X,Y) :-
    pere(X,Y).
parent(X,Y) :-
    mere(X,Y).

est_pere(X) :-
    pere(X,_).
    
est_mere(X) :-
    mere(X,_).

couple(X,Y) :-
    pere(X,Z),
    mere(Y,Z). 

siblings(X,Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

grand_pere(X,Z) :-
    pere(X,Y),
    parent(Y,Z).

grand_mere(X,Z) :-
    mere(X,Y),
    parent(Y,Z).