float[] randomColorX = new float[width];
float[] randomColorY = new float[height];
float x;
float y;
int w;
int h;
float speedX;
float speedY;

void setup() {
  size(600, 600);
  startSetting();
}

void draw() {
  noStroke();
  background(0);
  ellipse(x, y, w, h);

  motion();
  colors();
}