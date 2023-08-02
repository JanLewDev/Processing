
// (29, 255, 0)

// Drop[] drops = new Drop[2000];
ArrayList<Drop> drops = new ArrayList();

float where = 0;
boolean pressed = false;

PFont font;

void setup() {
  size(1200, 800, P3D);
  /* for (int i = 0; i < drops.length; i++) {
   drops[i] = new Drop();
   if (i % 3 == 0){
   drops[i].z = random(10, 20);
   }
   } */
   
   font = createFont("Arial", 30, true);
}

void draw() {
  background(230, 230, 250);
  textFont(font, 36);
  fill(255);
  text("How many drops: " + drops.size(), 0, 30);
  /* for (int i = 0; i < drops.length; i++) {
   drops[i].fall();
   drops[i].show();
   } */
  if (pressed) {
    Drop drop = new Drop();
    float mark = random(1, 3);
    if (mark >= 2) {
      drop.z = random(10, 20);
    }

    drop.x = where;
    drop.y = 0;

    drops.add(drop);
    println(drops.size());
  }

  for (Drop d : drops) {
    d.fall();
    d.show();
  }
}

void mousePressed() {
  pressed = true;
  where = mouseX;
}

void mouseDragged() {
  where = mouseX;
}

void mouseReleased() {
  pressed = false;
}
