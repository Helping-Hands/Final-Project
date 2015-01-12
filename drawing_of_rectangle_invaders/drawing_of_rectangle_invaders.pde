ArrayList<Enemy> gridOfEnemies= new ArrayList<Enemy>();
 int rows=5;
 int columns=10;
void setup(){
  size(800,600);
  for(int i=0; i<50; i++){
    float r=random(1);
    if(r>.5){
      gridOfEnemies.add(new Enemy(10+x*10,10+y*10));
    } else {
      gridOfEnemies.add(new Enemy(random(width),random(height/2)));
    }
  }
   for(int x=0;x<columns;x++){
    for(int y=0;y<rows;y++){
      gridOfEnemies.add(new Enemy((width/columns)*.5+x*width/columns, 25+y *50));
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
  }
  void display(){
    ellipse(loc.x,loc.y,sz,sz);
  }
}


