class ImageLoader {
  PVector pos;
  PImage img;
  float imgw, imgh, imgd, ranX, ranY, setX, setY, rgb;
  int alpha;

  ImageLoader(int i, float size, String p) {
    ranX =random(600);
    ranY =random(600);
    setX=((i*size)%width);
    setY=(int((i*size)/width)) * size;
    pos = new PVector(ranX, ranY);
    img = loadImage(p);
    alpha = 255;
    tint(255, alpha);
    img.resize(0, int(size));
    image(img, ranX, ranY);
    //get average input image rgb
    rgb = extractColorFromImage(img);
    //get input image size
    imgw = img.width;
    imgh = img.height;
    imgd = (imgw+imgh)/2;
  }
  void update() {

    //x set
    if (ranX!=setX) {
      if (ranX > setX) {
        ranX--;
        image(img, ranX, ranY);
      }
      if (ranX < setX) {
        ranX++;
        tint(255, alpha);
        image(img, ranX, ranY);
      }
    }
    //y set
    if (ranY!=setY) {
      if (ranY > setY) {
        ranY--;
        tint(255, alpha);
        image(img, ranX, ranY);
      }
      if (ranY < setY) {
        ranY++;
        tint(255, alpha);
        image(img, ranX, ranY);
      }
    }
    if (alpha>0)alpha--;
  } //end of void update
} //end of ImageLoader

//ref: https://forum.processing.org/two/discussion/15573/get-the-average-rgb-from-pixels
float extractColorFromImage(PImage img) {
  img.loadPixels();
  int r = 0, g = 0, b = 0;
  for (int i=0; i<img.pixels.length; i++) {
    color c = img.pixels[i];
    r += c>>16&0xFF;
    g += c>>8&0xFF;
    b += c&0xFF;
  }
  r /= img.pixels.length;
  g /= img.pixels.length;
  b /= img.pixels.length;
  float ave = (r+r+b+g+g+g)/6;
  return ave;
}