class Summons extends Object {
  //States
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int ATTACKING = 2;
  final static int DEAD = 3;
  final float CHANGE_FACTOR = .25;
  final float MAX_RADIUS = 50;

  //Instance Variables
  int cost;
  int deathGain;
  float attRange;
  float dx;
  int state;
  float att;

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

  void attack(Object other) {
  }
}