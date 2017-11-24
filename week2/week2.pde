
void setup() {
  size(600, 400); 
  background(255);
}

void draw() {
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void mousePressed () {
  fill( random(255), random(255), random(255), random(255)); 
}

void mouseDragged () {
  int changeX = abs(mouseX - pmouseX);
  int changeY = abs(mouseY - pmouseY);
  stroke( random(255), random(255), random(255), random(255)); 
  strokeWeight(changeX);
  line(mouseX, mouseY, pmouseX, pmouseY);
}