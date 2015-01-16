//drawing an array of enemies
ArrayList<Enemy> gridOfEnemies= new ArrayList<Enemy>();
//grid of enemies, 5 rows by 10 columns
int rows=5;
int columns=10;
int eSpacing = 100;
void setup() {
  size(displayWidth, displayHeight);
  //put all enemies into a grid of 5 by 10
  for (int x=0; x<columns; x++) {
    for (int y=0; y<rows; y++) {
      float r = random(1);
      if (r < .33) {
        gridOfEnemies.add(new SquareEnemy(10+x*eSpacing, 10+y*eSpacing));
      } else if (r < .66) {
        gridOfEnemies.add(new RoundEnemy(10+x*eSpacing, 10+y*eSpacing));
      } else {
        gridOfEnemies.add(new TriEnemy(10+x*eSpacing, 10+y*eSpacing));
      }
    }
  }
}
void draw() {
  //move and display the enemies
  background(0);
  //drawing the enemies in a grid
  for (int i=0; i< gridOfEnemies.size (); i++) {
    Enemy e=gridOfEnemies.get(i);
    e.display();
    e.move();
    textSize(50);
     fill(0,250,0);
    text("SHOOT ALL GREEN SQUARES",displayWidth/2-350,displayHeight-700);
  }
}


//general class of Enemy, what all types of enemies will do
class Enemy {
  //declare variables
  PVector loc;
  float sz;
  boolean square;
  boolean circle;
  boolean triangle;
  //what an enemy needs, location and size
  Enemy(float x, float y) {
    loc = new PVector(x, y);
    sz=20;
  }
  //still have to have void display for the general Enemy class
  void display() {
  }
  //how all enemies will move
  void move() {
    if (frameCount%60==0) {
      loc.x+=sz;
    }
    if (loc.x>width) {
      loc.x=0;
      loc.y+=sz;
    }
  }
}
//extend Enemy to create square enemy
class SquareEnemy extends Enemy {
  //taking what SquareEnemy needs from Enemy class
  SquareEnemy(float x, float y) {
    super(x, y);
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
  RoundEnemy(float x, float y) {
    super(x, y);
    circle=true;
    square=false;
    triangle=false;
  }
  //display round enemy
  void display() {
    fill(250, 0, 0);
    ellipse(loc.x, loc.y, sz, sz);
  }
}
//extend Enemy to create triangle enemy
class TriEnemy extends Enemy {
  //taking what TriEnemy needs from Enemy class
  TriEnemy(float x, float y) {
    super(x, y);
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

