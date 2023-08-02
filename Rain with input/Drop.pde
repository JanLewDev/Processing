class Drop {
  float x = random(width);
  float y = random(-1000, -50);
  float far = random(1, 3);
  float z = random(0, 10);
  
  float fallSpeed = map(z, 0, 20, 4, 10);
  float len = map(z, 0, 20, 10, 20);

  void fall() {
    y += fallSpeed;
    float gravity = map(z, 0, 20, 0.01, 0.2);
    fallSpeed += gravity;

    if (y > height) {
      
      strokeWeight(map(z, 0, 20, 10, 20));
      point(x, height);
      y = random(-1000, -50);
      fallSpeed = map(z, 0, 20, 4, 10);
    }
  }

  void show() {
    float thickness = map(z, 0, 20, 1, 3);
    strokeWeight(thickness);
    stroke(138, 43, 226);
    line(x, y, x, y+len);
  }
}
