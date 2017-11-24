

int enemyX;
int enemyY;
PImage catCharacter;
PImage catLyfe;
PImage enemyCharacter;
int lifeCount = 100;
boolean gameOver = false;
int caseState = 0;
int speed = 10;
int collisionDistance = 50;
int score = 0;
int numberOfStars = 200;
Star[] stars = new Star[numberOfStars];


void setup() {
  size(1200, 800);
  textSize(30);
  noCursor();
  catCharacter = loadImage("cat-move.png");
  enemyCharacter = loadImage("rat.png");
  catLyfe = loadImage("cat.png");
  enemyX = width;
  enemyY = getRandomYPosition();
  
  //background animation
   for (int i = 0; i < numberOfStars; i++){
      stars[i] = new Star(); 
   }
   
}

void draw() {
  background(0);
   for (int i = 0; i < numberOfStars; i++){
     stars[i].update();
     stars[i].draw();
  }
  switch(caseState) {
  //start and gameover page
    case 0 :
    fill(255);
    if (gameOver == true) {
      text("GAME OVER!", width/2.4, height/2);
      text("Score: " + score, width/2.3, height/1.7);
      text("PRESS ENTER TO START", width/2.9, height/1.5);
    } else {
      text("PRESS ENTER TO START", width/2.7, height/2);
    }
    if (keyCode == ENTER) {
      if (gameOver == true)resetGame();
      caseState = 1;
     
    }
    break;
    
//start game
  case 1:
    keyCode = 0;
    noFill();
    strokeWeight(3);
    stroke(255);
    rect(200,100,100,18);
   strokeWeight(1);
   stroke(255,0,0);
    fill(255,0,0);
    rectMode(CORNER);
    rect(200,100, lifeCount, 17);
     text(lifeCount, 200, 90);
     fill(255);
     text("score: " + score, 1000, 730);

    drawPlayerShip(mouseX, mouseY);
    drawEnemyShip(enemyX, enemyY);
    enemyX -= speed + score/2;
    
    if (enemyX < 0) {
      enemyX = width;
      score += 1;
      enemyY = getRandomYPosition();
    }
    image(catLyfe, 120,70);
    
    
    if (shipsCollided(mouseX, mouseY, enemyX, enemyY)) {
      lifeCount -= 5;
      if (lifeCount == 0) {
      gameOver = true;
      caseState = 0;
      }
    }
    break;
  }
}



//draw enemies
void drawEnemyShip(int x, int y) {
  noFill();
  noStroke();
  line(x-collisionDistance, y-collisionDistance, x+collisionDistance, y+collisionDistance);
  line(x+collisionDistance, y-collisionDistance, x-collisionDistance, y+collisionDistance);
  image(enemyCharacter, x+collisionDistance/2, y-collisionDistance/2);
}


// draw the player
void drawPlayerShip(int x, int y) {
  noFill();
  noStroke();
  rect(x,y-80,100,150);
  image(catCharacter, x-250, y-100);
  if(lifeCount <= 50){
  fill(random(255));
  text("DYING!",x-200,y-80); 
  }
}



// checks if two positions are x distance apart
boolean shipsCollided(int x1, int y1, int x2, int y2) {
  float dist = dist(x1, y1, x2, y2);
  drawDistance(dist, x1, y1, x2, y2);
  if (dist <= collisionDistance) {
    return true;
  } else {
    return false;
  }
}

// returns a random number for the enemy y position
int getRandomYPosition() {
  return (int)random(0, height);
}  


void drawDistance(float dist, int x1, int y1, int x2, int y2) {
  float redAmount    = map(dist, collisionDistance, collisionDistance*20, 255, 0);
  float dangerAmount = map(dist, collisionDistance, collisionDistance*10, 255, 0);
  strokeWeight(0);
  stroke(redAmount, 0, 0);
  if (dist < collisionDistance * 4) {
    fill(255, 0, 0);
    text("!!!!", mouseX-50, mouseY-100);
  }
}

void resetGame() {
  score = -1;
  enemyX = 0;
  enemyY = 0;
  lifeCount = 100;
}