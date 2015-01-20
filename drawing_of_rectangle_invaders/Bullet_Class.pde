/////////////////////////////////class bullet////////////////////////////
class Bullet {
  //declare variables
  PVector loc;
 
  int vel;

 int sz;
  Bullet(Shooter ship) {
    //intialize variables and location
    loc=new PVector(ship.x,ship.y);
    
    vel=10;
   
    sz=5;
  }

  void display() {
    fill(250);
    //display bullet, but have bullet start inside of shooter
    ellipse(loc.x,loc.y, sz, sz);
  }


  void move() {
    //bullet is moved toward invaders after it is released

    loc.y-=vel;
  }
  boolean isDead(){
    //how to tell if bullet is dead
    if(loc.y-sz/2>height || sz<=0){
      return true;
    } else {
      return false;
    }
  } 
 
}
