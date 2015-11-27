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
    //speed.lerp(position, 0.1);
    speed.normalize();
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
    fill(65, 100, 255);
    ellipse(0, 0, 20, 20);
    //line(0, 0, len, 0);
    //line(len, 0, len-5, -5);
    //line(len, 0, len-5, 5);
    popMatrix();
  }
}
