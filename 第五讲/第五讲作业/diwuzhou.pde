int textureRes = 32;
float[] textureX = new float[textureRes];
float[] textureY = new float[textureRes];

PImage img;

void setup() {
  size(800, 800, P3D);
  background(0);
  img = loadImage("kkk.jpg");
  float angle = 372.0 / textureRes;
  for (int i = 0; i < textureRes; i++) {
    textureX[i] = cos(radians(i * angle));
    textureY[i] = sin(radians(i * angle));
  }
}

void draw() {
  background(0);
  img.loadPixels();
  translate(width/2, height/2, mouseX);
  rotateX(map(mouseY, 0, height, -PI, PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  beginShape(TRIANGLE_STRIP);
  texture(img);
  for (int j=0; j<textureRes; j++) {
    for (int i = 0; i < textureRes; i++) {
      int x1=i*img.width/textureRes;
      int y1=j*img.height/textureRes;
      int loc=x1+y1*img.width;
      float x = textureX[i] * textureRes;
      float z = textureY[i] * textureRes+brightness(img.pixels[loc]);
      float u = img.width / textureRes * i;
      float v = img.height / textureRes * j;
      vertex(x, j, z, u, v);
      vertex(x, j+1, z, u, v);
    }
  }
  endShape();
}
