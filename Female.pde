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
    noStroke();
    fill(255, 135, 225);
    ellipse(0, 0, 20, 20);
    popMatrix();
  }

  void checkEdges() {
    if ((position.x > width-220) || (position.x < 0)) {
      speed.x = speed.x * -1;
    }
    if ((position.y > height) || (position.y < 0 )) {
      speed.y = speed.y * -1;
    }
  }
}
