package algoAStar;
//Algo A* simple pour voyageur de commerce

import java.util.ArrayList;

public class Main {
	static int nbVilles;
	static int vDepart;
	static int graphe[][]; 
	static int valMaxHeuristique;
	static int tabDistCroissantes[];
	static ArrayList<ArrayList<Integer>> possibles;
			    
		public static int afficherChemin(ArrayList<Integer> l) {
			for(int i=0;i<l.size()-1;i++) 
				System.out.print(l.get(i)+" -> ");
			System.out.print(l.get(l.size()-1));
			return l.size()-1;
		}          

		public static boolean cheminTerminal(ArrayList<Integer> l) {
			   boolean b = true; 
			   b = (nbVilles+1 == l.size())&&(0==l.get(0))&&(0==l.get(nbVilles));
			   for(int i=1;i<nbVilles;i++)
				   b = b && l.contains(i);
		       return b;
		}          
		
		 public static int fChemin(ArrayList<Integer> l, int numH) {
			 return (gChemin(l)+h(l,numH));
		   }

		public static int gChemin(ArrayList<Integer> l) {
			int vg = 0;
			for(int i=0;i<l.size()-1;i++)
				vg = vg + graphe[l.get(i)][l.get(i+1)];
			return vg;
		   }
		
		public static int initHeuristique(int numH) {
			int max = 0;
			for(int i=0; i<nbVilles; i++)
				  for(int j=0; j<nbVilles; j++) 
					  if (graphe[i][j] > max) max = graphe[i][j];
		    return max*nbVilles;
		}          
		
		// Fonction heuristique h au choix...
		   public static int h(ArrayList<Integer> l, int numH) {
			   switch (numH) {
			   	case 1: return h1(l);  
			   	// case 2: return h2(l);   // ajouter ici autres heuristiques...
			   	default : return 0;   // recherche aveugle  
			   }
		   }

		   public static int h1(ArrayList<Integer> l) {
			   // somme des m plus petites distances non encore parcourues
			   int m = nbVilles + 1 - l.size();
			   int som = 0, j;
			   ArrayList<Integer> v_arcs = new ArrayList<Integer>();
			   for(j=0;j<tabDistCroissantes.length;j++)
					v_arcs.add(tabDistCroissantes[j]);
			   for(j=0;j<l.size()-1;j++) {
				   int v = graphe[l.get(j)][l.get(j+1)];
				   int k = v_arcs.indexOf(v);
			       if ((v != 0) && (k != -1))
			    	   v_arcs.remove(k);
			   }
			   for(j=0;j<m;j++) 
				   som = som + v_arcs.get(j);
			   return som;
		   }
           
           public static int h2(ArrayList<Integer> l) {
               int m = nbVilles + 1 - l.size();
               int som = 0, j;
               for (j = 0; j < m; j++) {
                 som = som + tabDistCroissantes[j];
               }
               return  som;
           }
           
           public static int h3
		   
		   public static boolean applicableReboucler(ArrayList<Integer> l, int ext) {
			    boolean b = (nbVilles == l.size()) && (0==l.get(0));
		 	   	for(int i=1;i<nbVilles;i++)
		 	   		b = b && l.contains(i); 
		 	   	b = b && (graphe[ext][0] != 0);
		 	   	return b;
		   }
		   
		   public static boolean applicableAvancer(ArrayList<Integer> l, int ext, int vj) {
				boolean b = (l.size() < nbVilles) && (0==l.get(0));
			 	b = b && (!l.contains(vj)); 
			 	b = b && (graphe[ext][vj] != 0);
			 	return b;
			   }
		   
	    public static void ajouter_un_voisin(int vj, ArrayList<Integer> chem, int ext) {
	    	ArrayList<Integer> chem2 = new ArrayList<Integer>();
	        chem2.addAll(chem);
	        chem2.add(vj);
	        afficherChemin(chem2);
	        int vg = gChemin(chem2);
            int vh = h(chem2,2);
            int vf = fChemin(chem2,2);
            System.out.println(" -> ajout avec f = g + h -> "+vf+" = "+vg+" + "+vh);
        	possibles.add(chem2);
         }

	    public static void ajouter_voisins(ArrayList<Integer> chem) {
	    	int ext = chem.get(chem.size()-1);
	    	if (applicableReboucler(chem,ext)) 
	    		ajouter_un_voisin(0,chem,ext);
	    	for(int vj=1;vj<nbVilles;vj++)
	    		if (applicableAvancer(chem,ext,vj)) 
		    		ajouter_un_voisin(vj,chem,ext);
	     }

	    public static int index_meilleur_chemin(ArrayList<ArrayList<Integer>> poss, int numH) {
	        ArrayList<Integer> chem;
	        int meilleur_cout=valMaxHeuristique;
	        int val, m=0;
	        for(int i=0; i<poss.size(); i++){
	                chem = poss.get(i);
	                val = fChemin(chem,numH);
	                if (val < meilleur_cout)
	                {
	                    meilleur_cout = val;
	                    m = i;
	                }
	        }
	        return m;
	    }

	    public static void algoAStar(ArrayList<Integer> e, int numH) {
	        int val,i=0,cpt=0;
	        ArrayList<Integer> l = new ArrayList<Integer>();
	    	possibles = new ArrayList<ArrayList<Integer>>();
	    	l.addAll(e);
	    	possibles.add(l);
	    	if (!cheminTerminal(l)) 
	        do {
	        	l = possibles.remove(i);
	            System.out.print("meilleur chemin : ");
	            afficherChemin(l);
	            int vg = gChemin(l);
	            int vh = h(l,numH);
	        	val = fChemin(l,numH);
	            System.out.println(" avec f = g + h -> "+val+" = "+vg+" + "+vh);
	            System.out.println("debut ajouter voisins");
	            ajouter_voisins(l);
	            System.out.println("fin ajouter voisins");
	            System.out.println("possibles = "+possibles);
	            i = index_meilleur_chemin(possibles,numH);
	        	cpt++;
	        } while ((!possibles.isEmpty()) && (!cheminTerminal(possibles.get(i))));
	    	else System.out.println("L'�tat initial est d�j� terminal ! ");
	    	
	        if (!possibles.isEmpty())
	             {
	               System.out.println();
	               l = possibles.get(i);
	               int cout_reel = gChemin(l);
	               System.out.println("Meilleur chemin trouv� : ");
	               int cpt2 = afficherChemin(l);
	               System.out.println();
	               System.out.println("Cout reel = "+cout_reel+", cout en nb de mouvements = "+cpt2);
	               System.out.println("Solution trouv�e par l'algo A* en "+cpt+" it�rations.");
	               }
	        else System.out.println("Pas de solution trouv�e par l'algo A* en "+cpt+" it�rations.");
	        possibles.clear();
	    }

	    
	    public static void initPb(int numH) {
	    nbVilles = 5;
	    vDepart = 0;
	    graphe = new int[nbVilles][nbVilles];
	    int graphe2[][] = {{0,6,9,16,0}, {6,0,7,0,8}, {9,7,0,6,10}, {16,0,6,0,4}, {0,8,10,4,0}};  
	    for(int i=0; i<nbVilles; i++)
			  for(int j=0; j<nbVilles; j++) 
				  graphe[i][j] = graphe2[i][j];
	    tabDistCroissantes = new int[nbVilles*nbVilles];
	    int tabDistCroissantes2[] = {4,6,6,7,8,9,10,16};
	    for(int i=0; i<tabDistCroissantes2.length; i++)
	    	tabDistCroissantes[i] = tabDistCroissantes2[i];
	    valMaxHeuristique = initHeuristique(numH);
	    }
	    
    public static void main(String[] args) {
    	ArrayList<Integer> eInit = new ArrayList<Integer>();
    	eInit.add(0);
    	int numH = 1;  
    	initPb(numH);
    	algoAStar(eInit,numH);  
    }
}
