int counter = 0;


void setup () {
  size(600, 400);

}


void draw () {
 background(0);
 int changeX = abs(mouseX - pmouseX);
 int changeY = abs(mouseY - pmouseY);
 
 stroke(255);
 strokeWeight(changeX);
 line(mouseX, mouseY, pmouseX, pmouseY);
}