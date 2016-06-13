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
PImage img;


Base myBase;
Base enemyBase;
Player myPlayer;
Player enemyPlayer;
int turretCost, turretDamage;
int meleeX, meleeY, meleeW, meleeH;
int cavalryX, cavalryY, cavalryW, cavalryH;
int rangerX, rangerY, rangerW, rangerH;
int meleeEX, meleeEY, meleeEW, meleeEH;
int cavalryEX, cavalryEY, cavalryEW, cavalryEH;
int rangerEX, rangerEY, rangerEW, rangerEH;
int meleeUpgrade, rangerUpgrade, cavalryUpgrade, baseUpgrade, turretUpgrade, evolution;
int meleeEUpgrade, rangerEUpgrade, cavalryEUpgrade, baseEUpgrade, turretEUpgrade, evolutionE;
int meleeCost, rangerCost, cavalryCost, evolutionCost;
int meleeECost, rangerECost, cavalryECost, evolutionECost;
int meleeUpCost, rangerUpCost, cavalryUpCost, baseUpCost, turretUpCost;
int meleeEUpCost, rangerEUpCost, cavalryEUpCost, baseEUpCost, turretEUpCost;

void setup() {

  img = loadImage("background.png");
  size(1500, 700);
  smooth();
  myTurrent = new Turrent();
  myBase = new Base(1);
  enemyBase= new Base(2);
  myPlayer = new Player();
  enemyPlayer=new Player();
  turretCost = 5;
  turretDamage = 10;
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
  baseUpgrade = 1;
  turretUpgrade = 1;
  evolution = 1;
  
  meleeEUpgrade = 1;
  rangerEUpgrade = 1;
  cavalryEUpgrade = 1;
  baseEUpgrade = 1;
  turretEUpgrade = 1;
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
  baseUpCost = 250;
  turretUpCost = 200;
  
  meleeEUpCost = 50;
  cavalryEUpCost = 100;
  rangerEUpCost = 40;
  baseEUpCost = 250;
  turretEUpCost = 200;
  
  // Enemy Button Coordinates
  meleeEX = 1380;
  cavalryEX = 1310;
  rangerEX = 1450;
}


void turrentAttack(){
  
  
  for (int i = 0 ; i < projectileList.size() ; i++){
    projectileList.get(i).display(); 
    int enitem = enemyList.size()-1;
    for (int y = 0 ; y < enitem;y++){
      if (projectileList.size()>1){
      if ((projectileList.get(i)).isTouching(enemyList.get(y))){
      projectileList.remove(i);
      (enemyList.get(y)).health=(enemyList.get(y)).health-10;
      enitem= enemyList.size()-1;
    }       
      }         
    }   
  }
}


void draw() {
background(img);
  fill(256, 256, 256);
  rect(0, 670, 1500, 50);

  myBase.display();

  enemyBase.display();
  myTurrent.display();
  if (projectileList.size()>0){
    turrentAttack();
  }
  
  if (overRect(0, 0, 50, 50)==true && mousePressed==true) {
  }
  //-------------------------Draw Spawn Box-----------------------------
  textSize(12);
  fill(256, 256, 256);
  rect(cavalryX, cavalryY, cavalryW, cavalryH);  // Cavalry Box
  text("Cavalry", 0, 10);
  text(cavalryList.size(), 0, 40);

  rect(meleeX, meleeY, meleeW, meleeH);  // Draw Melee spawn box
  text("Melee", 70, 10);
  text(meleeList.size(), 70, 40);

  rect(rangerX, rangerY, rangerW, rangerH);  // Draw ranger spawn box
  text("Ranger", 140, 10);
  text(rangerList.size(), 140, 40);

  rect(cavalryEX, cavalryY, cavalryW, cavalryH);  // Cavalry Box
  text("Cavalry", 1310, 10);
  text(cavalryEList.size(), 1310, 40);

  rect(meleeEX, meleeY, meleeW, meleeH);  // Draw Melee spawn box
  text("Melee", 1380, 10);
  text(meleeEList.size(), 1380, 40);

  rect(rangerEX, rangerY, rangerW, rangerH);  // Draw ranger spawn box
  text("Ranger", 1450, 10);
  text(rangerEList.size(), 1450, 40);

  text("Player Gold:", 0, 200);
  text(myPlayer.gold, 90, 200);

  text("Player Experience", 0, 215);
  text(myPlayer.xp, 120, 215);

  text("Enemy Gold:", 0, 230);
  text(enemyPlayer.gold, 90, 230);

  text("Enemy Experience:", 0, 245);
  text(enemyPlayer.xp, 120, 245);

  fill(256, 0, 0);
  textSize(25);
  text(myBase.health, 20, 500);
  text(enemyBase.health, 1420, 500);

  //--------------------------------------------------------------------------
  
  //==========================Upgrade Boxes===================================
  textSize(12);
  fill(256, 256, 256);
  rect(0, 70, 40, 20);
  text("Cavalry Upgrade", 0, 70);
  text(cavalryUpgrade - 1, 0, 100);
  
  rect(100, 70, 40, 20);
  text("Melee Upgrade", 100, 70);
  text(meleeUpgrade - 1, 100, 100);
  
  rect(200, 70, 40, 20);
  text("Ranger Upgrade", 200, 70);
  text(rangerUpgrade - 1, 200, 100);
  
  rect(300, 70, 40, 20);
  text("Base Upgrade", 300, 70);
  text(baseUpgrade - 1, 300, 100);
  
  rect(400, 70, 40, 20);
  text("Turret Upgrade", 400, 70);
  text(turretUpgrade - 1, 400, 100);
  
  rect(500, 70, 40, 20); 
  text("Evolution", 500, 70);
  text(evolution - 1, 500, 100);
  
  rect(940, 70, 40, 20);
  text("Cavalry Upgrade", 940, 70);
  text(cavalryEUpgrade - 1, 940, 100);
  
  rect(1040, 70, 40, 20);
  text("Melee Upgrade", 1040, 70);
  text(meleeEUpgrade - 1, 1040, 100);
  
  rect(1140, 70, 40, 20);
  text("Ranger Upgrade", 1140, 70);
  text(rangerEUpgrade - 1, 1140, 100);
  
  rect(1240, 70, 40, 20);
  text("Base Upgrade", 1240, 70);
  text(baseEUpgrade - 1, 1240, 100);
  
  rect(1340, 70, 40, 20);
  text("Turret Upgrade", 1340, 70);
  text(turretEUpgrade - 1, 1340, 100);
  
  rect(1440, 70, 40, 20);
  text("Evolution", 1440, 70);
  text(evolutionE - 1, 1440, 100);
  
  fill(0, 0, 0);
  textSize(12);
  text(cavalryCost, 10, 25);
  text(meleeCost, 80, 25);
  text(rangerCost, 150, 25);
  text(cavalryUpCost, 10, 85);
  text(meleeUpCost, 110, 85);
  text(rangerUpCost, 210, 85);
  text(baseUpCost, 310, 85);
  text(turretUpCost, 410, 85);
  text(evolutionCost, 510, 85);
  
  text(cavalryECost, 1320, 25);
  text(meleeECost, 1390, 25);
  text(rangerECost, 1460, 25);
  text(cavalryEUpCost, 950, 85);
  text(meleeEUpCost, 1050, 85);
  text(rangerEUpCost, 1150, 85);
  text(baseEUpCost, 1250, 85);
  text(turretEUpCost, 1350, 85);
  text(evolutionECost, 1450, 85);
  
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
        } 
        else if (summonsList.get(x).isTouching(enemyBase)) 
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
        }
        else if (enemyList.get(x).isTouching(myBase, 100))
          myBase.health -= enemyList.get(x).att;
        else 
          enemyList.get(x).move();
      if (enemyList.get(0).health <= 0) {
        myPlayer.gold += enemyList.get(0).deathGain;
        myPlayer.xp += enemyList.get(0).xpGain;
        enemyList.remove(0);
        }
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

boolean overTurret() {
  return overRect(50, 250, 50, 50);
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
  if (overTurret()==true){
    if ((myPlayer.xp > turretCost || projectileList.size()==1) && enemyList.size() >0 ){
    if (myPlayer.xp > turretCost){
      projectileList.add(new Projectile( enemyList.get(0), turretDamage));
      myPlayer.xp -= turretCost;    
    }
  }
  }
  
  if (overRect(0, 70, 40, 20) && myPlayer.gold >= (cavalryUpCost)){
    myPlayer.gold -= cavalryUpCost;
    cavalryUpCost *= 1.25;
    cavalryCost = (25 + (int)(2 * evolution * (cavalryUpgrade  - 1))) + (int)(1.1 * 10 *(evolution - 1));
    cavalryUpgrade += 1;
  }
  
  if (overRect(100, 70, 40, 20) && myPlayer.gold >= (meleeUpCost)){
    myPlayer.gold -= meleeUpCost;
    meleeUpCost *= 1.25;
    meleeCost = (10 + (int)(2 * evolution * (meleeUpgrade  - 1))) + (int)(1.1 * 10 *(evolution - 1));
    meleeUpgrade += 1;
  }
  
  if (overRect(200, 70, 40, 20) && myPlayer.gold >= (rangerUpCost)){
    myPlayer.gold -= rangerUpCost;
    rangerUpCost *= 1.25;
    rangerCost = (10 + (int)(2 * evolution * (rangerUpgrade  - 1))) + (int)(1.1 * 10 *(evolution - 1));
    rangerUpgrade += 1;
  }
  
  if (overRect(300, 70, 40, 20) && myPlayer.gold >= (baseUpCost)){
    myPlayer.gold -= baseUpCost;
    myBase.health += 50;
    baseUpCost *= 1.25;
    baseUpgrade += 1;
  }
  
  if (overRect(400, 70, 40, 20) && myPlayer.gold >= (turretUpCost)){
    myPlayer.gold -= turretUpCost;
    turretCost = turretCost + (5 * turretUpgrade);
    turretDamage = turretDamage + (2 * turretUpgrade);
    turretUpCost *= 1.25;
    turretUpgrade += 1;
  }
  
  if (overRect(500, 70, 40, 20) && myPlayer.gold >= (evolutionCost)){
    myPlayer.gold -= evolutionCost;
    myBase.health += 250;
    turretCost *= 2;
    turretDamage *= 2;
    cavalryCost = (25 + (int)(2 * evolution * (cavalryUpgrade  - 1))) + (int)(1.1 * 10 *(evolutionE - 1));
    rangerCost = (10 + (int)(2 * evolution * (rangerUpgrade  - 1))) + (int)(1.1 * 10 *(evolution - 1));
    meleeCost = (10 + (int)(2 * evolution * (meleeUpgrade  - 1))) + (int)(1.1 * 10 *(evolution - 1));
    evolutionCost *= (1 + evolution * evolution);
    evolution += 1;
  }
  
  if (overRect(940, 70, 40, 20) && enemyPlayer.gold >= (cavalryEUpCost)){
    enemyPlayer.gold -= cavalryEUpCost;
    cavalryEUpCost *= 1.25;
    cavalryECost = (25 + (int)(2 * evolutionE * (cavalryEUpgrade  - 1))) + (int)(1.1 * 10 *(evolutionE - 1));
    cavalryEUpgrade += 1;
  }
  
  if (overRect(1040, 70, 40, 20) && enemyPlayer.gold >= (meleeEUpCost)){
    enemyPlayer.gold -= meleeEUpCost;
    meleeEUpCost *= 1.25;
    meleeECost = (10 + (int)(2 * evolutionE * (meleeEUpgrade  - 1))) + (int)(1.1 * 10 *(evolutionE - 1));
    meleeEUpgrade += 1;
  }
  
  if (overRect(1140, 70, 40, 20) && enemyPlayer.gold >= (rangerEUpCost)){
    enemyPlayer.gold -= rangerEUpCost;
    rangerEUpCost *= 1.25;
    rangerECost = (10 + (int)(2 * evolutionE * (rangerEUpgrade  - 1))) + (int)(1.1 * 10 *(evolutionE - 1));
    rangerEUpgrade += 1;
  }
  
  if (overRect(1240, 70, 40, 20) && myPlayer.gold >= (baseEUpCost)){
    enemyPlayer.gold -= baseEUpCost;
    enemyBase.health += 50;
    baseEUpCost *= 1.25;
    baseEUpgrade += 1;
  }
  
  if (overRect(1340, 70, 40, 20) && myPlayer.gold >= (turretEUpCost)){
    myPlayer.gold -= turretEUpCost;
    turretEUpCost *= 1.25;
    turretEUpgrade += 1;
  }
  
  if (overRect(1440, 70, 40, 20) && enemyPlayer.gold >= (evolutionECost)){
    enemyPlayer.gold -= evolutionECost;
    enemyBase.health += 250;
    rangerECost = (10 + (int)(2 * evolutionE * (rangerEUpgrade  - 1))) + (int)(1.1 * 10 *(evolutionE - 1));
    meleeECost = (10 + (int)(2 * evolutionE * (meleeEUpgrade  - 1))) + (int)(1.1 * 10 *(evolutionE - 1));
    cavalryECost = (25 + (int)(2 * evolutionE * (cavalryEUpgrade  - 1))) + (int)(1.1 * 10 *(evolutionE - 1));
    evolutionECost *= (evolutionE * evolutionE + 1);
    evolutionE += 1;
  }
  
  
  
}

void addMelee(int side) {
  if (side == 1) {
    if (myPlayer.gold > meleeCost) {
      meleeList.add(new Melee(1, meleeUpgrade, evolution));
      summonsList.add(new Melee(1, meleeUpgrade, evolution));
      myPlayer.gold-= meleeCost;
      meleeCount+=1;
    }
  } else {
    if (enemyPlayer.gold > meleeECost) {
      meleeEList.add(new Melee(2, meleeEUpgrade, evolutionE));
      enemyList.add(new Melee(2, meleeEUpgrade, evolutionE));
      enemyPlayer.gold-= meleeECost;
      meleeECount+=1;
    }
  }
}

void addRanger(int side) {
  if (side == 1) {
    if (myPlayer.gold > rangerCost) {
      rangerList.add(new Ranger(1, rangerUpgrade, evolution));
      summonsList.add(new Ranger(1, rangerUpgrade, evolution));
      myPlayer.gold-= rangerCost;
      rangerCount+=1;
    }
  } else {
    if (enemyPlayer.gold > rangerECost) {
      rangerEList.add(new Ranger(2, rangerEUpgrade,evolutionE));
      enemyList.add(new Ranger(2, rangerEUpgrade,evolutionE));
      enemyPlayer.gold-= rangerECost;
      rangerECount+=1;
    }
  }
}

void addCavalry(int side) {
  if (side == 1) {
    if (myPlayer.gold > cavalryCost) {
      cavalryList.add(new Cavalry(1, cavalryUpgrade, evolution));
      summonsList.add(new Cavalry(1, cavalryUpgrade, evolution));
      myPlayer.gold -= cavalryCost;
      cavalryCount+=1;
    }
  } else {
    if (enemyPlayer.gold > cavalryECost) {
      cavalryEList.add(new Cavalry(2, cavalryEUpgrade, evolutionE));
      enemyList.add(new Cavalry(2, cavalryEUpgrade, evolutionE));
      enemyPlayer.gold -= cavalryECost;
      cavalryECount+=1;
    }
  }
}