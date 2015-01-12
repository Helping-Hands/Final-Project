//probably a particle system or something
void setup(){
  size(displayWidth,displayHeight);
}

void draw(){
  //display,move,etc shooter and invaders
}

//START GAME
//if mouse presses the "start" button, level 1 begins

//QUIT (on start screen and game screen
//if mouse presses the "quit" button, game closes

//PAUSE
//if "p" key is pressed, game is paused

//DIRECTIONS
//given at the start of every level
//black screen that gives example of invader

///////////////////invaders/enemies/////////////////

class Invader{
//declare variables


Invader(){
  //intialize variables and location
}

//figure out way to determine the enemies vs just the invaders

void display(){
  //display enemies, shapes
  //set up rows?
  //set 10 per row, 5 rows per level
}

boolean is hit(enemy is hit){
 //if invader is hit and they're a declared enemy, they die 
}

void miss(){
  //if invader is hit and they're not a declared enemy, row speeds up
}
}



////////////////////////shooter/player/////////////////////////

class Shooter{
  //declare variables


Shooter(){
  //intialize variables and location
}

void ammo(){
  //when shooter fires, bullet comes out
  //bullet is what kills invaders
  //should accelerate faster than invaders
}

void display(){
 //insert block of shooter (player) 
}

void aim(){
  //aims shooter, moves about 5
  //moves left if left arrow key is pressed
  //moves right if right arrow key is pressed
}

boolean fires(){
  //after aiming, player fires and tries to hit enemy
}

void dies(){
  //if row of invaders comes within line of shooter, shooter dies
}
}

/////////////////bullet/ammo////////////////////////

class Bullet(){
  //declare variables

Bullet(){
//intialize variables and location
}

void display(){
  //display bullet, but have bullet start inside of shooter
}

void release(){
  //bullet is released from shooter
}

void move(){
  //bullet is moved toward invaders after it is released
}
}

//SHAPES
 triangle (30,75,58,20,86,75); //triangle
  ellipse (136,46,55,55); //circle
    rect (90,80,65,65);
  translate (width/2 , height/2);
  rotate (PI/ 3);v
  rect ( -26, -2, 52, 52); //diamond




