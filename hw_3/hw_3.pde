int[] c = {#FF0000, #00FF00, #0000FF};
int colorIndex = 0;
int x;
int y;
int w;
int h;
int speedX;
int speedY;

void setup() {
  size(500, 500);
  background(0);
  x = width/2;
  y = height/2;
  w = 50;
  h = 50;
  speedX = 4;
  speedY = 2;
}

void draw() {
  background(0);
  fill(c[colorIndex]);
  ellipse(x, y, w, h);

  if (x > width-w/2 || x < 0+w/2) {
    speedX = -speedX;
  }

  if (y > height-h/2 || y < 0+h/2) {
    speedY = -speedY;
  }
  x = x + speedX;
  y = y + speedY;

  if (y > height-h/2 || y < 0+h/2) {
    if (colorIndex < c.length-1) {
      colorIndex++;  
    } else {
      colorIndex = 0; 
    }
    println(colorIndex);
  }

  if (x > width-w/2 || x < 0+w/2) {
    if (colorIndex < c.length-1) {
      colorIndex++;  
    } else {
      colorIndex = 0; 
    }
    println(colorIndex);
  }
}