////////////////////////shooter/player/////////////////////////

class Shooter {
  //declare variables
  int h;
  int x;
  int y;
  int w1, w2, w3;


  Shooter() {
    //intialize variables and location

    h =30;
    x=width/2;
    y=height-50;
    w1 = 200;
    w2 = 75;
    w3 = 50;
  }


  void display() {
    //insert block of shooter (player)
    fill(250);
    noStroke();
    //bottom
    rect(x, y, w1, h);
    //middle
    rect(x, y-h, w2, h);
    //top
    rect (x, y-2*h, w3, h);
  }
  
  void stayOnScreen(){
    if(x+h>=width){
      x=width-w1;
    }
    if(x+h<=0){
      x=0+w1;
    }
  }

  void aim() {
    //aims shooter, moves about 5
    //moves left if left arrow key is pressed
    //moves right if right arrow key is pressed
    if (keyPressed )
      if (keyCode== LEFT) {
        x-= 10;
      } else if (keyCode==RIGHT) {
        x+=10;
      }
  }
}

//void dies(){
//  if(gridOfEnemies
