//================Player===========================
ArrayList<Melee> meleeList = new ArrayList<Melee>();
ArrayList<Cavalry> cavalryList = new ArrayList<Cavalry>();
ArrayList<Ranger> rangerList = new ArrayList<Ranger>();
ArrayList<Summons> summonsList = new ArrayList<Summons>();
int meleeCount, rangerCount, cavalryCount;
//=================Enemy============================
ArrayList<Melee> meleeEList = new ArrayList<Melee>();
ArrayList<Cavalry> cavalryEList = new ArrayList<Cavalry>();
ArrayList<Ranger> rangerEList = new ArrayList<Ranger>();
ArrayList<Summons> enemyList = new ArrayList<Summons>();
int meleeECount, rangerECount, cavalryECount;

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

void setup() {
  size(1500, 700);
  smooth();
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
  
  // Enemy Button Coordinates
  meleeEX = 1380;
  cavalryEX = 1310;
  rangerEX = 1450;
}


void draw() {
  background(0);

  myBase.display();

  enemyBase.display();

  if (overRect(0, 0, 50, 50)==true && mousePressed==true) {
  }
  //-------------------------Draw Spawn Box-----------------------------
  textSize(12);
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

  fill(256, 0, 0);
  textSize(25);
  text(myBase.getHealth(), 20, 500);
  text(enemyBase.getHealth(), 1420, 500);

  //--------------------------------------------------------------------------

  /*for (int x = 0; x < meleeCount; x++) {
   meleeList.get(x).draw();
   meleeList.get(x).process();
   }
   for (int x = 0; x < cavalryCount; x++) {
   cavalryList.get(x).draw();
   cavalryList.get(x).process();
   }
   for (int x = 0; x < rangerCount; x++) {
   rangerList.get(x).draw();
   rangerList.get(x).process();
   } */
  if(summonsList.size() != 0){
    for (int x = 0; x < summonsList.size(); x++) {
      summonsList.get(x).draw();
      if(enemyList.size() != 0){
        if (summonsList.get(x).isTouching(enemyList.get(0)))
          summonsList.get(x).attack(enemyList.get(0));
      }
      if (summonsList.get(x).isTouching(enemyBase)){
        summonsList.get(x).attack(enemyBase);
      }
      else{
        summonsList.get(x).move();  
      }
    }
  }
  
  if(enemyList.size() != 0){
    for (int x = 0; x < enemyList.size(); x++) {
      enemyList.get(x).draw();
      if(summonsList.size() != 0){
        if (enemyList.get(x).isTouching(summonsList.get(0)))
          enemyList.get(x).attack(summonsList.get(0));
      }
      if (enemyList.get(x).isTouching(myBase))
        enemyList.get(x).attack(myBase);  
      else{
        enemyList.get(x).move();  
      }
    }
  }

      //if (enemyList.size() != 0 &&
      //  summonsList.get(x).isTouching(enemyList.get(0))) {
      //  summonsList.get(x).state = Summons.ATTACKING;
      //  summonsList.get(x).attack(enemyList.get(0));
      //}
      //if (summonsList.size() == 0 &&
      //  summonsList.get(x).isTouching(enemyBase)) {
      //  summonsList.get(x).state = Summons.ATTACKING;
      //  summonsList.get(x).attack(enemyBase);
      //}
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
    if (overMelee()==true) {
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
  }

  void addMelee(int side) {
    if (side == 1){
      if (myPlayer.coins >10) {
        meleeList.add(new Melee(1));
        summonsList.add(new Melee(1));
        myPlayer.coins-=10;
        meleeCount+=1;  
      }
    }
    else{
      if (enemyPlayer.coins >10) {
        meleeEList.add(new Melee(2));
        enemyList.add(new Melee(2));
        enemyPlayer.coins-=10;
        meleeECount+=1;  
      }
    }
  }

  void addRanger(int side) {
    if (side == 1){
      if (myPlayer.coins >10) {
        rangerList.add(new Ranger(1));
        summonsList.add(new Ranger(1));
        myPlayer.coins-=10;
        rangerCount+=1;
      }
    }
    else{
      if (enemyPlayer.coins >10) {
        rangerEList.add(new Ranger(2));
        enemyList.add(new Ranger(2));
        enemyPlayer.coins-=10;
        rangerECount+=1;
      }
    }
  }

  void addCavalry(int side) {
    if (side == 1){
      if (myPlayer.coins >10) {
        cavalryList.add(new Cavalry(1));
        summonsList.add(new Cavalry(1));
        myPlayer.coins-=10;
        cavalryCount+=1;
      }
    }
    else{
      if (enemyPlayer.coins >10) {
        cavalryEList.add(new Cavalry(2));
        enemyList.add(new Cavalry(2));
        enemyPlayer.coins-=10;
        cavalryECount+=1;
      }
    }
  }