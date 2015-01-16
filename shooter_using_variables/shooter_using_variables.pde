int sz=30;
int x=700;
int y=50;
float movingX;
Bullet bullet;
void setup() {
  size (displayWidth, displayHeight);
  movingX=width/2;
  bullet=new Bullet();
}
void draw() {
  background (0);
  noStroke();
  bullet.display();
  bullet.move();
  //top
  rect(movingX/2-55.6, x-30, y, sz);
  //bottom
  rect (movingX/2-75, x, y*1.75, sz);
  //middle
  rect(movingX/2-100, x+30, y*2.75, sz);


  if (keyPressed )
    if (keyCode== LEFT) {
      movingX-= 10;
    } else if (keyCode==RIGHT) {
      movingX+=10;
    }
}

