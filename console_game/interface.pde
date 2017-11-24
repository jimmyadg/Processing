String charName = "";
int startUpX = 300;
int startUpY = 300;
int speed = 3;
int caseState;
String command = "";
int base = 530;
int counter;
int v;//score
int enemyNum = 5;
int goalX = (int)random(40, 560);
int goalY = (int)random(40, 480);


//reference: Star in  week 4 class example


void interFace() {
  switch(caseState) {
    //enter character name
  case 0:
    fill(255);
    text("Enter Your Name: " + charName, width/6, height/2);
    text("PRESS SPACE TO START", width/6, (height/2)+30);
    break;

    //start game
  case 1:
    if (startUpX < width)startUpX+= speed;
    if (startUpY > 0) startUpY-= speed;
    if (startUpY == 0) {
      keyPressed();
      fill(255);
      text("Player " + charName + ": " +command, 20, base);
      text("Score: " + v, 520, 560);
      drawCharacter(x, y);
      setGoal(goalX, goalY);
      if (x - goalX <=5 && y-goalY <=5) {
        v+=1;
        goalX = (int)random(40, 560);
        goalY = (int)random(40, 480);
      }
      for (int i = 0; i < enemyNum; i++) {
        drawEnemy(enemyX[i], enemyY[i]);
        enemyY[i] += enemySpeed;
        //hit
        if (enemyX[i] - x == 3 && enemyY[i] == y-10)caseState = 2;
        if (enemyY[i] >= base - 50) {
          resetEnemy();
        }
      }

      if (command.equals("right")) {
        x+= speed;
        if (x >= width)x = 20;
      }
      if (command.equals("left")) {
        x -= speed;
        if (x <= 0) x = width - 20 ;
      }
      if (command.equals("up")) {
        y-= speed-0.5;
        if (y == 20) caseState = 2;
      }
      if (command.equals("down")) {
        y+= speed;
        if (y == base-20)caseState = 2;
      }
      if (command.length() > 0) {
        counter++;
        if (counter >= 50) {
          counter = 0;
          command = "";
        }
      }
      print(enemyX);
      print("\t");
      print(enemyY);
      print("\t");
      print(x);
      print("\t");
      print(y);
      println();
    }


    stroke(255);
    line(width/2, height-100, startUpX, height-100);
    line(width/2, height-100, startUpY, height-100);

    break;

  case 2:
    fill(255);
    text("Player " + charName + "game over", 230, 260);
    text("Total Score: "+v, 250, 300);  
    text("PRESS ENTER TO RESTART", 220, 340);
    keyReleased();
    break;
  }
}