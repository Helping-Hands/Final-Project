int dim;
int value = 0;
void setup() {
  size(displayWidth, displayHeight);
  dim = width/2;
  background(0);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  frameRate(1);
  textMode (CENTER);
}

void draw() {
  background(0);
  for (int x = 0; x <= width; x+=dim) {
    drawGradient(x, height/2);
  } 
}

void drawGradient(float x, float y) {

  float h = random(0, 360);


    fill(h, 90, 90);
    textSize (200);
    text("GREAT JOB",225,410);
    h = (h + 1) % 360;
    textSize (60);
    text ("CLICK HERE TO PROCEED TO THE NEXT LEVEL", 75,490);
  }
void mouseClicked () {
  if (value ==0 ){
    value = 255;
  } else {
    value = 0 ;
  }
}

