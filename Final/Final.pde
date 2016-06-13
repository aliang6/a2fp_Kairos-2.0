//================Player===========================
ArrayList<Melee> meleeList = new ArrayList<Melee>();
ArrayList<Cavalry> cavalryList = new ArrayList<Cavalry>();
ArrayList<Ranger> rangerList = new ArrayList<Ranger>();
ArrayList<Summons> summonsList = new ArrayList<Summons>();
ArrayList<Projectile> projectileList = new ArrayList<Projectile>();
int meleeCount, rangerCount, cavalryCount;
//=================Enemy============================
ArrayList<Melee> meleeEList = new ArrayList<Melee>();
ArrayList<Cavalry> cavalryEList = new ArrayList<Cavalry>();
ArrayList<Ranger> rangerEList = new ArrayList<Ranger>();
ArrayList<Summons> enemyList = new ArrayList<Summons>();
int meleeECount, rangerECount, cavalryECount;
Turrent myTurrent;

Base myBase;
Base enemyBase;
Player myPlayer;
Player enemyPlayer;
int meleeX, meleeY, meleeW, meleeH;
int cavalryX, cavalryY, cavalryW, cavalryH;
int rangerX, rangerY, rangerW, rangerH;
int meleeEX, meleeEY, meleeEW, meleeEH;
int cavalryEX, cavalryEY, cavalryEW, cavalryEH;
int rangerEX, rangerEY, rangerEW, rangerEH;
int meleeUpgrade, rangerUpgrade, cavalryUpgrade, evolution;
int meleeEUpgrade, rangerEUpgrade, cavalryEUpgrade, evolutionE;
int meleeCost, rangerCost, cavalryCost, evolutionCost;
int meleeECost, rangerECost, cavalryECost, evolutionECost;
int meleeUpCost, rangerUpCost, cavalryUpCost;
int meleeEUpCost, rangerEUpCost, cavalryEUpCost;

void setup() {
  size(1500, 700);
  smooth();
  myTurrent = new Turrent();
  myBase = new Base(1);
  enemyBase= new Base(2);
  myPlayer = new Player();
  enemyPlayer=new Player();
  meleeCount=0;
  rangerCount=0;
  cavalryCount=0;
  //Player Button Coordinates
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
  
  meleeUpgrade = 1;
  rangerUpgrade = 1;
  cavalryUpgrade = 1;
  evolution = 1;
  
  meleeEUpgrade = 1;
  rangerEUpgrade = 1;
  cavalryEUpgrade = 1;
  evolutionE = 1;
  
  meleeCost = 10;
  cavalryCost = 25;
  rangerCost = 10;
  evolutionCost = 500;
  
  meleeECost = 10;
  cavalryECost = 25;
  rangerECost = 10;
  evolutionECost = 500;
  
  meleeUpCost = 50;
  cavalryUpCost = 100;
  rangerUpCost = 40;
  
  meleeEUpCost = 50;
  cavalryEUpCost = 100;
  rangerEUpCost = 40;
  
  // Enemy Button Coordinates
  meleeEX = 1380;
  cavalryEX = 1310;
  rangerEX = 1450;
}


void turrentAttack(){
  
  
  for (int i = 0 ; i < projectileList.size() ; i++){
    projectileList.get(i).display(); 
    for (int y = 0 ; y < enemyList.size();y++){
      if ((projectileList.get(y)).isTouching(enemyList.get(y))){
      projectileList.remove(i);
      (enemyList.get(y)).health=(enemyList.get(y)).health-10;
    }    
    }
    
  }
    


}


void draw() {
  background(0);
  fill(256, 256, 256);
  rect(0, 670, 1500, 50);

  myBase.display();

  enemyBase.display();
  myTurrent.display();
  if ((myTurrent.ammo>0 || projectileList.size()>0) && enemyList.size() >0 ){
    if (myTurrent.ammo>0){
      projectileList.add(new Projectile( (int)(enemyList.get((int)(Math.random()*enemyList.size()))).x, (int)(enemyList.get((int)(Math.random()*enemyList.size()))).y));
      myTurrent.ammo-=1;    
    }
    
    if (projectileList.size()>0){
    turrentAttack();
    }
    
  }
  
  if (overRect(0, 0, 50, 50)==true && mousePressed==true) {
  }
  //-------------------------Draw Spawn Box-----------------------------
  textSize(12);
  fill(256, 256, 256);
  rect(cavalryX, cavalryY, cavalryW, cavalryH);  // Cavalry Box
  text("Cavalry", 0, 10);
  text(cavalryList.size(), 0, 70);

  rect(meleeX, meleeY, meleeW, meleeH);  // Draw Melee spawn box
  text("Melee", 70, 10);
  text(meleeList.size(), 70, 70);

  rect(rangerX, rangerY, rangerW, rangerH);  // Draw ranger spawn box
  text("Ranger", 140, 10);
  text(rangerList.size(), 140, 70);

  rect(cavalryEX, cavalryY, cavalryW, cavalryH);  // Cavalry Box
  text("Cavalry", 1310, 10);
  text(cavalryEList.size(), 1310, 70);

  rect(meleeEX, meleeY, meleeW, meleeH);  // Draw Melee spawn box
  text("Melee", 1380, 10);
  text(meleeEList.size(), 1380, 70);

  rect(rangerEX, rangerY, rangerW, rangerH);  // Draw ranger spawn box
  text("Ranger", 1450, 10);
  text(rangerEList.size(), 1450, 70);

  text("Player Gold:", 0, 150);
  text(myPlayer.gold, 90, 150);

  text("Player XP", 0, 175);
  text(myPlayer.xp, 120, 175);

  text("Enemy Gold:", 0, 200);
  text(enemyPlayer.gold, 90, 200);

  text("Enemy Experience:", 0, 225);
  text(enemyPlayer.xp, 120, 225);

  fill(256, 0, 0);
  textSize(25);
  text(myBase.health, 20, 500);
  text(enemyBase.health, 1420, 500);

  //--------------------------------------------------------------------------
  
  //==========================Upgrade Boxes===================================
  textSize(12);
  fill(256, 256, 256);
  rect(210, 10, 40, 20);
  text("Cavalry Upgrade", 210, 10);
  text(cavalryUpgrade - 1, 210, 70);
  
  rect(310, 10, 40, 20);
  text("Melee Upgrade", 310, 10);
  text(meleeUpgrade - 1, 310, 70);
  
  rect(410, 10, 40, 20);
  text("Ranger Upgrade", 410, 10);
  text(rangerUpgrade - 1, 410, 70);
  
  rect(510, 10, 40, 20);
  text("Evolution Upgrade", 510, 10);
  text(evolution - 1, 510, 70);
  
  rect(900, 10, 40, 20);
  text("Cavalry Upgrade", 900, 10);
  text(cavalryEUpgrade - 1, 900, 70);
  
  rect(1000, 10, 40, 20);
  text("Melee Upgrade", 1000, 10);
  text(meleeEUpgrade - 1, 1000, 70);
  
  rect(1100, 10, 40, 20);
  text("Ranger Upgrade", 1100, 10);
  text(rangerEUpgrade - 1, 1100, 70);
  
  rect(1200, 10, 40, 20);
  text("Evolution Upgrade", 1200, 10);
  text(evolutionE - 1, 1200, 70);
  
  fill(0, 0, 0);
  textSize(12);
  text(cavalryCost, 10, 25);
  text(meleeCost, 80, 25);
  text(rangerCost, 150, 25);
  text(cavalryUpCost, 220, 25);
  text(meleeUpCost, 320, 25);
  text(rangerUpCost, 420, 25);
  text(evolutionCost, 520, 25);
  
  text(cavalryECost, 910, 25);
  text(meleeECost, 1010, 25);
  text(rangerECost, 1110, 25);
  text(cavalryEUpCost, 1210, 25);
  text(meleeEUpCost, 1320, 25);
  text(rangerEUpCost, 1390, 25);
  text(evolutionECost, 1460, 25);
  //TURRENT==========================================================================================
  //TURRENT==========================================================================================

  //==========================Victory Check===================================
  if (enemyBase.health == 0) {
    fill(256, 256, 256);
    textSize(50);
    text("Congratulations, you have won the war", 320, 200);
  }
 
  
  else if (myBase.health == 0) {
    fill(256, 256, 256);
    textSize(50);
    text("You've lost the war", 400, 200);
  }
  else{
    if (summonsList.size() != 0) {
      for (int x = 0; x < summonsList.size(); x++) {
        summonsList.get(x).draw();
        fill(256, 256, 256);
        textSize(14);
        text(summonsList.get(x).health, summonsList.get(x).x - 10, summonsList.get(x).y - 25);
        //====================Attack Function===========================
        if (enemyList.size() != 0) {
          if (summonsList.get(x).isTouching(enemyList.get(0)))
            enemyList.get(0).health -= summonsList.get(x).att;
          else
            summonsList.get(x).move();
        } else if (summonsList.get(x).isTouching(enemyBase)) 
          enemyBase.health -= summonsList.get(x).att;
        else
          summonsList.get(x).move();
        //===============================================================

        //===================Death Function==============================
        if (summonsList.get(0).health <= 0) {
          enemyPlayer.gold += summonsList.get(0).deathGain;
          enemyPlayer.xp += summonsList.get(0).xpGain;
          summonsList.remove(0);
        }
        //================================================================
      }
    }

    if (enemyList.size() != 0) {
      for (int x = 0; x < enemyList.size(); x++) {
        enemyList.get(x).draw();
        fill(256, 256, 256);
        textSize(14);
        text(enemyList.get(x).health, enemyList.get(x).x - 8, enemyList.get(x).y - 20);
        if (summonsList.size() != 0) {
          if (enemyList.get(x).isTouching(summonsList.get(0)))
            summonsList.get(0).health -= enemyList.get(x).att;
          else 
          enemyList.get(x).move();
        } else if (enemyList.get(x).isTouching(myBase, 100))
          myBase.health -= enemyList.get(x).att;
        else 
        enemyList.get(x).move();
      }
      if (enemyList.get(0).health <= 0) {
        myPlayer.gold += enemyList.get(0).deathGain;
        myPlayer.xp += enemyList.get(0).xpGain;
        enemyList.remove(0);
      }
    }
  }
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
boolean overMelee() {
  return overRect(meleeX, meleeY, meleeW, meleeH);
}

boolean overCavalry() {
  return overRect(cavalryX, cavalryY, cavalryW, cavalryH);
}

boolean overRanger() {
  return overRect(rangerX, rangerY, rangerW, rangerH);
}

boolean overEMelee() {
  return overRect(meleeEX, meleeY, meleeW, meleeH);
}

boolean overECavalry() {
  return overRect(cavalryEX, cavalryY, cavalryW, cavalryH);
}

boolean overERanger() {
  return overRect(rangerEX, rangerY, rangerW, rangerH);
}

//------------------------------------------------------------------------

void mouseClicked() {
  if (overMelee()==true ) {
    addMelee(1);
  }

  if (overRanger()==true) {
    addRanger(1);
  }

  if (overCavalry()==true) {
    addCavalry(1);
  }
  if (overEMelee()==true) {
    addMelee(2);
  }

  if (overERanger()==true) {
    addRanger(2);
  }

  if (overECavalry()==true) {
    addCavalry(2);
  }
  
  if (overRect(210, 10, 40, 20) && myPlayer.gold >= (cavalryCost)){
    myPlayer.gold -= cavalryCost;
    cavalryUpCost *= 1.25;
    cavalryCost = (cavalryCost + (int)(2 * evolution * (cavalryUpgrade  - 1))) + (int)(1.1 * 10 *(evolution - 1));
    cavalryUpgrade += 1;
  }
  
  if (overRect(310, 10, 40, 20) && myPlayer.gold >= (meleeCost)){
    myPlayer.gold -= meleeCost;
    meleeUpCost *= 1.25;
    meleeCost = (meleeCost + (int)(2 * evolution * (meleeUpgrade  - 1))) + (int)(1.1 * 10 *(evolution - 1));
    meleeUpgrade += 1;
  }
  
  if (overRect(410, 10, 40, 20) && myPlayer.gold >= (rangerCost)){
    myPlayer.gold -= rangerCost;
    rangerUpCost *= 1.25;
    rangerCost = (rangerCost + (int)(2 * evolution * (rangerUpgrade  - 1))) + (int)(1.1 * 10 *(evolution - 1));
    rangerUpgrade += 1;
  }
  
  if (overRect(510, 10, 40, 20) && myPlayer.gold >= (evolution)){
    myPlayer.gold -= evolution;
    cavalryCost = (cavalryCost + (int)(2 * evolution * (cavalryUpgrade  - 1))) + (int)(1.1 * 10 *(evolutionE - 1));
    rangerCost = (rangerCost + (int)(2 * evolution * (rangerUpgrade  - 1))) + (int)(1.1 * 10 *(evolution - 1));
    meleeCost = (meleeCost + (int)(2 * evolution * (meleeUpgrade  - 1))) + (int)(1.1 * 10 *(evolution - 1));
    evolution += 1;
  }
  
  if (overRect(900, 10, 40, 20) && enemyPlayer.gold >= (cavalryECost)){
    enemyPlayer.gold -= cavalryECost;
    cavalryEUpCost *= 1.25;
    cavalryECost = (cavalryECost + (int)(2 * evolutionE * (cavalryEUpgrade  - 1))) + (int)(1.1 * 10 *(evolutionE - 1));
    cavalryEUpgrade += 1;
  }
  
  if (overRect(1000, 10, 40, 20) && enemyPlayer.gold >= (meleeECost)){
    enemyPlayer.gold -= meleeECost;
    meleeEUpCost *= meleeEUpCost;
    meleeECost = (meleeECost + (int)(2 * evolutionE * (meleeEUpgrade  - 1))) + (int)(1.1 * 10 *(evolutionE - 1));
    meleeEUpgrade += 1;
  }
  
  if (overRect(1100, 10, 40, 20) && enemyPlayer.gold >= (rangerECost)){
    enemyPlayer.gold -= rangerECost;
    rangerEUpCost *= 1.25;
    rangerECost = (rangerECost + (int)(2 * evolutionE * (rangerEUpgrade  - 1))) + (int)(1.1 * 10 *(evolutionE - 1));
    rangerEUpgrade += 1;
  }
  
  if (overRect(1200, 10, 40, 20) && enemyPlayer.gold >= (evolutionE)){
    enemyPlayer.gold -= evolutionE;
    rangerECost = (rangerECost + (int)(2 * evolutionE * (rangerEUpgrade  - 1))) + (int)(1.1 * 10 *(evolutionE - 1));
    meleeECost = (meleeECost + (int)(2 * evolutionE * (meleeEUpgrade  - 1))) + (int)(1.1 * 10 *(evolutionE - 1));
    cavalryECost = (cavalryECost + (int)(2 * evolutionE * (cavalryEUpgrade  - 1))) + (int)(1.1 * 10 *(evolutionE - 1));
    evolutionE += 1;
  }
  
}

void addMelee(int side) {
  if (side == 1) {
    if (myPlayer.gold >new Melee(1, meleeUpgrade, evolution).cost) {
      meleeList.add(new Melee(1, meleeUpgrade, evolution));
      summonsList.add(new Melee(1, meleeUpgrade, evolution));
      myPlayer.gold-=new Melee(1, meleeUpgrade, evolution).cost;
      meleeCount+=1;
    }
  } else {
    if (enemyPlayer.gold >new Melee(2, meleeEUpgrade, evolution).cost) {
      meleeEList.add(new Melee(2, meleeEUpgrade, evolution));
      enemyList.add(new Melee(2, meleeEUpgrade, evolution));
      enemyPlayer.gold-=new Melee(2, meleeEUpgrade, evolution).cost;
      meleeECount+=1;
    }
  }
}

void addRanger(int side) {
  if (side == 1) {
    if (myPlayer.gold >new Ranger(1, rangerUpgrade,evolution).cost) {
      rangerList.add(new Ranger(1, rangerUpgrade,evolution));
      summonsList.add(new Ranger(1, rangerUpgrade,evolution));
      myPlayer.gold-=new Ranger(1, rangerUpgrade,evolution).cost;
      rangerCount+=1;
    }
  } else {
    if (enemyPlayer.gold >new Ranger(2, rangerEUpgrade,evolution).cost) {
      rangerEList.add(new Ranger(2, rangerEUpgrade,evolution));
      enemyList.add(new Ranger(2, rangerEUpgrade,evolution));
      enemyPlayer.gold-=new Ranger(2, rangerEUpgrade,evolution).cost;
      rangerECount+=1;
    }
  }
}

void addCavalry(int side) {
  if (side == 1) {
    if (myPlayer.gold > new Cavalry(1, cavalryUpgrade,evolution).cost) {
      cavalryList.add(new Cavalry(1, cavalryUpgrade,evolution));
      summonsList.add(new Cavalry(1, cavalryUpgrade,evolution));
      myPlayer.gold -= new Cavalry(1, cavalryUpgrade,evolution).cost;
      cavalryCount+=1;
    }
  } else {
    if (enemyPlayer.gold >new Cavalry(2, cavalryEUpgrade, evolution).cost) {
      cavalryEList.add(new Cavalry(2, cavalryEUpgrade, evolution));
      enemyList.add(new Cavalry(2, cavalryEUpgrade, evolution));
      enemyPlayer.gold -=new Cavalry(2, cavalryEUpgrade, evolution).cost;
      cavalryECount+=1;
    }
  }
}