class Water {
  int size;
  PVector vel;
  PVector loc;
  PVector acc;
  float damping = 0.01;


  Water(float x, float y) {
    vel = new PVector(random(10,20), random(10,20));
    loc = new PVector(random(10,width-10),random(10,width-100));
    acc = new PVector(0, 0);
    damping = random(0.001,0.1);
    size = 30;
    
  }

  void update() {
    vel.add(acc);       // add the acceleration to the velocity
    loc.add(vel);       // add the velocity to the location
    checkBounds();      // check if we are out of bounds
    acc.mult(0);        // reset the acceleration each time
  }

  void draw() {
    noStroke();
    fill(0,0,255);
    ellipse(loc.x, loc.y, size, size);
  }

  void addForce(PVector f) {
    acc.add(f);
  }

  void checkBounds() {
    // to reverse the direction, we multiply the current velocity by -1
    if (loc.x > width) {
      loc.x = width;
      vel.x = vel.x * -0.2;
    } else if (loc.x < 0) {
      loc.x = 0;
      vel.x = vel.x * -0.1;
    }
    if (loc.y > height ) {
      loc.y = height-size;
      vel.y = vel.y * -0.4;
    } else if (loc.y < 0 ) {
      loc.y = 20;
      vel.y = vel.y * -0.8;
    }
  }
  void collisionCheck(Water other){
   float dist = dist(loc.x, loc.y, other.loc.x, other.loc.y);
   if(dist < size-10){
   vel.x *= -0.5;
   }
  }
  
}