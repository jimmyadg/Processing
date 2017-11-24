import gifAnimation.*;
GifMaker gifExport;

ImageLoader[]images;
int minIndex = 0;
int maxIndex = 100;
int caseState=0;
int alpha = 255;
float imgSize = 60;
float[] colorArr = new float[maxIndex];
float[] sizeArr = new float[maxIndex];

void setup() {
  gifExport = new GifMaker(this, "export.gif");
  gifExport.setRepeat(0);
  gifExport.setQuality(2);
  size(600, 600, P3D);
  images = new ImageLoader[maxIndex];
  for (int i = minIndex; i < maxIndex; i++) {
    images[i] = new ImageLoader(i, imgSize, "img/" + i + ".jpg");
    colorArr[i]=images[i].rgb;
    sizeArr[i]=images[i].imgd;
    //debug(i);
  }
  colorArr = sort(colorArr);
  sizeArr = sort(sizeArr);
  //println(colorArr);
}

void draw() {
  background(255);
  switch(caseState) {
  case 0:
    for (int i = minIndex; i < maxIndex; i++) {
      images[i].alpha = 255;
      images[i].update();
    }
    break;
  case 1:
    for (int i = minIndex; i < maxIndex; i++) {
      for (int j = minIndex; j < maxIndex; j++) {
        if (images[i].rgb==colorArr[j]) {
          images[i].setX = ((j*imgSize)%width); 
          images[i].setY = (int((j*imgSize)/width)) * imgSize;
          //println(images[i].setX,images[i].setY);
        }
      }
      images[i].alpha = 255;
      images[i].update();
    }

    break;
  case 2:
    for (int i = minIndex; i < maxIndex; i++) {
      for (int j = minIndex; j < maxIndex; j++) {
        if (images[i].imgd==sizeArr[j]) {
          images[i].setX = ((j*imgSize)%width); 
          images[i].setY = (int((j*imgSize)/width)) * imgSize;
          //println(images[i].setX,images[i].setY);
        }
      }
      images[i].alpha = 255;
      images[i].update();
    }
    break;

  case 3:
    for (int i = minIndex; i < maxIndex; i++) {
      for (int j = minIndex; j < maxIndex; j++) {
        images[i].setX = 250; 
        images[i].setY = 250;
      }
      images[i].update();
    }
    break;

  }
}

void keyPressed() {
  if (caseState <3) {
    caseState++;
  } else if (caseState == 3) {
    caseState = 0;
  }
}