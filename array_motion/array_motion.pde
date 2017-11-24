int[] x = new int[40];
int[] y = new int[40];

void setup() {
  size(500, 500);
    background(0);
}

void draw() {

  for (int i = 0; i < 40-1; i++) {
    strokeWeight(i);
    stroke(255);
    line(x[i], y[i], x[1+1], y[i+1]);
    x[i] = x[i+1];
    y[i] = y[i+1];
  }
}