class Female {
  PVector position;
  PVector speed;

  Female() {
    this(random(width), random(height), random(-1, 1), random(-1, 1));
  }

  Female(float x, float y, float sx, float sy) {
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

    float angle = speed.heading2D();
    float len = 15;

    rotate(angle);
    noStroke();
    fill(255, 135, 225);
    ellipse(0, 0, 20, 20);
    popMatrix();
  }
}
