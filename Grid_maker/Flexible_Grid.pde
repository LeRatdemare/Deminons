class Flex_Grid extends ArrayList<ArrayList<Integer>> {
  /*
  Matrice d'entiers de taille flexible, on peut rajouter ou supprimer
  des lignes/colonnes à volonté.
  */
  int nRow, nCol;
  float longueurCase;
  
  Flex_Grid(int rowNum, int colNum, float w) {
    //On appelle d'abord le constructeur de la classe parent
    super();
    
    //On initialise les attributs
    nRow = rowNum;
    nCol = colNum;
    longueurCase = w;
    
    //Puis on remplis la grille de 0 et de 1 au pif
    for (int j=0; j<nRow; j++) {
      ArrayList<Integer> row = new ArrayList<Integer>();
      for (int i=0; i<nCol; i++) {
        if (random(1)<=1) row.add(0);
        else row.add(1);
      }//end for
      this.add(row);
    }//end for
  }//end Flex_Grid()
  
  int getValue(int x, int y) {
    return this.get(y).get(x);
  }//end getValue()
  
  void setValue(int x, int y, int v) {
    ArrayList<Integer> row = this.get(y);
    row.set(x, v);
    this.set(y, row);
  }//end getValue()
  
  void addRowUnder(int y) {
    /*
    Ajoute une ligne en dessous de la ligne y.
    */
    ArrayList<Integer> row = new ArrayList<Integer>();
    for (int i=0; i<this.nCol; i++) {
      row.add(0);
    }//end for
    this.add(y, row);
    
    nRow++;
  }//end addRowUnder()
  
  void addColNextTo(int x) {
    /*
    Ajoute une colonne à gauche de la colonne y.
    */
    for (int i=0; i<this.nRow; i++) {
      ArrayList<Integer> row = this.get(i);
      row.add(x, 0);
      this.set(i, row);
    }//end for
    
    nCol++;
  }//end addColNextTo()
  
  void delRow(int y) {
    /*
    Supprime la ligne y;
    */
    this.remove(y);
    nRow--;
  }//end delRow()
  
  void delCol(int x) {
    /*
    Supprime la colonne x;
    */
    if (x<nRow) {
      for (int i=0; i<nRow; i++) {
        ArrayList<Integer> row = this.get(i);
        row.remove(x);
        this.set(i, row);
      }//end for
      nCol--;
    }//end if
  }//end delCol()
  
  boolean clickOnGrid(float x, float y) {
    return (x>=0 && x<longueurCase*nCol && y>=0 && y<longueurCase*nRow);
  }//end onScreen()
  
  void toggleValue() {
    if (mouseButton==LEFT) {//On vérifie que c'est un click gauche
      if (this.clickOnGrid(mouseX, mouseY)) {//On vérifie que le clique est sur la grille
        int x=mouseX/(int)longueurCase, y=mouseY/(int)longueurCase;
        
        //Puis on inverse la valeur
        if (this.getValue(x, y)==1) this.setValue(x, y, 0);
        else this.setValue(x, y, 1);
      }//end if
    }//end if
  }//end toggleValue()

  void display() {
    /*
    Pour chaque case de la grille, on va afficher un carré
    gris si la case est neutre ou rouge si c'est un obstacle.
    */
    for (int j=0; j<nRow; j++) {
      for (int i=0; i<nCol; i++) {
        //On met en surbrillance la ligne/colonne sélectionnée
        if (colMode && (int)(mouseX/longueurCase)==i) stroke(200, 0, 0); 
        else if (!colMode && (int)(mouseY/longueurCase)==j) stroke(200, 0, 0);
        else stroke(200);
        
        //On choisi la couleur selon la case
        if (this.getValue(i, j)==0) fill(255);
        else fill(0, 200, 200);
        
        //Puis on affiche
        rect(i*longueurCase+0.05, j*longueurCase+0.05, longueurCase-0.1, longueurCase-0.1);
      }//end for
    }//end for
  }//end display()
}//end class Flex_Grid
