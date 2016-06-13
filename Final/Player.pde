class Player {
  int gold;
  boolean haveSpec;
  float x;
  float y;
  int xp;
  
  Player(){
    gold=2000;
    haveSpec=true;
    xp=0;
  }
  
  void display(){
    ellipse(x,y,40,20);
  }
  
}