//declare integers x,y,sz,xspeed,yspeed,leftX,leftY,rightX,rightY,paddleHeight,paddleWidth,text1,text2,ballColor
int x;
int y;
int sz;
int xspeed=2;
int yspeed=2;
int leftX;
int leftY;
int rightX;
int rightY;
int paddleHeight=100;
int paddleWidth=20;
int text1=0;
int text2=0;
color ballColor;
//size, declare x,y,sz value
void setup() {
  size(800, 600);
  x=width/2;
  y=height/2;
  sz=10;
//declare right paddle width, height value
  rightY=0;
  rightX=760;
//declare ballColor value
ballColor = color(255);
}
void draw() {
  background(0);
  //ball
  fill(ballColor);
  ellipse(x, y, sz, sz);
  //declare speed value
  x+=xspeed;
  y+=yspeed;
  //ball bounce
  if (y+sz/2>=height || y-sz/2<=0) {
    yspeed*=-1;
  }
  //declare left paddle width, height value
  leftY=mouseY-paddleHeight/2;
  leftX=20;
  //left paddle
  fill(255,0,0);
  rect(leftX, leftY, paddleWidth, paddleHeight);
  //ball bounce off left paddle
  if (x>leftX && x-sz/2<leftX + paddleWidth && y>leftY && y<leftY+paddleHeight)
  { 
  //make ball switch directions
    xspeed=abs(xspeed);
 //make ball turn color of paddle
ballColor = color(255,0,0);
  }
  //right paddle
  fill(0,0,255);
  rect(rightX, rightY, paddleWidth, paddleHeight);
  //move right paddle UP/DOWN with keys
  if (keyPressed) {
    if (keyCode==UP) {
      rightY-=10;
    }
    if (keyCode==DOWN) {
      rightY+=10;
    }
  }
 //right paddle doesn't move below screen
  if(rightY<=0){
    rightY=0;
  }
 //right paddle doesn't move above screen
  if(rightY+paddleHeight>=height){
    rightY=height-paddleHeight;
  }
  //ball bounce off right paddle
  if (x+sz/2 >= rightX && y >= rightY && y <= rightY + paddleHeight)
  {
 //make ball switch directions
    xspeed=-abs(xspeed);
 //make ball turn color of paddle
ballColor=color(0,0,255);
  }
  //check if ball touches right wall, restart at center
  if (x+sz/2>=width) {
    x=width/2;
    y=height/2;
    //increase left paddle score
    text2++;
    //reset ball color
    ballColor = (255);
    fill(255,0,0);
 //indicate left paddle player scored
    text("SCORE!",width/2-70,height/2);
  }
  //check if ball touches left wall, restart at center
  if (x-sz/2<=0) {
    x=width/2;
    y=height/2;
    //increase right paddle score
    text1++;
    //reset ball color
    ballColor = (255);
//indicate right paddle player scored
    text("SCORE!",width/2-70,height/2);
  }
//left paddle score
fill(255,0,0);
//left paddle = player 1
text("PLAYER 1",50,50);
textSize(50);
text(text2, 50, 100);
//right paddle score
fill(0,0,255);
//right paddle = player 2
text("PLAYER 2", 500, 50);
text(text1,693,100);

}

