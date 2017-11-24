import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class img_img extends PApplet {

int maxImages = 100;
int imageIndex = 1;
PImage[] images = new PImage[maxImages];
int imageWidth = 60;
int imageHeight = 60;

public void setup(){
  
  for(int i = imageIndex; i < images.length; i++) {
   images[i] = loadImage("img/"+i + ".jpg");
 }
}

public void draw(){
  background(255, 251, 249);
  translate(width / 2, height / 2);
  float intervalX = map(mouseX, 0, width, 40, -40);
  float intervalY = map(abs(mouseX - width / 2), 0, width / 2, 0, -20);

  for(int i = maxImages-1; i > 0; i--){
    pushMatrix();
    float rhytm = map(pow(abs(sin(frameCount * 0.03f - i * 0.1f)), 50), 0, 1, 0, -100);
                //* map(abs(mouseX - width / 2), 0, width / 2, 0, 1);
    translate(intervalX * (i - maxImages / 2.0f), intervalY * (i - maxImages / 2.0f) + rhytm);
    beginShape();
    image(images[i],-60,-60);
    images[i].resize(0,100);
    endShape(CLOSE);
    popMatrix();
  }
}
  public void settings() {  size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "img_img" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
