float rotSeconds = 0;
float rotMinutes = 0;
float rotHours = 0;
int lastSecond = 0;
int lastMinute = 0;
int lastHour = 0;

float faceSize = 800;
float lengthSecondHand = 220;
float lengthMinuteHand = 200;
float lengthHourHand = 100;

color black = color(0);
color grey = color(200);
color purple = color(100, 0, 100);
color green = color(0, 100, 100);
color yellow = color(255, 255, 0);


void setup() {
  size(900, 900, P2D); 
  strokeWeight(2);

}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();
  
  if (s != lastSecond) {
    rotSeconds = ((float) s / 60) * TWO_PI;
    lastSecond = s;
  }
  
  if (m != lastMinute) {
    rotMinutes = ((float) m / 60) * TWO_PI; 
    lastMinute = m;
  }
  
  if (h != lastHour) {
    rotHours = ((float) h / 12) * TWO_PI;  
    println(h);
    lastHour = h;
  }
  
  fill(purple);
  stroke(black);
  ellipse(width/2, height/2, faceSize, faceSize);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotSeconds);
  fill(grey);
  ellipse(0, -lengthSecondHand, 25,25);
  popMatrix();
  
  
  ///SUN///
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotMinutes);
  fill(yellow);
  stroke(black);
  ellipse(0, -lengthMinuteHand, 60,60);
  popMatrix();
  
  
  ///satellite///
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotHours);
  fill(black);
  ellipse(0, -lengthHourHand, 10,10);
  popMatrix();
  
  
  ///earth///
  fill(green);
  ellipse(width/2, height/2, 50, 50);
}
