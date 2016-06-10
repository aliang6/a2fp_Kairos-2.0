class Ranger extends Summons{
  
  Ranger(int side){
    if (side == 1){
    x = 101;
    y = 640;
    team = 1;
    c = color(256,0,0);
    dx = 1;
    health = 40;
    }
    else{
      x = 1399;
      y = 640;
      team = 2;
      c = color(0,256,0);
      dx = -1;
    }
    rad = 10;
    state = MOVING;
  }

    void draw(){
    fill(c);
    stroke(c);
    ellipse(x,y,20,40);
  }
  
  void attack(Base other) {
    long lastTime = millis();
    if (millis() - lastTime > 1000) {
      other.setHealth(other.getHealth() - 30);
    }
  }
  void attack(Summons other) {
    long lastTime = millis();
    if (millis() - lastTime > 1000) {
      other.setHealth(other.getHealth() - 30);
    }
  }
}