% Prolog Cheatsheet for Exam

% --- Basic Queries ---
% parent(X,Y).
% pere(X,Y). mere(X,Y).
% liaison(X,Y). liaison3(X,Y).

% --- Debugging ---
% write(...), writeln(...), nl.
% printf("Result: %w\n", [X]).

% --- List Operations ---
% member(X,List).
% append(L1,L2,R).
% length(List,N).
% reverse(List,R).

% --- findall / bagof / setof ---
% findall(X, Goal, List).
% Example:
% findall(Ville, liaison3(paris,Ville), L).

% --- Iteration / foreach ---
% foreach(Element,List,Goal(Element)).
% Example:
% foreach(X, L, writeln(X)).

% --- Path / Transit pattern ---
% Base case:
% transit(D,A,[]) :- train(D,A,_).
% Recursive case:
% transit(D,A,[Z|L]) :- train(D,Z,_), transit(Z,A,L).

% --- Modes ---
% transit(+Depart, +Arrivee, -Liste).
% transit2(+Depart, +Arrivee).

% --- ARYTMETYKA ---
% X is Wyrazenie.     % obliczenia
% <, >, =<, >=.       % porównania (uwaga: nie ma <= !)
% X is Expr.
% <, >, =<, >=.

% --- NEGACJA ---
% \+ Cel.   % prawda, jeśli Cel jest fałszywy

% --- CSP / PROGRAMOWANIE Z OGRANICZENIAMI (lib(fd)) ---
% :- lib(fd).              % załadowanie biblioteki dziedzin skończonych
%
% Deklaracja zmiennych i dziedzin:
% Vars = [S,E,N,D,M,O,R,Y],
% Vars :: 0..9.            % wszystkie zmienne z zakresu 0..9
%
% Różne wartości:
% all_different(Vars).     % wszystkie zmienne w liście muszą być różne
%
% Dodatkowe ograniczenia:
% S #\= 0,                 % S różne od 0
% M #\= 0.                 % M różne od 0
%
% Równania arytmetyczne z #=/ #</ #>/ #=< / #>=
% 1000*S + 100*E + 10*N + D
% + 1000*M + 100*O + 10*R + E
% #= 10000*M + 1000*O + 100*N + 10*E + Y.
%
% Szukanie rozwiązania (labeling):
% labeling(Vars).          % przypisuje konkretne liczby z dziedziny

% Przykład SEND+MORE=MONEY (szkic):
% send_more_money :-
%     Vars = [S,E,N,D,M,O,R,Y],
%     Vars :: 0..9,
%     all_different(Vars),
%     S #\= 0, M #\= 0,
%     1000*S + 100*E + 10*N + D
%       + 1000*M + 100*O + 10*R + E
%     #= 10000*M + 1000*O + 100*N + 10*E + Y,
%     labeling(Vars),
%     printf("S=%d E=%d N=%d D=%d M=%d O=%d R=%d Y=%d\n",
%            [S,E,N,D,M,O,R,Y]).


% \+ Cel.   % prawda, jeśli Cel jest fałszywy
% \+ Goal.

% --- Facts Example ---
% train(paris,rennes,tgv).

% --- OPERACJE WEJŚCIA/WYJŚCIA (I/O) ---
% write(Term).             % wypisuje bez nowej linii
% writeln(Term).           % wypisuje z nową linią
% nl.                      % nowa linia
% printf(Format, Args).    % wypisywanie w stylu C (formatowanie)
% Przykład:
%   printf("Miasto: %w -> %w", [D, A]).
% write(Term).             % Prints term without newline
% writeln(Term).           % Prints term with newline
% nl.                      % Prints newline
% printf(Format, Args).    % C-style formatted output
% Example:
%   printf("City: %w -> %w", [D, A]).

% --- PĘTLA foreach (ECLiPSe) ---
% Składnia:
%   (foreach(Element, Lista) do Cel(Element))
% Wykonuje Cel dla każdego Elementu listy.
% Przykład:
%   print_list(L) :- (foreach(X, L) do write(X), write(" ")), nl.
% Syntax:
%   (foreach(Element, List) do Goal(Element))
% Runs Goal for each Element of List.
% Example:
%   print_list(L) :- (foreach(X, L) do write(X), write(" ")), nl.

% --- findall / bagof / setof ---
% findall(Zmienna, Cel, Lista).
%  • Zbiera WSZYSTKIE rozwiązania celu do listy Lista.
% Przykład:
%   findall(V, liaison3(paris, V), L).
%
% bagof(Zmienna, Cel, Lista).  % jak findall, ale grupuje wg wolnych zmiennych
% setof(Zmienna, Cel, PosortowanaUnikalna).  % jak bagof, ale sortuje i usuwa duplikaty
% findall(Var, Goal, List).         % collects all solutions into List
% Example:
%   findall(V, liaison3(paris, V), L).
%
% bagof(Var, Goal, List).           % like findall, but groups by free variables
% setof(Var, Goal, SortedUnique).   % like bagof but sorted & without duplicates

% --- LISTY ---
% [H|T]     % H = pierwszy element (head), T = reszta listy (tail)
% []        % lista pusta
% append(L1, L2, R).   % łączenie list
% member(X, L).        % prawda, jeśli X występuje w liście
% length(L, N).        % długość listy N
% [H|T]     % H = head, T = tail
% []        % empty list
% append(L1, L2, R).  % concatenates lists
% member(X,L).        % true if X occurs in list
% length(L,N).        % length of list

% --- WZORCE REKURENCJI ---
% 1. Ostatni element listy
% dernier([X], X).             % przypadek bazowy: lista jednoelementowa
% dernier([_|T], X) :-          % pomijamy pierwszy element
%     dernier(T, X).            % szukamy w ogonie
%
% 2. Suma elementów listy
% somme([], 0).                 % suma pustej listy = 0
% somme([H|T], S) :-            % suma = H + suma(tail)
%     somme(T, S2),
%     S is S2 + H.
%
% 3. Połączenia / graf / ścieżki
% liaison3(X,Y) :- train(X,Y,_).    % przypadek bazowy: bezpośrednie połączenie
% liaison3(X,Y) :- train(X,Z,_),     % rekurencja: X -> Z -> ... -> Y
%     liaison3(Z,Y).
% 1. Last Element of List
% dernier([X], X).
% dernier([_|T], X) :- dernier(T, X).
%
% 2. Sum of List
% somme([], 0).
% somme([H|T], S) :- somme(T, S2), S is S2 + H.
%
% 3. Path/Reachability
% liaison3(X,Y) :- train(X,Y,_).
% liaison3(X,Y) :- train(X,Z,_), liaison3(Z,Y).

% --- WZORZEC transit2 (wypisywanie trasy) ---
% transit2(D,A) :-
%     transit(D,A,L),              % obliczamy listę miast pośrednich
%     (foreach(X, L) do write(X), write(" ")),  % wypisujemy kolejno
%     nl.
% transit2(D,A) :-
%     transit(D,A,L),
%     (foreach(X,L) do write(X), write(" ")), nl.

% --- Arithmetic ---
% X is Expr.
% <, >, =<, >=.

% --- Negation ---
% \+ Goal.


