/////////////if enemies touch shooter, shooter dies, game over
////////////weird screen thing out of whack
///////////do next 4 levels
//////////title screens
/////////change to winner/loser screens
////////change levels
//drawing an array of enemies
ArrayList<Enemy> gridOfEnemies= new ArrayList<Enemy>();
//grid of enemies, 5 rows by 10 columns
int rows=5;
int columns=10;
int eSpacing = 100;
//shooter and bullet
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Shooter shooter;
float enemySpeed=1;
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
    e.move(enemySpeed);
    for (int j = bullets.size ()-1; j >= 0; j--) {
      Bullet b = bullets.get(j);
      if (e.dies(b)) {
        if (e.square==true) {
          gridOfEnemies.remove(i);
          bullets.remove(j);
        } else {
          enemySpeed+=2;
          bullets.remove(j);
        }
      }
    }
  }

  shooter.display();
  shooter.aim();
  shooter.stayOnScreen();

  for (int j = bullets.size ()-1; j >= 0; j--) {
    Bullet b = bullets.get(j);
    b.display();
    b.move();
    b.isDead();
  }
}


void keyPressed() {
  if (key == ' ') {
    bullets.add(new Bullet(shooter));
  }
}


