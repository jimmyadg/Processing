void display() {
  pushMatrix();
  translate(width/2, height/2);
  fill(0);
  if (health !=0) {
    if (happy>=40) {
      fill(#FFF5A3); //yellow
    } else {
      fill(#FF7372);// red
    }
  } else {
    fill(#9EA9BA);//dead
  }

  ellipseMode(CENTER);
  ellipse(0, 0, 200, 200);
  popMatrix();

  pushMatrix();
  translate(40, 500);
  beginShape();

  if (health <= 60) {
    fill(heartc);
    text("HUNGRY!", 200, 450);
  } else {
    fill(0);
    text("", 200, 450);
  }

  vertex(50, 15); 
  bezierVertex(50, -5, 90, 5, 50, 40); 
  vertex(50, 15); 
  bezierVertex(50, -5, 10, 5, 50, 40); 
  endShape(); 
  text(health, 100, 33);
  if (happy <= 40) {
    fill(happyc);
  } else {
    fill(0);
  }
  text(":-)   " + happy, 360, 33);
  popMatrix();
}

void emotion() {
  fill(255);
  ellipse(260, 280, 20, 20);
  ellipse(330, 280, 20, 20);
  if (happy >= 40) {
    pushMatrix();
    translate(50, 20);
    bezier(200, 295, 200, 370, 300, 370, 300, 295); //smiley face
    line(150, 295, 350, 295);
    popMatrix();
  } else {
    if (health !=0) {
      pushMatrix();
      translate(85, 70);
      bezier(190, 260, 210, 240, 225, 240, 240, 260);
      fill(#FF7372); //mad color
      translate(0, 5);
      bezier(180, 260, 210, 240, 225, 240, 260, 260);//sad face
      popMatrix();
    } else {
      fill(#9EA9BA); //dead color
    }
  }
}
