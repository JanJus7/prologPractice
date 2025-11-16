train(paris,marseille,tgv).
train(paris,brest,tgv).
train(paris,rennes,tgv).
train(paris,rennes,ter).
train(rennes,brest,ter).
train(paris,lyon,tgv).
train(lyon,marseille,ter).
train(lyon,rennes,tgv).
train(marseille,nice,ter).

liaison(X,Y) :- train(X,Y).
liaison(X,Y) :- 
    train(X,Z),
    train(Z,Y).

liaison2(X,Y,T) :- train(X,Y,T).
liaison2(X,Y,T) :- train(X,Z,T), train(Z,Y,T).
liaison2(X,Y,T) :- train(X,Z,T1), train(Z,Y,T2), T1\=T2.

liaison3(X, Y) :- 
    train(X,Y,_).
liaison3(X, Y) :-
    train(X,Z,_),
    liaison3(Z,Y).

transit(D, A, []) :-
    train(D,A,_).
transit(D, A, [Z|L]) :-
    train(D, Z, _),
    transit(Z, A, L).

transit2(X, Y) :- transit(X, Y, L),
    (foreach(A, L) do write(A), write(" ")),
    writeln("").
    