void motion() {
  x = x + speedX;
  y = y + speedY;

  if (x > width-w/2 || x < 0+w/2) {
    speedX = -speedX;
  }

  if (y >height-w/2 || y<0+h/2) {
    speedY = -speedY;
  }
}