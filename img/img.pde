int maxImages = 19;
int imageIndex = 0;

//declaring
PImage[] images = new PImage[maxImages];

int xnum = 8;
int ynum = 8;
int imageWidth = 60;
int imageHeight = 60;

void setup(){
  size(640, 480);
  
  for(int i = 0; i < images.length; i++) {
   images[i] = loadImage(i + ".jpg");
 }
}

void draw(){
  background(255, 251, 249);
  translate(width / 2, height / 2);
  int num = 19;
  float intervalX = map(mouseX, 0, width, 40, -40);
  float intervalY = map(abs(mouseX - width / 2), 0, width / 2, 0, -20);

  for(int i = num - 1; i > 0; i--){
    pushMatrix();
    float rhytm = map(pow(abs(sin(frameCount * 0.03 - i * 0.3)), 50), 0, 1, 0, -50)
                * map(abs(mouseX - width / 2), 0, width / 2, 0, 1);
    translate(intervalX * (i - num / 2.0), intervalY * (i - num / 2.0) + rhytm);

    beginShape();
    image(images[i],-60,-60);
    images[i].resize(0,100);

    endShape(CLOSE);
    popMatrix();
  }
}