class Square {
  /*
  Un Square possède une nature :
    -Obstacle(on ne peut pas marcher dessus) ou pas
    -Bombe
    -Information
    -Trou
  Il a également un état(Seules les infos peuvent être révélées car
  les bombes ainsi que les informations 0=neutres deviennent
  immédiatement des trous une fois révélées) :
    -Révélé
    -Caché
    -Trafiqué(Effet manigance qui fausse les valeurs affichées)
  Enfin, il possède également d'autres attributs comme la Grid auquel
  il appartient, ses coordonnées dans la Grid, son temps de vie etc...
  */
  
  int x, y; //Les coordonnées du Square dans la grille en question
  int nature;//0=vide, 1-8=info, 9=bomb, 10=trou, 11=obstacle
  
  Square(int xin, int yin, int naturein) {
    x = xin;
    y = yin;
    nature = naturein;
  }//end Square()
  
  boolean inGrid(Grid g) {
    
  }//end inGrid()
  
  void display() {
  }//end display()
}//end class Square
