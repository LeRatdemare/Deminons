/*
Fonction de Processing appelée en boucle automatiquement
par le programme. C'est le coeur de l'exécution.
*/
void draw() {
  for (int j=0;j<grid.nRow; j++) {
    for (int i=0; i<grid.nCol; i++) {
      grid.grid[j][i].display();
    }//end for
  }//end for
}
