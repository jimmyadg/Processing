ImageBox[] boxImages;
int maxImages = 100;
int imageIndex = 1;
int imageWidth = 60;
int imageHeight = 60;

void setup(){
  size(640, 480);
  for(int i = imageIndex; i < boxImages.length; i++) {
   boxImages[i] = loadImage("img/"+i + ".jpg");
 }
}

void draw(){
  background(255, 251, 249);
  translate(width / 2, height / 2);
  float intervalX = map(mouseX, 0, width, 40, -40);
  float intervalY = map(abs(mouseX - width / 2), 0, width / 2, 0, -20);

  for(int i = maxImages-1; i > 0; i--){
    pushMatrix();
    float rhytm = map(pow(abs(sin(frameCount * 0.03 - i * 0.1)), 50), 0, 1, 0, -100);
                //* map(abs(mouseX - width / 2), 0, width / 2, 0, 1);
    translate(intervalX * (i - maxImages / 2.0), intervalY * (i - maxImages / 2.0) + rhytm);
    beginShape();
    image(images[i],-60,-60);
    images[i].resize(0,100);
    endShape(CLOSE);
    popMatrix();
  }
}