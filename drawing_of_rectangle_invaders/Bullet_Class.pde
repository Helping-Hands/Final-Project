/////////////////////////////////class bullet////////////////////////////
class Bullet {
  //declare variables
  float y;
  int vel;
  float x;
 int sz;
  Bullet(Shooter ship) {
    //intialize variables and location
    y=ship.y;
    vel=10;
    x=ship.x;
    sz=5;
  }

  void display() {
    fill(250);
    //display bullet, but have bullet start inside of shooter
    ellipse(x, y, sz, sz);
  }


  void move() {
    //bullet is moved toward invaders after it is released

    y-=vel;
  }
  boolean isDead(){
    //how to tell if bullet is dead
    if(y-sz/2>height || sz<=0){
      return true;
    } else {
      return false;
    }
  } 
 
}
