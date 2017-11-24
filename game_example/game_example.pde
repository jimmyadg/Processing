int enemyX;
int enemyY;
int collisionDistance = 30;
int speed;
int score = 0;
boolean isGameOver = false;


void setup() {
  size(800, 600);
  resetEnemy();
}

void draw () {
  background(0);
  
  if (isGameOver) {
    noStroke();
    fill(255, 0, 0);
    rect(0, 0, width, height);
    print(score);
    return;
  }

  drawPlayerShip(mouseX, mouseY);
  
  for(int i = 0; i < numberOfEnemy; i++){
  drawEnemyShip(enemyX, enemyY);
  enemyX -= speed;
  }
  if (enemyX < 0) {
    enemyY = width;
    resetEnemy();
  }
  isCollision(mouseX,mouseY,enemyX,enemyY);
}

void resetEnemy() {
  enemyX = width;
  enemyY = getEnemyYPos();
}

int getEnemyYPos() {
  return (int)random(0, height);
}


//draw player character
void drawPlayerShip(int x, int y) {
  noFill();
  strokeWeight(5);
  stroke(33, 255, 215);
  ellipse(x, y, 20, 20);
}

//draw enemy character
void drawEnemyShip(int x, int y) {
  strokeWeight(5);
  stroke(0, 0, 255);
  //rect(x, y, collisionDistance, collisionDistance);
  line(x-collisionDistance, y-collisionDistance, x+collisionDistance, y+collisionDistance);
  line(x+collisionDistance, y-collisionDistance, x-collisionDistance, y+collisionDistance);
}

void isCollision(int x1, int y1, int x2, int y2) {
  int distance = (int)dist(x1,y1,x2,y2);
  int c = (int)map(distance,0,width,0,255);
  stroke(255-c,0,0);
  line(x1,y1,x2,y2);
  
 
  if (distance < collisionDistance) {
    isGameOver = true;
    score = frameCount;
  }
}