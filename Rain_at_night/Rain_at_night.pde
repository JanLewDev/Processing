
// (29, 255, 0)

Drop[] drops = new Drop[2000];

void setup() {
  // size(1200, 800, P3D);
  fullScreen(P3D);
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
    if (i % 3 == 0) {
      drops[i].z = random(10, 20);
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
  }
}
