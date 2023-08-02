float angle = 0;

int width = 800;
int height = 800;
int w = 25;
float magicAngle;
float maxDis;

void setup() {
  size(1200, 1000, P3D);
  // fullScreen(P3D);
  magicAngle = atan(1/sqrt(2));
  maxDis = dist(0, 0, 200, 200);
}

float h = 100;
void draw() {
  lights();
  pointLight(50, 250, 50, 10, 30, 50);
  background(100);
  ortho(-600, 600, -600, 600);
  // ambientLight(255, 255, 255, 0, -1, 0);

  translate(width/2-75, height/2-300);
  // translate(width/2-500, height/2-500);
  rotateX(-magicAngle);
  rotateY(-QUARTER_PI);
  translate(width/2, height/2);

  // rectMode(CENTER);
  // rotations
  /* rotateX(angle * 0.25);
  rotateY(angle * 0.25);
  rotateZ(angle * 0.25); */ 

  for (int z = 0; z < height; z += w) {
    for (int x = 0; x < width; x += w) {
      pushMatrix();

      float dis = dist(x, z, width/2, height/2);
      float offset = map(dis, 0, maxDis, -PI, PI);
      // float offset = map(dis, 0, maxDis, -0.5, 0.5);
      h = map(sin(angle + offset), -1, 1, 100, 300);
      
      /* testing for colours */
      colorMode(HSB, 300);
      // rainbow
      // fill(map(h, 100, 300, 0, 300), 300, 300);
      fill(300, map(h, 100, 300, 0, 300), 300);
      /* testing for colours */
      
      translate(x - width/2, 0, z - height/2);
      // fill(21, 233, 10); 
      // fill(255, 128, 0);
      box(w, h, w);
      // rect(x - width/2 + w/2, 0, w - 2, h);

      popMatrix();
    }
  }
  angle -= 0.04;
}
