class Turrent {
     PImage img;

     int cost;
     int ammo;
     int cooldown;
     int x;
     int y;
     int power;
     int c;
     int finalx,finaly;
     
     Turrent(){
           img = loadImage("turret.png");

       cost = 100;
       x=50;
       y=250;
       power = x;
       c = color (206, 206, 206);
       }
       
       
       
    void display() {
      
    fill(c);
    image(img,x, y, 50, 50);
    
      }


}