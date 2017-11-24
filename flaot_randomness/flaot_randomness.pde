float x;
float y;

void setup() {
  size(600, 600);
}

void draw() {
  translate(width/2, height/2);
  x = x + random(-5, 5);
  y += random(-5, 5);
  ellipse(x, y, 1, 1);
}