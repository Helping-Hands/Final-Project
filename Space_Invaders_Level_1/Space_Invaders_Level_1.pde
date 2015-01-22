/////////////if enemies touch shooter, shooter dies, game over
////////////weird screen thing out of whack
///////////do next 2 levels
/////////change to winner/loser screens
////////change levels

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
void setup() {
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
  println("There are " + gridOfEnemies.size() + " enemies");
  //move and display the enemies
  background(0);
  //if shooter makes mistake, mistake=true, enemies speed up
  //    if(dunGoofed==true){
  //     enemySpeed+=.1;
  //     dunGoofed=false;
  //    }
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
        //check if it's a square enemy
        if (e.square==true) {


          //remove bullet that just hit enemy
          bullets.remove(j); 
          //find row of enemy that was just removed
          int justRemoved = e.row;
          //remove enemy that was hit
          gridOfEnemies.remove(i);
          println("Time to check for survivors:");
          checkForSurvivors(justRemoved);
        }
      }
    }
  }

  //      if (gridOfEnemies.enemy.loc.x>width) {
  //        //display game over screen
  //      }

  //identify row of enemy just removed *
  //for every enemy in arraylist,check to see if square
  //yes=check what row
  //row=same just removed
  //int areThereAnyLeft
  //areThereAnyLeft=false
  //areThereAnyLeft=true..don't do anything
  //areThereAnyLeft=false...remove everything w same row value

  // println(y);
  //else {
  //  //hit wrong enemy
  //  dunGoofed=true;
  //  //remove bullet
  //  bullets.remove(j);
  //}



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
}


//if space bar is pressed, add more bullets
void keyPressed() {
  if (key == ' ') {
    bullets.add(new Bullet(shooter));
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

