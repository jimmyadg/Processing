import processing.net.*;
Client myClient;
int[] data;
String input;
void setup() {
  size(400, 400);
  myClient = new Client(this, "127.0.0.1", 9293);
}


void draw() {
  myClient.write(byte(random(100)));
  if (myClient.available()>0) {
    //println("Reading: " + myClient.readString());
    input = myClient.readString();
    input = input.substring(0,input.indexOf("\n"));
    data = int(split(input, " "));
    print(data);
  }
}