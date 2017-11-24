ArrayList motions = new ArrayList();
long prevTime = 0;
int interval = 10000;

void setup() {
  size(800, 800);
  background(0);
  createMotion motion= new createMotion();
      motions.add(motion);
}


void draw() {
  long currentTime = millis();
  translate(width/2, height/2);
  if (currentTime - prevTime >= interval) {
    prevTime = currentTime;
    for (int i =0; i < 100; i++) {
      createMotion motion= new createMotion();
      motions.add(motion);
    }
  }




  for ( int i =0; i < motions.size(); i++) {
    createMotion motion = (createMotion)motions.get(i);
    motion.update();
    motion.draw();
  }
 print("Gap = \t");
 print(currentTime - prevTime);
 println();
}