class Drop {
  float x = random(width);
  float y = random(-1000, -50);
  float far = random(1, 3);
  float z = random(0, 10);
  color col = color(random(255), random(255), random(255));
  
  float fallSpeed = map(z, 0, 10, 4, 10);
  float len = map(z, 0, 20, 10, 20);

  void fall() {
    y += fallSpeed;
    x += 1;
    float gravity = map(z, 0, 20, 0.01, 0.2);
    fallSpeed += gravity;
    

    if (y >= height) {
      
      strokeWeight(map(z, 0, 20, 10, 20));
      point(x, height);
      y = random(-1000, -50);
      fallSpeed = map(z, 0, 20, 4, 10);
    }
    
    if (x >= width){
      x = 0;
    }
  }

  void show() {
    float thickness = map(z, 0, 20, 1, 3);
    strokeWeight(thickness);
    stroke(col);
    line(x, y, x-2, y-10);
    ellipse(x, y, 2, 2);
    fill(255);
  }
}
