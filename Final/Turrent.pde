class Turrent {
  
     int cost;
     int ammo;
     int cooldown;
     int x;
     int y;
     int power;
     int c;
     int finalx,finaly;
     
     Turrent(){
       cost = 100;
       ammo = 5;
       x=50;
       y=250;
       power = x;
       c = color (206, 206, 206);
       }
       
       
       
    void display() {
      
    fill(c);
    rect(x, y, 50, 50);
    
      }
      
    








}