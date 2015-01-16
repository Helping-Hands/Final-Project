//drawing an array of enemies
ArrayList<Enemy> gridOfEnemies= new ArrayList<Enemy>();
//grid of enemies, 5 rows by 10 columns
int rows=5;
int columns=10;
int eSpacing = 100;
//shooter and bullet
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Shooter shooter;
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
  shooter=new Shooter();
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
    //    fill(0, 250, 0);
    //    text("SHOOT ALL GREEN SQUARES", displayWidth/2-350, displayHeight-700);
  }
  shooter.display();
  shooter.aim();
  for (int i = bullets.size ()-1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.display();
    b.move();
  }
}

void keyPressed() {
  if (key == ' ') {
    bullets.add(new Bullet(shooter));
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
  // void hit(){
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

////////////////////////shooter/player/////////////////////////

class Shooter {
  //declare variables
  int h;
  int x;
  int y;
  int w1, w2, w3;


  Shooter() {
    //intialize variables and location

    h =30;
    x=width/2;
    y=height-50;
    w1 = 200;
    w2 = 75;
    w3 = 50;
  }


  void display() {
    //insert block of shooter (player)
    noStroke();
    //bottom
    rect(x, y, w1, h);
    //middle
    rect(x, y-h, w2, h);
    //top
    rect (x, y-2*h, w3, h);
  }

  void aim() {
    //aims shooter, moves about 5
    //moves left if left arrow key is pressed
    //moves right if right arrow key is pressed
    if (keyPressed )
      if (keyCode== LEFT) {
        x-= 10;
      } else if (keyCode==RIGHT) {
        x+=10;
      }
  }
}
// // void dies() {
//    //if(enemy touches shooter, 
//
//
//
/////////////////////////////////class bullet////////////////////////////
class Bullet {
  //declare variables
  float y;
  int vel;
  float x;
  Bullet(Shooter ship) {
    //intialize variables and location
    y=ship.y;
    vel=10;
    x=ship.x;
  }

  void display() {
    //display bullet, but have bullet start inside of shooter
    ellipse(x, y, 5, 5);
  }


  void move() {
    //bullet is moved toward invaders after it is released

    y-=vel;
  }
}


//
//  //ball bounce off right paddle
//  if (x+sz/2 >= rightX && y >= rightY && y <= rightY + paddleHeight)
//  {
// //make ball switch directions
//    xspeed=-abs(xspeed);
// //make ball turn color of paddle
//ballColor=color(0,0,255);
//  }
//  //check if ball touches right wall, restart at center
//  if (x+sz/2>=width) {
//    x=width/2;
//    y=height/2;
//    //increase left paddle score
//    text2++;
//    //reset ball color
//    ballColor = (255);
//    fill(255,0,0);
// //indicate left paddle player scored
//    text("SCORE!",width/2-70,height/2);
//  }
//  //check if ball touches left wall, restart at center
//  if (x-sz/2<=0) {
//    x=width/2;
//    y=height/2;
//    //increase right paddle score
//    text1++;
//    //reset ball color
//    ballColor = (255);

