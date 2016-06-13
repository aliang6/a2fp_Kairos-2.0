class Base extends Object{

  Base(int side) {
    if (side != 1) {
      team = 2;
      x=1400;
      y=300;
    }   
    else {
      team = 1;
      x=0;
      y=300;
    }
    health = 1000;
    c = color (256, 256, 256);
  }
  
  void display() {
    fill(c);
    rect(x, y, 100, 400);
  }
}