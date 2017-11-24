float [] randomness = new float[width];

void setup () {
  size(500, 500);
}

void draw () {
  noLoop();
  noStroke();
  fill(randomness[0]);
  for (int i =0; i < randomness.length; i++) {
    randomness[i] = random(0, 255); 
    float c = randomness[i];
    fill(c);
    rect(i*5, 0, 5, height);
  }
}