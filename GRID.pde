class Grid {
  /*
  Dans une partie de deminons, le terrain est composé d'un certain nombre de
  grilles inter-dépendantes.
  Chaque grille est constituée entièrement de Square possèdera son propre
  système de coordonnées.
  D'autre part, il ne sera possible pour un joueur de passer d'une grille
  à l'autre qu'en passant par un trou.
  Ainsi, les effets ne se propagent pas d'une grille à l'autre.
  */
  Square[][] grid; //La grille en soit
  ArrayList<Square> bombs; //La liste des coordonnées des bombes actuellement dans la grille
  
  int posX, posY; //Coordonnées de l'angle haut gauche de la grille dans la fenêtre
  int nRow, nCol; //Nombre de lignes et de colonnes de la grille
  
  float squareWidth; //Largeur des Square de la grille
  
  PImage bg; //Background de la grille
  
  Grid(int xin, int yin, Table gridCSV, int numGrid, int initBombProportion, PImage background) {
    /*
    Constructeur qui permet de créer une grille à partir d'informations
    stockées dans un fichier CSV. Les Square doivent impérativement avoir
    été stockés suivant un parcours for(lignes) {for (colonnes) {}}
    Il doit donc être de la forme(si un autre entier que 0 ou 11 se trouve
    dans la colonne "obstacle?" on place un obstacle) :
    numGrid, x, y, obstacle?
    0, 0, 0, 0
    0, 0, 1, 11
    0, 0, 2, 11
    0, 1, 0, 11
    0, 1, 1, 0
    0, 1, 2, 0
    */
    
    //On initialise d'abord les attributs de l'instance
    posX = xin;
    posY = yin;
    bg = background;
    bombs = new ArrayList<Square>();
    
    //On prépare des variables temporaires
    int x, y, nature;
    ArrayList<Square> squares = new ArrayList<Square>();
    
    
    //On commence par récupérer les données correspondant à la grille voulue.
    int i=0;
    TableRow firstRow;
    ArrayList<TableRow> searchedGrid = new ArrayList<TableRow>();
    //Récupération de la première ligne(elle doit nécessairement exister et contenir au moins 2 lignes en plus du header)
    do {
      firstRow = gridCSV.getRow(i);
      i++;
    } while (i<gridCSV.getRowCount() && firstRow.getInt("numGrid")!=numGrid);
    
    //On récupère les TableRow dont on a besoin dans searchedgrid
    searchedGrid.add(firstRow);
    while (i<gridCSV.getRowCount() && gridCSV.getRow(i).getInt("numGrid")==numGrid) {
      searchedGrid.add(gridCSV.getRow(i));
      i++;
      println("Grid.Constructeur -> Row"+i+" : ");
      gridCSV.getRow(i).print();
    }
    
    //On récupère maintenant l'ensemble des squares dans un ArrayList
    for (TableRow row : searchedGrid) {
      x = row.getInt("x");
      y = row.getInt("y");
      nature = (row.getInt("obstacle?")==0) ? 0 : 11;//Si la valeur est un 0 on laisse 0, sinon quoi que ce soit on met 11
      squares.add(new Square(x, y, nature));
    }//end for
    //Puis une fois qu'on a tout sorti, on connais maintenant les dimensions de la grille.
    nRow = squares.get(squares.size()-1).y;
    nCol = squares.get(squares.size()-1).x;
    grid = new Square[nRow][nCol];
    
    
    //On peut donc la remplir
    for (Square square : squares) {
      if (square.nature == 0) {//Si la case n'est pas un obstacle
        if (random(100)<initBombProportion) {//Si on doit donc y placer une bombe
          square.nature = 9;
          bombs.add(square);//On pense à la rajouter dans bombs
        }//end if
      }//end if
      else grid[square.y][square.x] = square;
    }//end for
    
    //Puis rajouter les informations
    updateInfos();
  }//end Grid()
  
  
  Grid(int xin, int yin, int rows, int cols, int initBombProportion, PImage background) {
    /*
    Constructeur qui permet de créer une grille aléatoire.
    */
    
    //Initialisation des attributs de l'instance
    posX = xin;
    posY = yin;
    nRow = rows;
    nCol = cols;
    bg = background;
    
    //On commence par initialiser grid et y poser aléatoirement des bombes
    grid = new Square[nRow][nCol];
    bombs = new ArrayList<Square>();
    Square square;//On crée une variable temporaire qui nous servira pour les parcours
    
    for (int j=0; j<nRow; j++) {//Parcours en lignes
      for (int i=0; i<nCol; i++) {//Parcours en colonnes
        if (random(100)<initBombProportion) {//On place une certaine proportion de bombes
          square = new Square(i, j, 9);
          grid[j][i] = square;
          bombs.add(square);
        }//end if
        else {//Si ce n'est pas une bombe, on place initialement des cases vides partout
          grid[j][i] = new Square(i, j, 0);
        }//end else
      }//end for
    }//end for
    
    //Dans un second temps, on parcours à nouveau la grille pour placer les informations
    updateInfos();
  }//end Grid()
  
  int numBombsAround(Square square) {
    /*
    Renvoie le nombre de bombes autour du Square donné.
    Passe aussi sur le Square en question, il ne faut donc
    pas appeler la méthode sur une bombe au risque de fausser
    le résultat.
    */
    int count = 0;//Le compteur de bombes
    for (int j=square.y-1; j<square.y+1; j++) {//Parcours en lignes
      if (j>=0 && j<nRow) {//On s'assure d'être toujours sur la grille
        for (int i=square.x-1; i<square.x+1; i++) {//Parcours en colonnes
          if (i>=0 && i<nCol && grid[j][i].nature==9) {//On s'assure d'être toujours sur la grille, puis on regarde si la case est une bombe
            count++;
          }//end if
        }//end for
      }//end if
    }//end for
    return count;
  }//end numBombsAround()
  
  void updateInfos() {
    /*
    Met à jour toutes les cases informations sur la grille
    en recalculant le nombre de bombes voisines de chacune.
    */
    for (int j=0; j<nRow; j++) {
      for (int i=0; i<nCol; i++) {
        println("Grid.updateInfos() -> i="+i+", j="+j);
        Square square = grid[j][i];
        //Si le Square est une case vide, on change sa nature en fonction du nombre de bombes autour de lui
        if (square.nature==0) square.nature = this.numBombsAround(square);
      }//end for
    }//end for
  }//end updateInfos()
  
  void display() {
    /*
    On va simplement afficher chaque square de la grille, le vrai travaille
    se trouve dans la méthode display() de la classe Square.
    */
    for (Square[] squares : grid) {
      for (Square square : squares) {
        square.display();
      }//end for
    }//end for
  }//end display()
  
}//end class Grid
