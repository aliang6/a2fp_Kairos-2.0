class Projectile{
   PImage img;
  int damage,x,y;
  int c;
  String ID;
  int finalx,finaly;
  Boolean used=false;
  int attRange = 5;
  Summons enemy;
  
  
  
  Projectile(Summons ene) {
    damage = 25;
    x = 50;
    y = 250;
    enemy=ene;
    finalx=(int)enemy.x;
    finaly=(int)enemy.y;
    c = color (206, 206, 206);
    ID = (int)(Math.random()*9999999)+"";
      img = loadImage("missle.png");

  
  
  }
  
  void display() {
    fill(c);
    image(img,x, y, 10, 10);
    move();
  
  
  
  
  }
  
    boolean isTouching( Object other ) {
    return (abs((other.x - x)) <= attRange) && (abs((other.y - y)) <= attRange);
  }
  
  
  
   void move(){
         finalx=(int)enemy.x;
         finaly=(int)enemy.y;
         x+=3;
         y+=1;
         
         if (x>=finalx){
           x=finalx;
           y+=3;
         
         }
        
        
        
      
      }

























}