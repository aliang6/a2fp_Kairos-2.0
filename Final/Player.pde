class Player {
  int coins;
  boolean haveSpec;
  float x;
  float y;
  int xp;
  
  
  
  
  Player(){
    coins=100;
    haveSpec=true;
    xp=0;
  
  
  
  }
  
  void display(){
    ellipse(x,y,20,20);
  }
  
}
  
  
  