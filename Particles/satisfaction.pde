import java.util.ArrayList;

int numParticles = 2000;
ArrayList<Particle> particles;
float noiseScale = 0.1;
float maxSpeed = 0.6;
int duration = 5*60;

void setup() {
  // size(1920, 1080);
  fullScreen();
  frameRate(30);
  smooth();
  particles = new ArrayList<Particle>();
  
  for (int i = 0; i < numParticles; i++) {
    particles.add(new Particle());
  }
}

void draw() {
  background(0, 25);
  
  for (Particle p : particles) {
    p.update();
    p.display();
  }
  
  // saveFrame("frames/####.tga");
  
  if(frameCount == duration*30){
    exit();
  }
  
}

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  int life;

  Particle() {
    position = new PVector(random(width), random(height));
    velocity = new PVector();
    acceleration = new PVector();
    life = floor(random(50, 255));
  }

  void update() {
    float angle = noise(position.x * noiseScale, position.y * noiseScale) * TWO_PI * 4;
    acceleration = PVector.fromAngle(angle);
    acceleration.mult(maxSpeed);

    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);

    life--;

    if (life < 0 || position.x < 0 || position.x > width || position.y < 0 || position.y > height) {
      position = new PVector(random(width), random(height));
      life = floor(random(50, 255));
    }
  }

  void display() {
    stroke(255, life);
    strokeWeight(2);
    point(position.x, position.y);
  }
}
