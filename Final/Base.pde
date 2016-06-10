class Base extends Object{

  Base(int side) {
    if (side != 1) {
      health = 1000;
      team = 2;
      x=1400;
      y=300;
      c = color (256, 256, 256);
    } 
    
    else {
      health = 1000;
      team = 1;
      x=0;
      y=300;
      c= color(256, 256, 256);
    }
  }
  
  void display() {
    fill(c);
    rect(x, y, 100, 400);
  }
}