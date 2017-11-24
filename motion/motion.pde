int x = 0;
int rate = 10;

void setup () {
 size(600,400); 
  
}

void draw() {
 background(255);
 fill(0);
 rect(x, height/2,20,20);
 x+=rate;
 
 if(x >= width || x <= 0) {
   rate = rate * -1;
   println("hit wall");
  }
  println(rate);
}