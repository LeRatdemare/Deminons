class Button {
  String name;
  int buttonSize;
  int x;
  int y;

  color col;
  color colStroke;
  color colCovered;
  
  Button(String nameIn, int posX, int posY, int colIn, int colCoveredIn, int colStrokeIn) {
    name = nameIn;
    x = posX;
    y = posY;
    buttonSize = 100;
    
    col = colIn;
    colStroke = colStrokeIn;
    colCovered = colCoveredIn;
  }//end Button()
  
  boolean covered() {
    return (mouseX>x && mouseX<x+buttonSize && mouseY>y && mouseY<y+buttonSize);
  }//end covered()
  
  void saveGrid() {
    int numeroGrille = getNumGrid()+1;

    for (int j=0; j<grid.nRow; j++) {
      for (int i=0; i<grid.nCol; i++) {
        TableRow newRow = gridCSV.addRow();
        newRow.setInt("numGrid", numeroGrille);
        newRow.setInt("x", i);
        newRow.setInt("y",j);
        newRow.setInt("obstacle?",grid.getValue(i, j));
      }//end for
    }//end for
    
    saveTable(gridCSV, chemin,"csv");
    textSize(20);
    fill(255,0,0);
    text = new Text("Le fichier "+chemin+" a bien été mis à jour.");
  }//end action()
  
  void display() {
    fill(0);
    textSize(25);
    text(name, x-20, y-30, x, y);
    
    if (this.covered()) {
      if (mousePressed) fill(colStroke);
      else fill(colCovered);
    }//end if
    else fill(col);
    
    stroke(0);
    rect(x, y, buttonSize, buttonSize);
  }//end display()
}//end class Button
