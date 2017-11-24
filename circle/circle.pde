Planet[] planets;
int amt = 150; //Amount of Planets
 
void reset() {
  for(int i = 0; i < amt; i++) {
    planets[i] = new Planet(random(-50, 50), random(-50, 50));
  }
}
 
void setup() {
  size(600, 600);
  frameRate(60);
  colorMode(HSB);
  strokeWeight(10);
  smooth();
   
  planets = new Planet[amt];
   
  for(int i = 0; i < amt; i++) {
    planets[i] = new Planet(random(-70, 70), random(-70, 70));
  }
}
 
class Planet {
  float currentX, currentY, a, i, co, sz;
  Planet(float cX, float cY) {
    currentX = cX;
    currentY = cY;
    a = 0;
    i = random(0.005, 0.05);
    co = random(0, 30);
    sz = map(currentX, -50, 50, 1, 30);
  }
  void orbit() {
    float targetX = lerp(currentX, mouseX, 0.25);
    float targetY = lerp(currentY, mouseY, 0.25);
     
    stroke(co, 150, 255);
    strokeWeight(sz);
     
    pushMatrix();
    rotate(a);
    point(targetX, targetY);
    popMatrix();
     
    a += i;
  }
   
}
 
void draw() {
  background(255);
  translate(width/2, height/2);
   
  for(int i = 0; i < amt; i++) {
    planets[i].orbit();
  }
}
 
void keyPressed() {
  reset();
}