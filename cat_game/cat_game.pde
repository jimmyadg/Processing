// enemy position
int enemyX;                 
int enemyY;
PImage img;

// game state
boolean gameOver = false;
int score;

// difficulty
int speed = 30;
int collisionDistance = 30; 


void setup(){
  // setup the size and state of tools we'll use later (cursor, text)
  size(1200,800);
  textSize(40);
  noCursor();  
  img = loadImage("cat-move.gif");
  
  // set the enemy to be at the edge of the screen at a random y coordinate  
  enemyX = width;
  enemyY = getRandomYPosition();

}

void draw(){
  background(0);
  // draw the game over screen if the player lost
  if (gameOver){
    fill(255,0,0);
    rect(0,0,width,height);
    fill(255);
    text("GAME OVER!",width/3,height/2); 
    text("Your score is " + score,width/3.5,height/1.5);
  }
  else {
    // draw the player and enemy
    drawPlayerShip(mouseX,mouseY);
    drawEnemyShip(enemyX, enemyY);
    
    // update the enemy position
    enemyX -= speed;
    if (enemyX < 0) {
      enemyX = width;
      enemyY = getRandomYPosition();
    }
    
    // perform collision detection to determine if game is over
    if (shipsCollided(mouseX,mouseY,enemyX,enemyY)){
      gameOver = true;
      score = frameCount;
    }
  }
}

// draw the enemy
void drawEnemyShip(int x, int y) {
  strokeWeight(5);
  stroke(252, 53, 63);
  line(x-collisionDistance, y-collisionDistance, x+collisionDistance, y+collisionDistance);
  line(x+collisionDistance, y-collisionDistance, x-collisionDistance, y+collisionDistance);
}

// draw the player
void drawPlayerShip(int x, int y) {
  image(img, x-50, y-50);
  
}

// checks if two positions are x distance apart
boolean shipsCollided(int x1, int y1, int x2, int y2) {
  float dist = dist(x1, y1, x2, y2);
  drawDistance(dist,x1, y1, x2, y2);
  if (dist <= collisionDistance) {
    return true;
  } else {
    return false;
  }
}

// returns a random number for the enemy y position
int getRandomYPosition(){
  return (int)random(0,height);
}  


void drawDistance(float dist, int x1, int y1, int x2, int y2){
  float redAmount    = map(dist, collisionDistance, collisionDistance*20, 255,0);
  float dangerAmount = map(dist, collisionDistance, collisionDistance*10, 255,0);
  strokeWeight(1);
  stroke(redAmount,0,0);
  line(x1, y1, x2, y2);
  if (dist < collisionDistance * 10){
     fill(255,0,0,dangerAmount);
     text("DANGER!",width/2-100,height/2);
  }
}