class Disease {
  PVector position;
  PVector speed;
  float angle;

  Disease() {
    this(random(width), random(height), random(-1, 1), random(-1, 1));
  }

  Disease(float x, float y, float sx, float sy) {
    position = new PVector(x, y);
    speed = new PVector(sx, sy);
  }

  //void followFemale(Female female) {
  //  speed = PVector.sub(female.position, position);
  //  speed.normalize();
  //}

  void move() {
    position.add(speed);
  }
  void display() {
    pushMatrix();
    translate(position.x, position.y);
    angle = angle+0.1;
    rotate(angle);
    noStroke();
    fill(255, 0, 0);
    rect(0, 0, 20, 20);
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
