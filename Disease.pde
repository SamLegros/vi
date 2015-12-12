class Disease {
  PVector position;
  PVector speed;
  float angle;
  int fillc;

  Disease() {
    this(random(width-220), random(height-220), random(-1, 1), random(-1, 1));
  }

  Disease(float x, float y, float sx, float sy) {
    position = new PVector(x, y);
    speed = new PVector(sx, sy);

    fillc = int(random(0, 130));
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
    fill(255, fillc, fillc);
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
