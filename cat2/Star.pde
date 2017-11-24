class Star{
  float x;
  float y;
  float rate;
  int radius;
  
  Star(){
    x = width;
    y = random(0,height);
    rate = random(0,4);
    radius = (int)rate+1;
  }
  
  void update(){
    x -= rate;
    if (x < 0 ){
       x = width;
       y = random(0,height);
    }
  }
  
  void draw(){
     fill(random(255));
     stroke(0);
     ellipse(x,y,radius,radius); 
  }
}