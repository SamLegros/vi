class Female {
  PVector position;
  PVector speed;
  int fillc;

  Female() {
    this(random(width-220), random(height-220), random(-1, 1), random(-1, 1));
  }

  Female(float x, float y, float sx, float sy) {
    position = new PVector(x, y);
    speed = new PVector(sx, sy);

    fillc = int(random(75, 175));
  }

  void move() {
    position.add(speed);
  }
  void display() {
    pushMatrix();
    translate(position.x, position.y);
    noStroke();
    fill(255, fillc, 225);
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
  
  void femaleBounce() {
   speed.x = speed.x * -1; 
  }
}
