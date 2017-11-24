Water[] water = new Water[1000];

void setup() {
  size(600, 600);
  for (int i = 0; i < 1000; i++) {
   water[i] = new Water(random(20,width-20),random(20,width-20));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < 1000; i++) {
    for(int j =0; j < 1000; j++){
     if(j != i){
     water[i].collisionCheck(water[j]);
     }
    }
    Water w = water[i];
    PVector gravity  = new PVector(0, 0.6);
    PVector friction = w.vel.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(w.damping);
    w.addForce(gravity);
    w.addForce(friction);
    w.update();
    w.draw();
  }
}

void mouseDragged(){
  for (int i = 0; i < 1000; i++) {
  Water w = water[i];
      w.loc.y =(random(mouseY,height));
      w.vel.y *= -0.9;
  }
}