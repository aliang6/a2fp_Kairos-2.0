class Projectile{
  int damage,x,y;
  int c;
  String ID;
  int finalx,finaly;
  Boolean used=false;
  int attRange = 5;
  
  
  
  Projectile(int finalxx, int finalyy) {
    damage = 25;
    x = 50;
    y = 250;
    finalx=finalxx;
    finaly=finalyy;
    c = color (206, 206, 206);
    ID = (int)(Math.random()*9999999)+"";
  
  
  
  }
  
  void display() {
    fill(c);
    ellipse(x, y, 10, 10);
    move();
  
  
  
  
  }
  
    boolean isTouching( Object other ) {
    return(abs((other.x - x)) <= attRange);
  }
  
  
  
   void move(){
        if (y+3 >= finaly){
        y=finaly;
        x+=3;
        }
        else{
          y+=3;
          x+=3;
        }
        
      
      }

























}