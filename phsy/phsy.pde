ArrayList snakes = new ArrayList();
// Amount of segments
int segAmount = 20;
// Length of segment
float segLength = 5;
// Amount of snakes we want. (360/d)
float d = 15;
 
void setup() {
  size(640, 640);
  strokeWeight(3);
  float t = 1;
  for (int i = 0; i < 360; i+=d) {
    // Angle, Velocity direction
    snakes.add(new Snake(i+d/2, t*=-1));
  }
}
 
void draw() {
  background(20);
  for (int i = 0; i < snakes.size(); i++) {
    Snake s = (Snake) snakes.get(i);
    s.draw();
    s.move();
  }
}
 
class Snake {
  PVector[] pos = new PVector[segAmount];
  PVector loc;
 
  float index, d;
 
  Snake(float ind, float dir) {
    loc = new PVector(width/2, height/2);
    index = ind;
    d = dir;
    for (int i = 0; i < segAmount; i++) {
      pos[i] = new PVector(i, i);
    }
  }
 
  void draw() {
    dragSegment(0, loc);
    for (int i = 0; i < pos.length-1; i++) {
      dragSegment(i+1, pos[i]);
    }
  }
 
  void move() {
    float a = sin(radians((frameCount*d)*6))*120;
    // Set velocity here as it does not need to be accessed outside the object function
    PVector vel = new PVector(sin(radians((frameCount*d)+a+index))*5, cos(radians((frameCount*d)+a+index))*5);
    loc.add(vel);
  }
 
  void dragSegment(int i, PVector loc) {
    float angle = atan2(loc.y - pos[i].y, loc.x - pos[i].x);
    pos[i].x = loc.x - cos(angle) * segLength;
    pos[i].y = loc.y - sin(angle) * segLength;
 
    pushMatrix();
    translate(pos[i].x, pos[i].y);
    rotate(atan2(loc.y - pos[i].y, loc.x - pos[i].x));
    // Change red and green but leave blue 125
    stroke(125+sin(radians(i*10+frameCount))*125, 125+cos(radians(i*10-frameCount))*125, 125);
    line(0, 0, segLength, 0);
    popMatrix();
  }
}