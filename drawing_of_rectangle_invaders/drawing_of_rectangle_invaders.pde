ArrayList<Enemy> gridOfEnemies= new ArrayList<Enemy>();
 int rows=5;
 int columns=10;
void setup(){
  size(800,600);
  for(int i=0; i<50; i++){
    float r=random(1);
    if(r>.5){
      gridOfEnemies.add(new SquareEnemy(random(width),random(height/2)));
    }
    if(r>.33){
      gridOfEnemies.add(new RoundEnemy(random(width),random(height/2)));
    }
    if(r<.5){
      gridOfEnemies.add(new TriEnemy(random(width),random(height/2)));
  }
   for(int x=0;x<columns;x++){
    for(int y=0;y<rows;y++){
      gridOfEnemies.add(new Enemy(10+x*10,10+y*10));
    }
  }
}
}
void draw(){
  background(0);
  for (int i=0; i< gridOfEnemies.size(); i++){
    Enemy e=gridOfEnemies.get(i);
    e.display();
    e.move();
  }
}



class Enemy{
  PVector loc;
  float sz;
  boolean square;
  boolean circle;
  boolean triangle;
  
  Enemy(float x, float y){
    loc = new PVector(x,y);
    sz=20;
  }
  
  void display(){
  }
  
  void move(){
    if(frameCount%60==0){
      loc.x+=sz;
    }
    if(loc.x>width){
      loc.x=0;
      loc.y+=sz;
    }
  }
}

class SquareEnemy extends Enemy{
  
  SquareEnemy(float x, float y){
    super(x,y);
    square=true;
    circle=false;
    triangle=false;
  }
  
  void display(){
    rectMode(CENTER);
    rect(loc.x,loc.y,sz,sz);
  }
}

class RoundEnemy extends Enemy {
  RoundEnemy(float x,float y){
    super(x,y);
    circle=true;
    square=false;
    triangle=false;
  }
  void display(){
    ellipse(loc.x,loc.y,sz,sz);
  }
}

class TriEnemy extends Enemy {
  TriEnemy(float x,float y){
    super(x,y);
    circle=false;
    square=false;
    triangle=true;
  }
  
  void display(){
    triangle(loc.x,loc.y-sz/2,loc.x-sz/2,loc.y+sz/2,loc.x+sz/2,loc.y+sz/2);
  }
}

