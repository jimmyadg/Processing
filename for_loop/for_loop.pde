int counter = 0;

void setup () {
  size(600, 600);
}

void draw () {
  background(255);
  for (int i = 0; i < 255; i++) {
    line(i*20, 20+counter, i*20, counter-20);
  }
  counter+= 5;
  if (counter >= height) {
    counter = 0;
  }
}