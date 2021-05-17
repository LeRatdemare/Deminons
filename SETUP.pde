/*
Fonction de Processing appelée automatiquement au
début du programme(juste après settings).
C'est l'initialisation du jeu.
*/
void setup() {
  /*
  Initialisation des variables globales et lancement
  du jeu.
  */
  loadGrids();
}

void loadGrids() {
  /*
  Fonction servant à charger toutes les grilles prédéfinies à
  partir de fichiers CSV stockés dans le dossier grids. Chaque
  grille doit s'appeler "grid0.csv", "grid1.csv", etc...
  */
  for (int i=0; i<GRID_FILES.length; i++) {
    GRID_FILES[i] = loadTable("grids/grid"+i+".csv", "header"); //On charge chaque grille
  }//end for
}
