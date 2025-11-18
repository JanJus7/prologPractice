:- lib(fd).     % biblioteka zmiennych całkowitoliczbowych z dziedzinami skończonymi
:- import all_different/1 from fd_global.  

send_more_money(Vars) :-
    % 1. Zmienne
    Vars = [S,E,N,D,M,O,R,Y],

    % 2. Dziedziny: cyfry 0..9
    Vars :: 0..9,

    % 3. Wszystkie różne
    all_different(Vars),

    % 4. Pierwsze litery nie mogą być zerem
    S #\= 0,
    M #\= 0,

    % 5. Równanie SEND + MORE = MONEY
    1000*S + 100*E + 10*N + D
      + 1000*M + 100*O + 10*R + E
    #= 10000*M + 1000*O + 100*N + 10*E + Y,

    % 6. Szukanie wartości (labeling)
    labeling(Vars),

    % 7. Wypisanie wyniku
    printf("S=%d E=%d N=%d D=%d M=%d O=%d R=%d Y=%d%n",
           [S,E,N,D,M,O,R,Y]).
