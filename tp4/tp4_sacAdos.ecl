:- lib(fd).

sac(Vmax, P, S) :- 
    length(P,L),
    length(S,L),
    S :: 0..1,
    valeur_sac(S,P,V),
    V #=< Vmax,
    labeling(S). 

valeur_sac([Xs], [Xp], V) :- V #= Xs*Xp, !.
valeur_sac([Xs|S], [Xp|P], V1) :-
    V3 #= Xs*Xp,
    valeur_sac(S, P, V2),
    V1 #= V2+V3.

% Premiere reponse
sac1(Vmax, P, S) :- sac(Vmax, P, S), !.

% Toutes les reponses
sac2(Vmax,P,Sol) :- findall(S,sac(Vmax,P,S),Sol),
    length(Sol,Nb),
    (foreach(X, Sol) do writeln(X)),
    printf("Nb de solutions: %d%n", Nb).

% Optimise la valeur du sac
sac3(Vmax, P, S) :- 
    length(P, L),
    length(S, L),
    S :: 0..1,
    valeur_sac(S, P, V),
    V #=< Vmax,
    Vneg #= - V,
    minimize(labeling(S), Vneg).

sac4(Vmax, P, S) :- 
    length(P,L),
    length(S,L),
    S :: 0..1,
    valeur_sac2(S,P,V, N),
    V #=< Vmax,
    Nneg #= -N,
    minimize(labeling(S), Nneg).

valeur_sac2([Xs], [Xp], V, N) :- V #= Xs*Xp, N #= Xs, !.
valeur_sac2([Xs|S], [Xp|P], V1, N1) :-
    V3 #= Xs*Xp,
    N3 #= Xs,
    valeur_sac2(S, P, V2, N2),
    V1 #= V2+V3,
    N1 #= N2+N3.



sac5_2(Vmax, P, S) :- 
    length(P,L),
    length(S,L),
    S :: 0..1,
    valeur_sac2(S, P, V, N),
    V #=< Vmax,
    Vneg #= -V,
    minimize(labeling(S), Vneg),
    Nneg #= -N,
    minimize(labeling(S), Nneg).

sac5_3(Vmax, P, S) :- 
    length(P,L),
    length(S,L),
    S :: 0..1,
    valeur_sac2(S, P, V, N),
    V #=< Vmax,
    VNneg #= -V*N,
    minimize(labeling(S), VNneg).


% labeling
% findall
% minimize