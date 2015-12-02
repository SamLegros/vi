class Couple {
  PVector position;
  PVector speed;

  Couple() {
    this(random(width), random(height), random(-1, 1), random(-1, 1));
  }

  Couple(Male m, Female f) {    
    this(m.position.x, m.position.y, random(-1, 1), random(-1, 1));
  }

  Couple(float x, float y, float sx, float sy) {
    position = new PVector(x, y);
    speed = new PVector(sx, sy);
  }

  void move() {
    position.add(speed);
  }
  void display() {
    pushMatrix();
    translate(position.x, position.y);
    ellipse(0, 0, 5, 5);
    noStroke();
    fill(180, 0, 225, 100);
    ellipse(0, 0, 20, 20);
    popMatrix();
  }
}
