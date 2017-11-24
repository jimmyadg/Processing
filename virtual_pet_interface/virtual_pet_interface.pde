import processing.serial.*;
Serial port;

int caseState;
int duration = 5000;
int interval = 100;
int health = 100;
int happy =100;
int selectState;
int s;
int u;
int d;

long prevTime;
float heartc;
float happyc;
float counter;

PImage apple;
PImage milk;
PImage meat;

boolean feedMilk = false;
boolean feedApple = false;
boolean feedMeat = false;

void setup() {
  size(600, 600);
  // reference: https://processing.org/reference/libraries/serial/Serial.html 
  port = new Serial(this, Serial.list()[1], 9600); //establish bluetooth connection 
  println("Available serial ports:" + port);
  smooth();
  noStroke();
  textSize(30);
  apple = loadImage("img/apple.png");
  milk = loadImage("img/milk.png");
  meat = loadImage("img/meat.png");
}

void draw() {
  background(255);
  long start = millis();
  counter = 128 + 127 * cos(0.25 * PI/interval * (interval - start));
  heartc = map(counter, 0, 255, 255, 0); 
  happyc = map(counter, 0, 255, 255, 0); 

  if (start - prevTime >= duration) {
    prevTime = start;

    if (health <= 5) {
      health = 0;
      caseState = 3; //go to end game
    } else {
      health -= 2;
    }

    if (happy <= 8) {
      happy = 0;
    } else {
      happy -= random(3, 8);
    }
  }

  display();
  emotion();
  logic();

}


void reset() {
  caseState = 0;
  selectState = 0;
  health = 100;
  happy = 100;
}

void mouseClicked() {
  if (selectState == 1) {
    caseState = 1;
    selectState =3;
  }
  if (selectState == 2) {
    caseState = 2;
    selectState = 5;
  }

  if (selectState == 4) {
    caseState = 0;
    selectState =0;
  }

  if (selectState == 9) {
    caseState = 0;
    selectState =0;
  }
  if (caseState == 3) reset();

  if (feedMilk == true) {
    if (health <= 95) {
      health+=5;
    } else {
      health += 100-health;
    }
  }

  if (feedApple == true) {
    if (health <= 97) {
      health+=3;
    } else {
      health += 100-health;
    }
  }

  if (feedMeat == true) {
    if (health <= 92) {
      health+=8;
    } else {
      health += 100-health;
    }
  }
}