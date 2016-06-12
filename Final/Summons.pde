class Summons extends Object {

  //Instance Variables
  int deathGain;
  float attRange;
  float dx;
  int state;
  float att;
  int cost;
  int xpGain;
  
  //void process() {
  //  if ( rad <= 0 ) 
  //    state = DEAD;
  //  if (state == ATTACKING){
  //  }
  //  if ( state == MOVING )
  //    move();
  //  else if ( state == GROWING )
  //    grow();
  //}

  void move() {
    x = x + dx;
  }

  void draw() {
  }

  boolean isTouching( Object other ) {
    return(abs((other.x - x)) <= attRange);
  }
  
  boolean isTouching( Object other, int addRange ) {
    return(abs(((other.x + addRange) - x)) <= attRange);
  }
}