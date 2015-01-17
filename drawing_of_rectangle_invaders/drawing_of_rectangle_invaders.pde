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
  shooter.stayOnScreen();
  for (int i = bullets.size ()-1; i >= 0; i--) {
    Bullet b = bullets.get(i);
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








