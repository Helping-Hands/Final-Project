/////////////if enemies touch shooter, shooter dies, game over
////////////weird screen thing out of whack
///////////do next 2 levels
/////////change to winner/loser screens
////////change levels

////////////////Declare variables for Start Screen///////////
int count =75;
PFont font;
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];
PVector[] acc = new PVector[count];
float[] sz = new float[count];


////////////////Declare variables for Game///////////////////
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

void setup() {
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
  }
  ////////////Setup for level 1
  //checkForSurvivors(0);
  //checkForSurvivors(1);
  //checkForSurvivors(2);
  //checkForSurvivors(3);
  //checkForSurvivors(4);
  //size of screen
  size(displayWidth, displayHeight);
  //put all enemies into a grid of 5 by 10
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
  //declare new shooter
  shooter=new Shooter();
}
void draw() {
  //draw start screen
  if (running == 0) {
  textFont(font, 32);
  fill(0, 255, 85);
  textSize(100);
  text("Shape Invaders", 280, 425);
  textSize (24);
  text("PRESS SPACE BAR TO CONTINUE" ,525, 485);
  noStroke();
  fill(0,0,20,20);
  rect(0,0,width,height);

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
    fill(255,255,255,random(50,75 ));
    ellipse(loc[i].x, loc[i].y, sz[i], sz[i]);

    if (loc[i].x + sz[i]/2 > width || loc[i].x - sz[i]/2 < 0) {
      vel[i].x *= -1;
    }
    if (loc[i].y + sz[i]/2 > height || loc[i].y - sz[i]/2 < 0) {
      vel[i].y *= -1;
    }
  }
////////////draw for direction screen   
  }else if  (running == 1) {
    background(0);
textSize (50);
text (" Level One",width/2-200,200);
fill (0,200,100);
text( "Directions: Hit all squares with shooter",width/2-600,350);
text ("PRESS SPACE BAR TO CONTINUE",width/2-450,470);
  }
  else if  (running == 2) {      //do these things for level 1
    println("There are " + gridOfEnemies.size() + " enemies");
    //move and display the enemies
    background(0);
    //if shooter makes mistake, mistake=true, enemies speed up
    if (dunGoofed==true) {
      enemySpeed+=.1;
      dunGoofed=false;
    }

    //drawing the enemies in a grid
    //display and move enemies
    for (int i= 0; i < gridOfEnemies.size (); i++) {
      Enemy e=gridOfEnemies.get(i);
      e.display();
      e.move(enemySpeed);
      //checks each bullet, sees if any bullet hits an enemy
      for (int j = bullets.size ()-1; j >= 0; j--) {
        Bullet b = bullets.get(j);
        if (e.dies(b)) {
          //remove bullet that just hit enemy
          bullets.remove(j);
          //check if it's a square enemy
          if (e.square==true) {



            //find row of enemy that was just removed
            int justRemoved = e.row;
            //remove enemy that was hit
            gridOfEnemies.remove(i);
            println("Time to check for survivors:");
            checkForSurvivors(justRemoved);
          } else {
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
  }  //end code for level 1
}
if(running==3){
  println("There are " + gridOfEnemies.size() + " enemies");
    //move and display the enemies
    background(0);
    //if shooter makes mistake, mistake=true, enemies speed up
    if (dunGoofed==true) {
      enemySpeed+=.1;
      dunGoofed=false;
    }

    //drawing the enemies in a grid
    //display and move enemies
    for (int i= 0; i < gridOfEnemies.size (); i++) {
      Enemy e=gridOfEnemies.get(i);
      e.display();
      e.move(enemySpeed);
      //checks each bullet, sees if any bullet hits an enemy
      for (int j = bullets.size ()-1; j >= 0; j--) {
        Bullet b = bullets.get(j);
        if (e.dies(b)) {
          //remove bullet that just hit enemy
          bullets.remove(j);
          //check if it's a square enemy
          if (e.circle==true) {
            //find row of enemy that was just removed
            int justRemoved = e.row;
            //remove enemy that was hit
            gridOfEnemies.remove(i);
            println("Time to check for survivors:");
            checkForSurvivors(justRemoved);
          } else {
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
}  //end code for level 1



//if space bar is pressed, add more bullets
void keyPressed() {
  if (key == ' ') {
    if (running == 0) {
      running= 1;
    } else if (running == 1) {
      running = 2;
    } else if (running == 2) {
      bullets.add(new Bullet(shooter));
    }
  }
}

//if(no square enemies left in row){
//  remove.row;
// }
void checkForSurvivors(int rowToCheck) {
  println("There are a total of " + gridOfEnemies.size() + " enemies");
  println("Checking for survivors now in row " + rowToCheck);
  //declare areThereAnyLeft as flase
  boolean areThereAnyLeft = false;

  //for grid of enemies just hit
  for (int k = gridOfEnemies.size ()-1; k >= 0; k--) {
    //declare otherEnemy in rows
    Enemy otherEnemy = gridOfEnemies.get(k);
    //if otherEnemy is a square
    if (otherEnemy.square==true) {
      if (otherEnemy.row==rowToCheck) {
        areThereAnyLeft=true;
        //                  so don't do anything
      }
    }
  } //now that this for loop is over, we know whether or not there are any squares left in the row we just removed from
  println("We checked, and it is " + areThereAnyLeft + " that there are survivors");
  if (areThereAnyLeft==false) {
    println("Time to cull the unnecessary ones in row " + rowToCheck);
    for (int k = 0; k < gridOfEnemies.size (); k++) {

      Enemy otherEnemy = gridOfEnemies.get(k);
      println("Checking enemy " + k + " now and it is in row " + otherEnemy.row);
      if (otherEnemy.row == rowToCheck) {
        gridOfEnemies.remove(k);
        println("Removing one now");
      }
    }
  }
}

