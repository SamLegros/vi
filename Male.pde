class Male {
  PVector position;
  PVector speed;

  Male() {
    this(random(width), random(height), random(-1, 1), random(-1, 1));
  }

  Male(float x, float y, float sx, float sy) {
    position = new PVector(x, y);
    speed = new PVector(sx, sy);
  }

  void followFemale(Female female) {
    speed = PVector.sub(female.position, position);
    speed.normalize();
  }

  void move() {
    position.add(speed);
  }
  
  void display() {
    pushMatrix();
    translate(position.x, position.y);
    noStroke();
    fill(65, 100, 255, 100);
    ellipse(0, 0, 20, 20);
    popMatrix();
  }
}
