
void setup(){
 size(600,400); 
}

void draw(){
}

void mousePressed (){
 fill(255,0,0);
 ellipse(mouseX,mouseY,8,8);
  
}

void mouseDragged (){

 line(mouseX,mouseY,pmouseX,pmouseY);
 
}