class Melee extends Summons {
  PImage img;
  Melee(int side, int upgrade, int evolution) {
    img = loadImage("ninja.png");
    if (side == 1) {
      x = 101;
      y = 650;
      team = 1;
      c = color(256 , 0 + (upgrade * 10), 0 + (evolution * 50));
      dx = 5;
    } else {
      x = 1399;
      y = 650;
      team = 2;
      c = color(0 + (upgrade * 10), 256, 0 + (evolution * 50));
      dx = -5;
    }
    attRange = 20;
    health = (50 + (int)(5 * evolution * (upgrade - 1))) + (int)(1.5 * 50 * (evolution - 1));
    att = (.01 + (int)(.0015 * evolution * (upgrade - 1))) + (25 * .01 * (evolution - 1));
    deathGain = (20 + (int)(2 * evolution * (upgrade - 1))) + (int)(1.2 * 20 * (evolution - 1));
    cost = (10 + (int)(2 * evolution * (upgrade - 1))) + (int)(1.1 * 10 *(evolution - 1));
    xpGain = (2 + (int)(1 * evolution * (upgrade - 1))) + (int)(1.2 * 2 * (evolution - 1));
  }

  void draw() {
    fill(c);
    stroke(c);
    image(img, x, y, 30, 30);
  }
}