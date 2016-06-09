class Base {
  int health;
  float x;
  float y;
  boolean enemy;
   
  Base(boolean isEnemy){
    x=1;
    y=400;
    if (isEnemy == true ){
    enemy=true;
    x=950;
    y=400;
    }
    else{
    enemy=false;
    x=1;
    y=400;
    
    }
  
  
  
  }
  
  void display(){

     rect(x,y,50,100); 
  
  







}
}