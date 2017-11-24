import processing.net.*;

Server s;
Client c;

void setup() {
  size(400, 400);
  s = new Server(this, 9293);
  println(Server.ip());
}

void sendMessage(String x) {
  s.write(x);
}

void draw() {
  c = s.available();
  //println(c);

  if (c != null) {
    //println("client is + " + c);
    println("Reading: " + c.read());
    if (mousePressed) {
      line(pmouseX, pmouseY, mouseX, mouseY);
      sendMessage(pmouseX + " " +pmouseY + " " + mouseX +" " +mouseY +"\n");
    }
  } else {
    println("client not found");
  }
}