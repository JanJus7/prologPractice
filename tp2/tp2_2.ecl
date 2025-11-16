est_carte(Carte(H,C)) :- est_hauteur(H), est_couleur(C).

est_hauteur(sept).
est_hauteur(huit).
est_hauteur(neuf).
est_hauteur(dix).
est_hauteur(valet).
est_hauteur(dame).
est_hauteur(roi).
est_hauteur(as).

est_couleur(trefle).
est_couleur(carreau).
est_couleur(coeur).
est_couleur(pique).

est_main(main(C1,C2,C3,C4,C5)) :-
    est_carte(C1),
    est_carte(C2), C1\=C2,
    est_carte(C3), C1\=C3, C2\=C3,
    est_carte(C4), C1\=C4, C2\=C4, C3\=C4,
    est_carte(C5), C1\=C5, C2\=C5, C3\=C5, C4\=C5.

hauteur_carte_num(carte(sept,_),7).
hauteur_carte_num(carte(huit,_),8).
hauteur_carte_num(carte(neuf,_),9).
hauteur_carte_num(carte(dix,_),10).
hauteur_carte_num(carte(valet,_),11).
hauteur_carte_num(carte(dame,_),12).
hauteur_carte_num(carte(roi,_),13).
hauteur_carte_num(carte(as,_),14).

couleur_carte_num(carte(_,trefle),1).
couleur_carte_num(carte(_,carreau),2).
couleur_carte_num(carte(_,coeur),3).
couleur_carte_num(carte(_,pique),4).

est_main2(main(C1,C2,C3,C4,C5)) :-
    est_carte(C1),
    est_carte(C2), inf_carte(C1,C2),
    est_carte(C3), inf_carte(C2,C3),
    est_carte(C4), inf_carte(C3,C4),
    est_carte(C4), inf_carte(C4,C5).