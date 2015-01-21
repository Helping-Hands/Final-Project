/////////////////////////////////class bullet////////////////////////////
class Bullet {
  //declare variables
  PVector loc;
  int vel;
  int sz;
  Bullet(Shooter ship) {
    //intialize variables and location
    //bullet begins inside of shooter (ship)
    loc=new PVector(ship.x, ship.y);
   //speed/size of bullet 
    vel=10;
    sz=5;
  }

  void display() {
    //color of bullet
    fill(250);
    //display bullet, but have bullet start inside of shooter, and size of sz
    ellipse(loc.x, loc.y, sz, sz);
  }


  void move() {
    //bullet is moved toward enemies after it is released
    loc.y-=vel;
  }
  boolean isDead() {
    //how to tell if bullet is dead
    //if bullet goes past height of screen, it's dead
    if (loc.y-sz/2>height || sz<=0) {
      return true;
    } else {
      //if bullet doesn't go past height of screen, it isn't dead
      return false;
    }
  }
}

