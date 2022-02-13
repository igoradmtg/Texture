PImage img;
PImage imgbg;
int num = 20;
float a = 0;
float offset_div = 18.0;         // Делитель
float offset = PI / offset_div;  // Angle offset between boxes
float k_a = 0.5; // Коэффициент
int zbg = -400;
int zbg_c = 1;
void setup() {
  size(600, 600, P3D);
  //noFill();
  noStroke();
  img = loadImage("texture2.jpg");
  imgbg = loadImage("texture3.jpg");
  background(255);
  textureMode(NORMAL);
}

//noStroke();
//PImage img = loadImage("texture.jpg");
//textureMode(NORMAL); 
//beginShape();
//texture(img);
//vertex(40, 80, 0, 0);
//vertex(320, 20, 1, 0);
//vertex(380, 360, 1, 1);
//vertex(160, 380, 0, 1);
//endShape();

void draw() {
  background(255);
  pushMatrix();
  translate(-400, -400);
  beginShape();
  texture(imgbg);
  vertex(0,     0, zbg, 0, 0);
  vertex(0,   5760, zbg, 1, 0);
  vertex(3840, 5760, zbg, 1, 1);
  vertex(3840,   0, zbg, 0, 1);
  endShape(CLOSE);
  popMatrix();
  zbg += zbg_c;
  if (zbg>-100) {
    zbg_c = -1;
  }
  if (zbg<-600) {
    zbg_c = 1;
  }
  translate(width/2, height/2);
  for(int i = 0; i<num; i++) {
    pushMatrix();
    //rotateX(frameCount*0.02);
    //rotateZ(frameCount*0.02);
    rotateY(a + offset * i);
    rotateX(a*k_a + offset * i);
    //box(200);
    drawBoxVertices(100);
    popMatrix();
  }
  a += 0.005;
  saveFrame("img/####.png");
}

void drawBoxVertices(float boxSize) {
  //strokeWeight(1);
  //strokeWeight(25);
  pushMatrix();
  //scale(hbz);
  
  beginShape();
  texture(img);
  vertex( -1 * boxSize, -1 * boxSize, 1 * boxSize,0,0);
  vertex(  1 * boxSize, -1 * boxSize, 1 * boxSize,1,0);
  vertex(  1 * boxSize,  1 * boxSize, 1 * boxSize,1,1);
  vertex( -1 * boxSize,  1 * boxSize, 1 * boxSize,0,1);
  endShape(CLOSE);
  
  beginShape();
  texture(img);
  vertex( -1 * boxSize, -1 * boxSize, -1 * boxSize,0,0);
  vertex(  1 * boxSize, -1 * boxSize, -1 * boxSize,1,0);
  vertex(  1 * boxSize,  1 * boxSize, -1 * boxSize,1,1);
  vertex( -1 * boxSize,  1 * boxSize, -1 * boxSize,0,1);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(  1 * boxSize, -1 * boxSize, -1 * boxSize,0,0);
  vertex(  1 * boxSize, -1 * boxSize, 1 * boxSize,1,0);
  vertex(  1 * boxSize,  1 * boxSize, 1 * boxSize,1,1);
  vertex(  1 * boxSize,  1 * boxSize, -1 * boxSize,0,1);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex( -1 * boxSize, -1 * boxSize, -1 * boxSize,0,0);
  vertex( -1 * boxSize, -1 * boxSize, 1 * boxSize,1,0);
  vertex( -1 * boxSize,  1 * boxSize, 1 * boxSize,1,1);
  vertex( -1 * boxSize,  1 * boxSize, -1 * boxSize,0,1);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex( -1 * boxSize,  1 * boxSize, -1 * boxSize,0,0);
  vertex( -1 * boxSize,  1 * boxSize,  1 * boxSize,1,0);
  vertex(  1 * boxSize,  1 * boxSize,  1 * boxSize,1,1);
  vertex(  1 * boxSize,  1 * boxSize, -1 * boxSize,0,1);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex( -1 * boxSize,  -1 * boxSize, -1 * boxSize,0,0);
  vertex( -1 * boxSize,  -1 * boxSize,  1 * boxSize,1,0);
  vertex(  1 * boxSize,  -1 * boxSize,  1 * boxSize,1,1);
  vertex(  1 * boxSize,  -1 * boxSize, -1 * boxSize,0,1);
  endShape(CLOSE);

  popMatrix();
  
  //
}
