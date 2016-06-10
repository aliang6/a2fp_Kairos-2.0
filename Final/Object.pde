class Object{
  int health;
  float x;
  float y;
  int team;
  color c;
  
  //----------------Acessors-----------------------
  int getHealth(){
    return health;
  }
  
  float getXCor(){
    return x;
  }
  
  int getTeam(){
    return team;
  }
  
  //------------------------------------------------
  
  
  //------------------Modifiers---------------------
  void setHealth(int hp){
    health = hp;
  }
  //------------------------------------------------
}