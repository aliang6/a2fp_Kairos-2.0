class Ranger extends Summons{
    PImage img;

  Ranger(int side, int upgrade, int evolution){
    img = loadImage("archer.png");
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
    attRange = 100 * evolution;
    health = (40 + (int)(5 * evolution * (upgrade - 1))) + (int)(1.5 * 40 * (evolution - 1));
    att = (.005 + (int)(.0015 * evolution * (upgrade - 1))) + (25 * .005 * (evolution - 1));
    deathGain = (20 + (int)(2 * evolution * (upgrade - 1))) + (int)(1.2 * 20 * (evolution - 1));
    cost = (10 + (int)(2 * evolution * (upgrade - 1))) + (int)(1.1 * 10 *(evolution - 1));
    xpGain = (2 + (int)(1 * evolution * (upgrade - 1))) + (int)(1.2 * 2 * (evolution - 1));
  }

    void draw(){
    fill(c);
    stroke(c);
    image(img,x,y,20,40);
  }
}