 void colors(){
  
  if (y >height-h/2 || y < 0+h/2) {
    for (int i = 0; i < randomColorY.length; i++){
      randomColorY[i] = random(50,255);
      float c = randomColorY[i];
      fill(c,random(255),random(255));
      ellipse(x, y, w, h);
    } 
  }
  
  if (x >width-h/2 || x < 0+w/2) {
    for (int i = 0; i < randomColorX.length; i++){
      randomColorX[i] =random(50,255);
      float c = randomColorX[i];
      fill(c,random(255),random(255));
      ellipse(x, y, w, h);
    } 
  }
}