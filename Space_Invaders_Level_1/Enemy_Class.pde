//general class of Enemy, what all types of enemies will do
class Enemy {
  //declare variables
  PVector loc;
  float sz;
  boolean square;
  boolean circle;
  boolean triangle;
  int row;
  //float speed;
  //what an enemy needs, location and size
  Enemy(float x, float y, int tempRow) {
    loc = new PVector(x, y);
    sz=20;
    row = tempRow;
    //    speed=1;
  }
  //still have to have void display for the general Enemy class
  void display() {
  }
  //how all enemies will move
  void move(float speed) {
    if (frameCount%20==0) {
      loc.x+=sz*speed;
    }
    if (loc.x>width) {
      loc.x -= width;
      loc.y+=sz*2;
    }
  }
  //if bullet hits enemy, enemy dies
  boolean dies(Bullet b) {
    if (loc.dist(b.loc)<sz/2+b.sz/2) {
      return true;
      //if not hit by bullet, enemy doesn't die
    } else {
      return false;
    }
  }
}
//extend Enemy to create square enemy
class SquareEnemy extends Enemy {
  //taking what SquareEnemy needs from Enemy class
  SquareEnemy(float x, float y, int tempRow) {
    super(x, y, tempRow);
    //enemy is a square
    square=true;
    circle=false;
    triangle=false;
    
  }
  //display square enemy
  void display() {
    fill(0, 250, 0);
    rectMode(CENTER);
    rect(loc.x, loc.y, sz, sz);
  }
}
//extend Enemy to create round enemy
class RoundEnemy extends Enemy {
  //taking what RoundEnemy needs from Enemy class
  RoundEnemy(float x, float y, int tempRow) {
    super(x, y, tempRow);
    //enemy is a circle
    circle=true;
    square=false;
    triangle=false;
  }
  //display round enemy
  void display() {
    fill(250, 0, 0);
    ellipse(loc.x, loc.y, sz, sz);
  }
  // void hit(){
}
//extend Enemy to create triangle enemy
class TriEnemy extends Enemy {
  //taking what TriEnemy needs from Enemy class
  TriEnemy(float x, float y, int tempRow) {
    super(x, y, tempRow);
    //enemy is a triangle
    circle=false;
    square=false;
    triangle=true;
  }
  //display triangle enemy
  void display() {
    fill(0, 0, 250);
    triangle(loc.x, loc.y-sz/2, loc.x-sz/2, loc.y+sz/2, loc.x+sz/2, loc.y+sz/2);
  }
}

