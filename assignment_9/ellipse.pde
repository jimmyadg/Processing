class createMotion {
  float radius;
  float angle;
  float x;
  float y;
  float r;
  float g;
  float b;


  createMotion() {
    angle = 0;
    radius = 5;
    r = random(255);
    g = random(255);
    b = random(255);
  }

  void update() {

    angle += .02;
    radius += 0.04;
    x = radius * cos(angle);
    y = radius * sin(angle);
  }

  void draw() {
    ellipseMode(CENTER);
    noStroke();
    fill(r, g, b);
    ellipse(x, y, 5, 5);
  }
}