:- lib(fd).

enigme(Vars) :- Vars = [C1, C2, C3, C4, C5, C6],
                Vars :: 0..9,
                C1 #= C6, C1*2 #= (C2*10+C3), C6*3 #= (C4*10+C5), C2*C4 < 3, C4 #= 2*_,
