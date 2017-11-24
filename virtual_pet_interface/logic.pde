void logic() {
  pushMatrix();
  translate(10, 10);
  select();
  switch(caseState) {
  case 0:
    port.write('X');
    if (mouseY >=63 && mouseY <=113) {
      if (mouseX >=125 && mouseX <=245) selectState = 1;
      if (mouseX >= 300 && mouseX <=430) selectState = 2;
    } else {
      selectState = 0;
    }
    break;

  case 1:
    port.write('X');
    if (mouseY >=63 && mouseY <=113) {
      if (mouseX >= 330 && mouseX <=480) selectState = 4;
    } else {
      selectState = 3;
    }

    break;

  case 2:
    if (mouseY >=63 && mouseY <=113) {
      if (mouseX >= 330 && mouseX <=480) selectState = 9;
    } else {
      selectState = 5;
    }
    if (keyPressed) {
      if (key == 's' || key == 'S') {
        port.write('D');
        s = #9EA9BA;
        if(happy < 100){
          happy++;
        }else{
          happy+=0;
        }     
      } else {
        s = 0;
      }
      if (key == 'u' || key == 'U') {
        port.write('B');
        u = #9EA9BA;
          if(happy < 100){
          happy++;
        }else{
          happy+=0;
        }
      } else {
        u = 0;
      }

      if (key == 'd' || key == 'D') {
        port.write('A');
        d = #9EA9BA;
          if(happy < 100){
          happy++;
        }else{
          happy+=0;
        }
      } else {
        d = 0;
      }
    }
    break;

  case 3:
    text("I'M DEAD :'(", 200, 450);
    selectState = 8;
    happy = 0;
    port.write('E');
    break;
  }

  popMatrix();
}

void select() {
  switch(selectState) {
  case 0: //no hover
    fill(0);
    text("FEED", 150, 100); 
    text("REMOTE", 310, 100);
    break;

  case 1: // hover feed
    fill(20);
    rect(125, 63, 120, 50);
    fill(255);
    text("FEED", 150, 100); 
    fill(0);
    text("REMOTE", 310, 100);
    break;

  case 2: //hover remote
    fill(20);
    rect(300, 63, 135, 50);
    fill(0);
    text("FEED", 150, 100); 
    fill(255);
    text("REMOTE", 310, 100);
    break;

  case 3: //feed no selection state
    fill(0);
    image(milk, 100, 50);
    //rect(260, 50, 60, 100); position rect
    image(apple, 180, 60);
    image(meat, 265, 60);
    text("GO BACK", 340, 100);
    if (mouseX >= 100 && mouseX <= 160 && mouseY >= 50 && mouseY <= 150) {
      if (mousePressed == true) {
        feedMilk = true;
        if (health <= 95) {
          fill(#3CA9EA);
          text("Health + 5", mouseX-40, mouseY+60);
        } else {
          if (health == 100) {
            fill(#76E87D);
            text("I'M FULL!", mouseX-40, mouseY+60);
          } else {
            fill(#3CA9EA);
            text("Health + " + (100-health), mouseX-40, mouseY+60);
          }
        }
      } else {
        text("/MILK/ Health+5", mouseX-40, mouseY+60);
        feedMilk = false;
      }
    }
    if (mouseX >= 180 && mouseX <= 240 && mouseY >= 50 && mouseY <= 150) {
      if (mousePressed == true) {
        feedApple = true;
        if (health <= 97) {
          fill(#3CA9EA);
          text("Health + 3", mouseX-40, mouseY+60);
        } else {
          if (health == 100) {
            fill(#76E87D);
            text("I'M FULL!", mouseX-40, mouseY+60);
          } else {
            fill(#3CA9EA);
            text("Health + " + (100-health), mouseX-40, mouseY+60);
          }
        }
      } else {
        text("/APPLE/ Health+3", mouseX-40, mouseY+60);
        feedApple = false;
      }
    }
    if (mouseX >= 260 && mouseX <= 320 && mouseY >= 50 && mouseY <= 150) {
      if (mousePressed == true) {
        feedMeat = true;
        if (health <= 92) {
          fill(#3CA9EA);
          text("Health + 8", mouseX-40, mouseY+60);
        } else {
          if (health == 100) {
            fill(#76E87D);
            text("I'M FULL!", mouseX-40, mouseY+60);
          } else {
            fill(#3CA9EA);
            text("Health + " + (100-health), mouseX-40, mouseY+60);
          }
        }
      } else {
        text("/MEAT/ Health+8", mouseX-40, mouseY+60);
        feedMeat = false;
      }
    }
    break;

  case 4: // feed selected go back
    fill(20);
    rect(330, 63, 150, 50);
    image(milk, 100, 50);
    image(apple, 180, 60);
    image(meat, 265, 60);
    fill(255);
    text("GO BACK", 340, 100);
    break;

  case 5: //remote no select
    fill(s);
    text("SIT", 50, 100);
    fill(u);
    text("UP", 150, 100);
    fill(d);
    text("DOWN", 230, 100);
    fill(0);
    text("GO BACK", 340, 100);


    break;
    
    case 8:
    fill(0);
    text("ClICK TO RESTART",150,100);
    break;

  case 9: //remote selected go back
    fill(0);
    text("SIT", 50, 100);
    //rect(260, 50, 60, 100); position rect
    text("UP", 150, 100);
    text("DOWN", 230, 100);
    fill(20);
    rect(330, 63, 150, 50);
    fill(255);
    text("GO BACK", 340, 100);
    break;
  }
}