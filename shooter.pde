int sz=30;
int x=700;
int y=50;
int movingX;
void setup(){
size (displayWidth, displayHeight);
}
void draw(){
  background (0);
 noStroke();
 rect(movingX/2-55.6,x-30,y,sz);
rect (movingX/2-75, x,y*1.75,sz);
rect(movingX/2-100,x+30,y*2.75,sz);


if(keyPressed )
  if (keyCode== LEFT){
    movingX-= 10;
   
  }
  
  if(keyCode==RIGHT){
    movingX+=10;
  }
}


