int getNumGrid() {
  TableRow row;
  
  if (gridCSV.getRowCount()>1) row = gridCSV.getRow(gridCSV.getRowCount()-1);
  else return -1;
  
  return row.getInt("numGrid");
}//end getNumGrid()

void listerFichiers() {
  File[] files = listFiles(chemin);
  for (File file : files) {
    println(file.getName());
  }//end for
}//end listerFichiers()

// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  println("Name : "+file.getName());
  println("Parent : "+file.getParent());
  println("Exists : "+file.exists());
  println("isDirectory : "+file.isDirectory());
  print("List : ");
  printArray(file.list());
    
  if (file.isDirectory()) {
    println("C'est bien un dossier !");
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}

boolean in(String ch, String[] arrStr) {
  for (String chaine : arrStr) {
    if (ch.equals(chaine)) return true;
  }//end for
  return false;
}//end in
