///////////////////////Variables/////////////////////////
int numGrid;
int nRow, nCol;
Flex_Grid grid;

int nrow=20, ncol=20;

int exCaseX, exCaseY;

boolean colMode=true;

Button saveButton;
String chemin;
Table gridCSV;
Text text;

///////////////////////Functions/////////////////////////
void settings() {
  size((int) (displayWidth*0.95), (int) (displayHeight*0.9));
}

void setup() {
  chemin = "../grids/gridCSV";
  gridCSV = loadTable(chemin, "header,csv");
  grid = new Flex_Grid(nrow, ncol, (height-50)/nrow);
  saveButton = new Button("Sauvegarder", width-200, 50, color(150), color(230), color(0, 255, 0));
  text = new Text("");
}//end setup()

void draw() {
  background(200);
  
  text.grow();
  
  grid.display();
  saveButton.display();
  text.display();
}//end draw()

void mouseDragged() {
  /*
  On peut inverser la valeur d'une série de case
   en glissant notre souris dessus.
   */

  //On vérifie que la case sur laquelle se trouve la souris est différente de la
  //dernière case à avoir été inversée avant de l'inverser à nouveau.
  if (mouseX/(int)grid.longueurCase != exCaseX || mouseY/(int)grid.longueurCase != exCaseY) {
    grid.toggleValue();
    exCaseX = mouseX/(int)grid.longueurCase;
    exCaseY = mouseY/(int)grid.longueurCase;
  }//end if
}//end mouseDragged()

void mouseReleased() {
  /*
  Si clique droit on passe en mode sélection colonne/ligne.
   Si clique gauche on inverse la valeur de la case.
   */
  if (mouseButton==RIGHT) colMode = !colMode;
  else if (mouseButton==LEFT) {
    if (saveButton.covered()) saveButton.saveGrid();
    else grid.toggleValue();
  }//end else if
}//end mousePressed()

void keyPressed() {
  /*
  Si on appuie sur - on supprime la colonne/ligne sur laquelle
    se trouve le curseur.
  Si on appuie sur + on en rajoute une à droite/bas de celle-ci.
   
  On peut sauvegarder la grille en appuyant sur 's'
  */ 
  if (key=='+') {
    if (colMode && grid.nCol*grid.longueurCase<width-400) grid.addColNextTo(mouseX/(int)grid.longueurCase);
    else grid.addRowUnder(mouseY/(int)grid.longueurCase);
  }//end if
  else if (key=='-') {
    if (colMode && grid.nCol*grid.longueurCase>0) grid.delCol(mouseX/(int)grid.longueurCase);
    else if (!colMode && grid.nCol*grid.longueurCase<width-400) grid.delRow(mouseY/(int)grid.longueurCase);
  }//end else if
  
  grid.longueurCase = (height-50)/grid.nRow;
}//end keyPressed()
