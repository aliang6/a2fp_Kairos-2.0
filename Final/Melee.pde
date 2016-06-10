class Melee extends Summons {
  
  Melee(int side) {
    if (side == 1) {
      x = 101;
      y = 650;
      team = 1;
      c = color(256, 0, 0);
      dx = 5;
      health = 50;
      attRange = 20;
    } else {
      x = 1399;
      y = 650;
      team = 2;
      c = color(0, 256, 0);
      dx = -5;
      attRange = 120;
    }
    rad = 10;
    state = MOVING;
  }

  void draw() {
    fill(c);
    stroke(c);
    ellipse(x, y, 30, 30);
  }

  void attack(Base other) {
      long lastTime = millis();
      while(millis() - lastTime >= 1000){
        other.health -= 30;
        lastTime=millis();
      };
      //lastTime = millis();
    }
//  }
  
  //void attack(Summons other) {
  //  if (millis() - lastTime > 1000) {
  //    other.setHealth(other.getHealth() - 30);
  //    lastTime = millis();
  //  }
  //}
}