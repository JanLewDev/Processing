float x;
float y;
float xspeed = 10;
float yspeed = 10;
float sizex = 128;
float sizey = 76;
PImage logo;
PFont font;
int bounces = 0;
int bouncesSince = 0;
long startingTime = System.currentTimeMillis();
long t = System.currentTimeMillis();
int howManyCorners = 0;
boolean showTrace = false;

PGraphics layer;

void setup() {
  fullScreen(P3D);
  // size(800, 600, P3D);
  x = random(0, width-sizex);
  y = random(0, height-sizey);

  logo = loadImage("dvd-new.png");

  font = createFont("Arial", 30, true);
  layer = createGraphics(width, height);
  layer.beginDraw();
  layer.background(0);
  layer.endDraw();
}



void draw() {

  image(layer, 0, 0);

  // background(0);
  textFont(font, 20);

  boolean xcheck = false;
  boolean ycheck = false;
  float oldx = x;
  float oldy = y;

  if (x+sizex >= width) {
    xspeed *= -1;
    x = width - sizex;
    xcheck = true;
    tint(random(100, 255), random(100, 255), random(100, 255));
    bounces++;
    bouncesSince++;
  } else if (x <= 0) {
    xspeed *= -1;
    x = 0;
    xcheck = true;
    tint(random(100, 255), random(100, 255), random(100, 255));
    bounces++;
    bouncesSince++;
  }

  if (y+sizey >= height) {
    yspeed *= -1;
    y = height - sizey;
    ycheck = true;
    tint(random(100, 255), random(100, 255), random(100, 255));
    bounces++;
    bouncesSince++;
  } else if (y <= 0) {
    yspeed *= -1;
    y = 0;
    ycheck = true;
    tint(random(100, 255), random(100, 255), random(100, 255));
    bounces++;
    bouncesSince++;
  }

  long actualTime = System.currentTimeMillis() - t;
  int seconds = (int) actualTime/1000;
  int minutes = 0;
  if (seconds > 59) {
    minutes = seconds/60;
    seconds %= 60;
  }

  if (xcheck && ycheck) {
    bouncesSince = 0;
    t = System.currentTimeMillis();
    howManyCorners++;
  }

  long fromStart = System.currentTimeMillis() - startingTime;
  fromStart /= 1000;
  long average = fromStart;
  if (howManyCorners > 0) {
    average = fromStart / (long) howManyCorners;
  }

  long avBounces = bounces;
  if (howManyCorners > 0) {
    avBounces = (long) bounces / (long) howManyCorners;
  }

  text("Corners: " + howManyCorners, 0, 120);
  text("Bounces: " + bounces, 0, 100);
  text("Bounces since last corner: " + bouncesSince, 0, 80);
  text("Time since last corner: "+minutes+":"+seconds, 0, 60);
  text("Average time between corners: "+String.valueOf(average)+" seconds", 0, 40);
  text("Average number of bounces between corners: " + String.valueOf(avBounces), 0, 20);
  image(logo, x, y, sizex, sizey);
  // rect(x, y, sizex, sizey);
  x += xspeed;
  y += yspeed;

  if (mousePressed && mouseX>=x && mouseX<=x+sizex && mouseY>=y && mouseY<=y+sizey) {
    showTrace = true;
  }

  if (showTrace) {
    layer.beginDraw();
    layer.stroke(255);
    layer.strokeWeight(2);
    layer.line(oldx+sizex/2, oldy+sizey/2, x+sizex/2, y+sizey/2);
    layer.endDraw();
  }
}
