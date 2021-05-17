class Text {
  String msg;
  int birth;
  
  Text(String m) {
    msg = m;
    birth = millis();
  }//end Text()
  
  void grow() {
    if (millis()-birth>3000) text = new Text("");
  }//end grow()
  
  void display() {
    textSize(20);
    fill(255,0,0);
    text(msg,width-500, height-50);
  }//end display()
}//end class Text()
