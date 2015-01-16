class Bullet{
float shoot;
int vel;
  Bullet(){
shoot=685;
vel=10;
  }
  void display(){
    ellipse(movingX/2-55.6/2,shoot,5,5);
  }
  
  void move(){
      if(key==' '){
        shoot-=vel;
    }
  }
}
