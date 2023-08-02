int cols, rows;
int scale = 20;
int w = 2000;
int h = 2000;
float flying = 0;
int howHigh = 200;

float[][] terrain;


void setup() {
  // size(1920, 1080, P3D);
  fullScreen(P3D);
  cols = w / scale;
  rows = h / scale;
  terrain = new float[cols][rows];
}

void draw() {

  float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -howHigh, howHigh);
      xoff += 0.1;
    }
    yoff += 0.1;
  }

  flying -= 0.005;

  background(0);
  stroke(0, 0, 0);
  noFill();
  colorMode(HSB, howHigh);

  translate(width/2, height/2+200);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      stroke(howHigh, map(terrain[x][y], -howHigh, howHigh, 0, howHigh), howHigh);
      // stroke(255);
      vertex(x*scale, y*scale, terrain[x][y]);
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
      // rect(x*scale, y*scale, scale, scale);
    }
    endShape();
  }
  // saveFrame("frames/####.tga");
}
