////CHEAT CODE keyPressed 'c'
////PROBLEMS for some reason, no matter what, last row will always level a few enemies behind, but remove some
////look in void rowToCheck


///Declare variables for Start Screen///////////
int count =75;
PFont font;
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];
PVector[] acc = new PVector[count];
float[] sz = new float[count];

/////////Declare other variable for Winner Screen
float spin = 0.0;

/////////Declare variables for loser screen////////
int value = 0;

////////////////Declare variables for Level 1,2,3///////////////////
//drawing an array of enemies
ArrayList<Enemy> gridOfEnemies= new ArrayList<Enemy>();
//grid of enemies, 5 rows by 10 columns
int rows=5;
int columns=10;
int eSpacing = 100;
//arraylist of bullets
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
//declare Shooter as shooter
Shooter shooter;
//how quickly enemies move
float enemySpeed=1;
//mistake=you hit a wrong enemy
boolean dunGoofed=false;
//running variable determines which stage to show
int running = 0;
boolean gameOver = false;

/////////Declare variables for Sick Beats (aka instrumental version of new slaves   ////////////////
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer music;

////Setup////
void setup() {
  ////setup for audio
  minim = new Minim (this);
 music = minim.loadFile ("new slaves.mp3");
 music.loop();
  ///setup for gameOver
  if (gameOver) {
    running = 8;
  }
  ////////setup for start screen
  if (running == 0) {
    size(displayWidth, displayHeight);
    background(0);
    textMode(CENTER);
    font=loadFont("Txt_IV50-48.vlw");
    for (int i = 0; i < count; i++) {  
      sz[i] = random(0, 5);         
      loc[i] = new PVector(random(sz[i], width-sz[i]), random(sz[i], height-sz[i])); 
      vel[i] = new PVector(0, random(0, 5));       
      acc[i] = new PVector(0, 0);
    }
    ///setup for winner screen
  } else if (running==7) {
    background(0);
    textMode(CENTER);
    font=loadFont("Txt_IV50-48.vlw");
    for (int i = 0; i < count; i++) {  
      sz[i] = random(0, 5);         
      loc[i] = new PVector(random(sz[i], width-sz[i]), random(sz[i], height-sz[i])); 
      vel[i] = new PVector(0, random(0, 5));       
      acc[i] = new PVector(0, 0);
    }
    //setup for loser screen
  } else if (running==8) {
    background(0);
    colorMode(HSB, 360, 100, 100);
    noStroke();
    ellipseMode(RADIUS);
    frameRate(1);
    textMode (CENTER);
  }
  ////////////Setup for level 1
  //checkForSurvivors(0);
  //checkForSurvivors(1);
  //checkForSurvivors(2);
  //checkForSurvivors(3);
  //checkForSurvivors(4);
  //size of screen
  size(displayWidth, displayHeight);
  //reset each level's grid
  reset();
  //declare new shooter
  shooter=new Shooter();
}

void draw() {
  //draw start screen
  if (running == 0) {
    //text and fill for start screen
    textFont(font, 32);
    fill(0, 255, 85);
    textSize(100);
    text("Shape Invaders", 280, 425);
    textSize (24);
    text("PRESS SPACE BAR TO CONTINUE", 525, 485);
    noStroke();
    fill(0, 0, 20, 20);
    rect(0, 0, width, height);
    //code for moving star-like white things in background of screen
    for (int i = 0; i < count; i++) {  

      vel[i].add(acc[i]);
      loc[i].add(vel[i]);


      for (int j = 0; j < count; j++) {
        if (i!=j) {
          if (loc[i].dist(loc[j]) < sz[i]/2 + sz[j]/2) {
            if (loc[i].x < loc[j].x) {   
              vel[i].x = -abs(vel[i].x);
              vel[j].x = abs(vel[j].x);
            } else {
              vel[i].x = abs(vel[i].x);
              vel[j].x = -abs(vel[j].x);
            }
            if (loc[i].y < loc[j].y) {   
              vel[i].y = -abs(vel[i].y);
              vel[j].y = abs(vel[j].y);
            } else {
              vel[i].y = abs(vel[i].y);
              vel[j].y = -abs(vel[j].y);
            }
          }
        }
      }
      fill(255, 255, 255, random(50, 75 ));
      ellipse(loc[i].x, loc[i].y, sz[i], sz[i]);

      if (loc[i].x + sz[i]/2 > width || loc[i].x - sz[i]/2 < 0) {
        vel[i].x *= -1;
      }
      if (loc[i].y + sz[i]/2 > height || loc[i].y - sz[i]/2 < 0) {
        vel[i].y *= -1;
      }
    }
    ////////////draw for direction screen
  } else if  (running == 1) {
    //level one directions, text, background
    background(0);
    textSize (50);
    text (" Level One", width/2-200, 100);
    fill (0, 200, 100);
    text( "Directions: Hit all squares with shooter", width/2-600, 220);
    text ("(Press Space Bar To Continue)", width/2-450, 370);
    text("USE LEFT AND RIGHT ARROW KEYS TO AIM",width/2-550,500);
    text("USE SPACE BAR TO SHOOT",width/2-350,600);
  } else if  (running == 2) {     
    //do these things for level 1
    background(0);
    //if shooter makes mistake, mistake=true, enemies speed up
    if (dunGoofed==true) {
      enemySpeed+=.1;
      dunGoofed=false;
    }
 //      nextScreen();

    //drawing the enemies in a grid
    //display and move enemies
    for (int i= 0; i < gridOfEnemies.size (); i++) {
      Enemy e=gridOfEnemies.get(i);
      e.display();
      e.move(enemySpeed);
      //if grid touches bottom, loser screen
      if (e.isTouchingBottom()==true) {
        //   println("Cower, puny mortals! Running has a value of: " + running);
        running = 8;
        //  println("And running is now " + running);
        colorMode(HSB, 360, 100, 100, 100);
      }

      //checks each bullet, sees if any bullet hits an enemy
      for (int j = bullets.size ()-1; j >= 0; j--) {
        Bullet b = bullets.get(j);
        //check if any enemy was hit by bullet
        if (e.dies(b)) {
          //remove bullet that just hit enemy
          bullets.remove(j);
          //check if it's a square enemy
          if (e.square==true) {
            //find row of enemy that was just removed
            int justRemoved = e.row;
            //remove enemy that was hit
            gridOfEnemies.remove(i);
            //  println("Time to check for survivors:");
            checkForSurvivors(justRemoved);
          } else {
            //if enemy is not a square, speed up grid
            dunGoofed=true;
          }
        }
      }
    }
    //display shooter, aim, stayOnScreen
    shooter.display();
    shooter.aim();
    shooter.stayOnScreen();
    //display bullets, move, is dead
    for (int j = bullets.size ()-1; j >= 0; j--) {
      Bullet b = bullets.get(j);
      b.display();
      b.move();
      b.isDead();
    }
  } else if (running==3) { //level 2 directions
    //level 2 directions background, text
    background (0);
    textSize (50);
    text (" Level Two", width/2-200, 200);
    fill (0, 200, 100);
    text( "Directions: Hit all circles with shooter", width/2-600, 350);
    text("(Press Space Bar To Continue)", width/2-450, 470);
  } else if (running==4) { //level 2 draw
    //drawing the enemies in a grid
    //display and move enemies
    background(0);
    //if ya goofed, speed of grid increases
    if (dunGoofed==true) {
      enemySpeed+=.1;
      dunGoofed=false;
    }
   //    nextScreen();
    //for each enemy, display, and move them
    for (int i= 0; i < gridOfEnemies.size (); i++) {
      Enemy e=gridOfEnemies.get(i);
      e.display();
      e.move(enemySpeed);
      //if grid of enemies touches bottom, then loser screen
      if (e.isTouchingBottom()==true) {
     //   println("Cower, puny mortals! Running has a value of: " + running);
        running = 8;
      //  println("And running is now " + running);
        colorMode(HSB, 360, 100, 100, 100);
      }
      //checks each bullet, sees if any bullet hits an enemy
      for (int j = bullets.size ()-1; j >= 0; j--) {
        Bullet b = bullets.get(j);
        //if bullet hits any enemy
        if (e.dies(b)) {
          //remove bullet that just hit enemy
          bullets.remove(j);
          //check if it's a circle enemy
          if (e.circle==true) {
            //find row of enemy that was just removed
            int justRemoved = e.row;
            //remove enemy that was hit
            gridOfEnemies.remove(i);
           // println("Time to check for survivors:");
            checkForSurvivors(justRemoved);
          } else {
            //if any enemy that wasn't a circle was hit, ya goofed, so speed of grid increase
            dunGoofed=true;
          }
        }
      }
    }
    //display shooter, aim, stayOnScreen
    shooter.display();
    shooter.aim();
    shooter.stayOnScreen();
    //display bullets, move, is dead
    for (int j = bullets.size ()-1; j >= 0; j--) {
      Bullet b = bullets.get(j);
      b.display();
      b.move();
      b.isDead();
    }
  } else if (running ==5) { //level 3 directions
  //level 3 directions background, text
    background (0);
    textSize (50);
    text (" Level Three", width/2-200, 200);
    fill (0, 200, 100);
    text( "Directions: Hit all triangles with shooter", width/2-600, 350);
    text("(Press Space Bar To Continue)", width/2-450, 470);
  } else if (running ==6) { //level 3
  //background
    background(0);
    //if ya goofed, speed of grid of enemies will increase
    if (dunGoofed==true) {
      enemySpeed+=.1;
      dunGoofed=false;
    }
    
   //    nextScreen();
    
    //for each enemy, display and move them
    for (int i= 0; i < gridOfEnemies.size (); i++) {
      Enemy e=gridOfEnemies.get(i);
      e.display();
      e.move(enemySpeed);
      //if grid of enemies touches the bottom, loser screen
      if (e.isTouchingBottom()==true) {
       // println("Cower, puny mortals! Running has a value of: " + running);
        running = 8;
       // println("And running is now " + running);
        colorMode(HSB, 360, 100, 100, 100);
      }
      //checks each bullet, sees if any bullet hits an enemy
      for (int j = bullets.size ()-1; j >= 0; j--) {
        Bullet b = bullets.get(j);
        //if bullet hits any enemy
        if (e.dies(b)) {
          //remove bullet that just hit enemy
          bullets.remove(j);
          //check if it's a triangle enemy
          if (e.triangle==true) {
            //find row of enemy that was just removed
            int justRemoved = e.row;
            //remove enemy that was hit
            gridOfEnemies.remove(i);
          //  println("Time to check for survivors:");
            checkForSurvivors(justRemoved);
          } else {
            //if any enemy besides triangle was hit, ya goofed, so grid of enemies will speed up
            dunGoofed=true;
          }
        }
      }
    }
    //display shooter, aim, stayOnScreen
    shooter.display();
    shooter.aim();
    shooter.stayOnScreen();
    //display bullets, move, is dead
    for (int j = bullets.size ()-1; j >= 0; j--) {
      Bullet b = bullets.get(j);
      b.display();
      b.move();
      b.isDead();
    }
  } else if (running==7) { //winner screen
  //background, no stroke
    background(0);
    noStroke();
    pushMatrix();
    //'winner' was supposed to spin around like beginning screen, but it's not working for some reason
    translate(width/2, height/2-300, 0);
    spin +=0.009;
    rotateX(PI/10);
    rotateY(PI/20 + spin);
    textFont(font, 22);
    fill(0, 80, 85);
    textSize(150);
    noStroke();
    text("WINNER", 200, 125);
    textSize(65);
    text("THE END ", 268, 220);
    noStroke();
    popMatrix();


    fill(0, 0, 20, 20);
    rect(0, 0, width, height);
    for (int i = 0; i < count; i++) {  

      vel[i].add(acc[i]);
      loc[i].add(vel[i]);

//to rotate text, etc
      for (int j = 0; j < count; j++) {
        if (i!=j) {
          if (loc[i].dist(loc[j]) < sz[i]/2 + sz[j]/2) {
            if (loc[i].x < loc[j].x) {   
              vel[i].x = -abs(vel[i].x);
              vel[j].x = abs(vel[j].x);
            } else {
              vel[i].x = abs(vel[i].x);
              vel[j].x = -abs(vel[j].x);
            }
            if (loc[i].y < loc[j].y) {   
              vel[i].y = -abs(vel[i].y);
              vel[j].y = abs(vel[j].y);
            } else {
              vel[i].y = abs(vel[i].y);
              vel[j].y = -abs(vel[j].y);
            }
          }
        }
      }
      fill(255, 255, 255, random(50, 75 ));
      ellipse(loc[i].x, loc[i].y, sz[i], sz[i]);

      if (loc[i].x + sz[i]/2 > width || loc[i].x - sz[i]/2 < 0) {
        vel[i].x *= -1;
      }
      if (loc[i].y + sz[i]/2 > height || loc[i].y - sz[i]/2 < 0) {
        vel[i].y *= -1;
      }
    }
  } else if (running==8) { //loser screen
  //background, rest is taken care of in void drawGradient
  //  println("Entering level 8 now");
    background(0);
    for (int x = 0; x <= width; x++) {
      drawGradient(x, height/2);
    }
  }
}





void keyPressed() {
  //if space bar is pressed....
  if (key == ' ') {
    //start screen
    if (running == 0) {
      //move on to direction screen
      running= 1;
    } else if (running == 1) {
      //move on to level one and reset grid of enemies
      running = 2;
      reset();
    } else if (running == 2) {
      //add bullets during level 1 whenever space bar is pressed
      bullets.add(new Bullet(shooter));
      //directions for level 2
    } else if (running == 3) {
      //move on to level two and reset grid of enemies
      running = 4;
      reset();
    } else if (running ==4) {
      //add bullets during level 2 whenever space bar is pressed
      bullets.add(new Bullet(shooter));
      //directions for level three
    } else if (running==5) {
      //move on to level three and reset grid of enemies
      running=6;
      reset();
    } else if (running==6) {
      //add bullets during level 3 whenever space bar is pressed
      bullets.add(new Bullet(shooter));
    }
  }
  /////////////CHEATS SINCE NEXTSCREEN FUNCTION SEEMS TO BE NOT WORKING
  //if pressed 'c' key
  if (key == 'c') {
    if (running==2) {
      //level 1 skips to level 2 direction screen
      running=3;
    }
    if (running==4) {
      //level 2 skips to level 3 direction screen
      running=5;
    }
    if (running==6) {
      //level 3 skips to winner screen
      running=7;
    }
  }
}

void reset() {
  //resets grid of enemies for each level
  gridOfEnemies= new ArrayList<Enemy>();
  for (int x=0; x<columns; x++) {
    for (int y=0; y<rows; y++) {
      float r = random(1);
      //randomly insert square, round, triangle enemies
      if (r < .33) {
        gridOfEnemies.add(new SquareEnemy(10+x*eSpacing, 10+y*eSpacing, y));
      } else if (r < .66) {
        gridOfEnemies.add(new RoundEnemy(10+x*eSpacing, 10+y*eSpacing, y));
      } else {
        gridOfEnemies.add(new TriEnemy(10+x*eSpacing, 10+y*eSpacing, y));
      }
    }
  }
}

/////////I TRIED TO MAKE THIS WORK, IT WASN'T WORKING, IT'S SUPPOSED TO BE THE CODE TO MOVE ON TO NEXT LEVEL ONCE THERE ARE NO ENEMIES LEFT DURING YOUR CURRENT LEVEL
//void nextScreen(){
//  if(areThereAnyLeft==false){
//    running++;
//  }
//}

void checkForSurvivors(int rowToCheck) {
//  println("There are a total of " + gridOfEnemies.size() + " enemies");
//  println("Checking for survivors now in row " + rowToCheck);
  //declare areThereAnyLeft as false
  boolean areThereAnyLeft = false;

  //for grid of enemies just hit
  for (int k = gridOfEnemies.size ()-1; k >= 0; k--) {
    //declare otherEnemy in rows
    Enemy otherEnemy = gridOfEnemies.get(k);
    //if otherEnemy is a square (will change to circle or triangle for specified level
    if (otherEnemy.square==true) {
      if (otherEnemy.row==rowToCheck) {
        areThereAnyLeft=true;
        //                  so don't do anything
      }
    }
  } //now that this for loop is over, we know whether or not there are any squares left in the row we just removed from
//  println("We checked, and it is " + areThereAnyLeft + " that there are survivors");
  if (areThereAnyLeft==false) {
//println("Time to cull the unnecessary ones in row " + rowToCheck);
    for (int k = 0; k < gridOfEnemies.size (); k++) {
      //for the grid of enemies...
      Enemy otherEnemy = gridOfEnemies.get(k);
 //     println("Checking enemy " + k + " now and it is in row " + otherEnemy.row);
 //if the row of enemy just shot is the row of the square (or circle or triangle depending on level)
      if (otherEnemy.row == rowToCheck) {
        //remove all the enemies from that row
        gridOfEnemies.remove(k);
 //       println("Removing one now");
      }
    }
    //*******so I tried to make the code basically if the last row doesn't have any enemies left, then move onto next level, has problems though
    //If you comment this out, it's not going to work perfectly, you'll just have to use cheat to move on
    if(rowToCheck==4){
      if(areThereAnyLeft==false){
        running++;
      }
    }
  }
} /////////For Loser Screen/////////
void drawGradient(float x, float y) {
  //text, fill, hsb
  float h = random(0, 360);
  fill(h, 90, 90);
  textSize (200);
  text("YOU LOSE", 225, 410);
  h = (h + 1) % 360;
  textSize (60);
  text ("SORRY, TRY AGAIN", 325, 490);
}

