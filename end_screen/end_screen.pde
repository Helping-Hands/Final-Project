int count =75;
PFont font;
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];
PVector[] acc = new PVector[count];
float[] sz = new float[count];
float spin = 0.0;
void setup() {
  size(displayWidth, displayHeight, P3D);
  background(0);
  textMode(CENTER);
  font=loadFont("Txt_IV50-48.vlw");
  for (int i = 0; i < count; i++) {  
    sz[i] = random(0, 5);         
    loc[i] = new PVector(random(sz[i], width-sz[i]), random(sz[i], height-sz[i])); 
    vel[i] = new PVector(0,random(0,5));       
    acc[i] = new PVector(0, 0);
   
  }
}

void draw() {
  background(0);
 noStroke();
   
pushMatrix();

  translate(width/2, height/2-300, 0);
  spin +=0.009;
  rotateX(PI/10);
  rotateY(PI/20 + spin);
  textFont(font, 22);
  fill(0, 80, 85);
  textSize(150);
  noStroke();
  text("GAME OVER", 200, 125);
  textSize(65);
  text("THE END ", 268, 220);
noStroke();
popMatrix();


fill(0,0,20,20);
rect(0,0,width,height);
for (int i = 0; i < count; i++) {  

    vel[i].add(acc[i]);
    loc[i].add(vel[i]);


    for (int j = 0; j < count; j++) {
      if (i!=j) {
        if (loc[i].dist(loc[j]) < sz[i]/2 + sz[j]/2) {
          if (loc[i].x < loc[j].x) {   
            vel[i].x = -abs(vel[i].x);
            vel[j].x = abs(vel[j].x);
          } else {
            vel[i].x = abs(vel[i].x);
            vel[j].x = -abs(vel[j].x);
          }
          if (loc[i].y < loc[j].y) {   
            vel[i].y = -abs(vel[i].y);
            vel[j].y = abs(vel[j].y);
          } else {
            vel[i].y = abs(vel[i].y);
            vel[j].y = -abs(vel[j].y);
          }
        }
      }
    }
    fill(255,255,255,random(50,75 ));
    ellipse(loc[i].x, loc[i].y, sz[i], sz[i]);

    if (loc[i].x + sz[i]/2 > width || loc[i].x - sz[i]/2 < 0) {
      vel[i].x *= -1;
    }
    if (loc[i].y + sz[i]/2 > height || loc[i].y - sz[i]/2 < 0) {
      vel[i].y *= -1;
    }
  }
}

void mouseReleased() {
  loc[0].set(mouseX, mouseY);



}
  
