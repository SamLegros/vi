class TaintedResource {
  PVector position;
  int fillc;

  TaintedResource() {
    this(random(width-220), random(height-220));
  }

  TaintedResource(Disease a, Disease b) {    
    this(a.position.x, b.position.y);
  }

  TaintedResource(float x, float y) {
    position = new PVector(x, y);

    fillc = int(random(0, 130));
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    noStroke();
    fill(255, fillc, fillc);
    rect(0, 0, 20, 20);
    popMatrix();
  }
}
