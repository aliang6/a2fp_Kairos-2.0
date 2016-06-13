class Cavalry extends Summons{
    PImage img;

  Cavalry(int side, int upgrade, int evolution){
    img = loadImage("horse.png");
    if (side == 1){
    x = 101;
    y = 650;
    team = 1;
    c = color(256 , 0 + (upgrade * 10), 0 + (evolution * 50));
    dx = 5;
    }
    else{
      x = 1399;
      y = 650;
      team = 2;
      c = color(0 + (upgrade * 10), 256, 0 + (evolution * 50));
      dx = -5;
    }
    attRange = 32;
    health = (200 + (int)(5 * evolution * (upgrade - 1))) + (int)(1.5 * 200 * (evolution - 1));
    att = (.05 + (int)(.0015 * evolution * (upgrade - 1))) + (25 * .05 * (evolution - 1));
    deathGain = (50 + (int)(2 * evolution * (upgrade - 1))) + (int)(1.2 * 50 * (evolution - 1));
    cost = (25 + (int)(2 * evolution * (upgrade - 1))) + (int)(1.1 * 25 *(evolution - 1));
    xpGain = (5 + (int)(1 * evolution * (upgrade - 1))) + (int)(1.2 * 5 * (evolution - 1));
  }

    void draw(){
    fill(c);
    stroke(c);
    image(img,x,y,60,40);
  }
  
  //void attack(Base other) {
  //  long lastTime = millis();
  //  if (millis() - lastTime > 1000) {
  //    other.setHealth(other.getHealth() - 30);
  //  }
  //}
  
  //void attack(Summons other) {
  //  long lastTime = millis();
  //  if (millis() - lastTime > 1000) {
  //    other.setHealth(other.getHealth() - 30);
  //  }
  //}
}