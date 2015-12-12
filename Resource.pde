class Resource {
  PVector position;
  int fillc;

  Resource() {
    this(random(width-220), random(height-220));
  }

  Resource(float x, float y) {
    position = new PVector(x, y);

    fillc = int(random(0, 100));
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    noStroke();
    fill(fillc, 180, fillc);
    rect(0, 0, 20, 20);
    popMatrix();
  }
}
