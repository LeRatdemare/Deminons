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
  partir de fichiers CSV stockés dans le fichier CSV_GRIDS_PATH.
  */
  GRIDS_FILE = loadTable(CSV_GRIDS_PATH, "header,csv");
}
