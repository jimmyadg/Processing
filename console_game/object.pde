int x;
int y;
int r = (int)(random(255));
int g = (int)(random(255));
int b = (int)(random(255));
int[] enemyX = new int[enemyNum];
int[] enemyY = new int[enemyNum];
float sizeX = 10;
float sizeY = 10;
float enemySpeed = 2;


void drawCharacter(int x, int y) {
  noStroke();
  fill(255);
  ellipse(x, y, 20, 20);
  fill(0);
  ellipse(x, y, 10, 10);
}


void drawEnemy(int x, int y) {
  noStroke();
  fill(r, g, b);
  rect(x, y, sizeX, sizeY);
}

void setGoal(int x, int y ) {
  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  ellipse(x, y, 40, 40);
}

void resetEnemy() {
  for ( int i = 0; i < enemyNum; i ++) {
    resetEnemyPos(i);
  }
}

void resetEnemyPos(int j) {
  r = (int)(random(255));
  g = (int)(random(255));
  b = (int)(random(255));
  enemyX[j] = (int)random(0, width);
  enemyY[j] = 0;
  enemySpeed = 1+v*0.2;
  sizeX = random(10, v*1.5);
  sizeY = random(10, v*1.5);
}


void reset() {
  v = 0;
  caseState = 0;
  x = width/2;
  y = width/2;
  charName = "";
  resetEnemy();
}