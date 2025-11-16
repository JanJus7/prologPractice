entree(artichauts_Melanie).
entree(truffes_sous_le_sel).
entree(cresson_oeuf_poche).

viande(grillade_de_boeuf).
viande(poulet_au_tilleul).
viande(chapon_farci).

poisson(bar_aux_algues).
poisson(saumon_oseille).

dessert(sorbet_aux_poires).
dessert(fraises_chantilly).
dessert(melon_surprise).

calories(artichauts_Melanie,150).
calories(cresson_oeuf_poche,202).
calories(truffes_sous_le_sel,212).
calories(grillade_de_boeuf,532).
calories(poulet_au_tilleul,400).
calories(bar_aux_algues,292).
calories(saumon_oseille,350).
calories(chapon_farci,254).
calories(sorbet_aux_poires,223).
calories(fraises_chantilly,289).
calories(melon_surprise,122).

resistance(X) :- viande(X).
resistance(X) :- poisson(X).

repas(X,Y,Z) :- entree(X), resistance(Y), dessert(Z).

platLeger(X) :- calories(X,C), C =< 400, C >= 200.

platPlusQue(X) :- calories(X,C), calories(bar_aux_algues, Y), Y > C.

valeur(E, R, D, C) :- 
    repas(E, R, D),
    calories(E, CE),
    calories(R, CR),
    calories(D, CD),
    C is CE + CR + CD.

repas_equilibre(E, R, D) :-
    valeur(E, R, D, C),
    C < 800.