ArrayList<Melee> meleeList = new ArrayList<Melee>();
ArrayList<Cavalry> cavalryList = new ArrayList<Cavalry>();
ArrayList<Ranger> rangerList = new ArrayList<Ranger>();
int meleeCount,rangerCount,cavalryCount;
Base myBase;
Base enemyBase;
Player myPlayer;
Player enemyPlayer;
int meleeX,meleeY,meleeW,meleeH;
int cavalryX,cavalryY,cavalryW,cavalryH;
int rangerX,rangerY,rangerW,rangerH;

void setup(){
  size(1000,500);
  smooth();
  myBase = new Base(false);
  enemyBase= new Base(true);
  myPlayer = new Player();
  enemyPlayer=new Player();
  meleeCount=0;
  rangerCount=0;
  cavalryCount=0;
  meleeX = 70;
  meleeY = 10;
  meleeW = 40;
  meleeH = 20;
  
  cavalryX = 0;
  cavalryY = 10;
  cavalryW = 40;
  cavalryH = 20;
  
  rangerX = 140;
  rangerY = 10;
  rangerW = 40;
  rangerH = 20;
  
  
  
}


void draw(){
  background(0);



  myBase.display();

  enemyBase.display();
  
  if (overRect(0,0,50,50)==true && mousePressed==true){

    
  }
//-------------------------Draw Spawn Box-----------------------------
  rect(cavalryX, cavalryY, cavalryW, cavalryH);  // Cavalry Box
  text("Cavalry", 0, 10);
  
   rect(meleeX, meleeY, meleeW, meleeH);  // Draw Melee spawn box
   text("Melee", 70, 10);
   
   rect(rangerX, rangerY, rangerW, rangerH);  // Draw ranger spawn box
   text("Ranger", 140, 10);
   
//--------------------------------------------------------------------------

   
  
  



 
  
  

}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
//Checks if mouse over each spawn box---------------------------------------------------
boolean overMelee(){
  return overRect(meleeX,meleeY,meleeW,meleeH);

}

boolean overCavalry(){
  return overRect(cavalryX,cavalryY,cavalryW,cavalryH);

}

boolean overRanger(){
  return overRect(rangerX,rangerY,rangerW,rangerH);

}

//------------------------------------------------------------------------

void mouseClicked(){
   if (overMelee()==true){
     addMelee();
     text(meleeList.size(), 70, 70);
    
    
 

   
   }
   
      if (overRanger()==true){
     addRanger();
     text(rangerList.size(), 70, 70);


   
   }
   
      if (overCavalry()==true){
     addCavalry();

  text(cavalryList.size(), 70, 70);

   
   }
   


}

void addMelee(){
  if(myPlayer.coins >10){
  meleeList.add(new Melee(meleeCount));
  myPlayer.coins-=10;
  meleeCount+=1;  
  }

}

void addRanger(){
  if(myPlayer.coins >10){
  rangerList.add(new Ranger(rangerCount));
  myPlayer.coins-=10;
  rangerCount+=1;  
  }

}

void addCavalry(){
  if(myPlayer.coins >10){
  cavalryList.add(new Cavalry(cavalryCount));
  myPlayer.coins-=10;
  cavalryCount+=1;  
  }

}