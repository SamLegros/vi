class Couple {
  PVector position;
  PVector speed;

  Couple() {
    this(random(width), random(height), random(-1, 1), random(-1, 1));
  }
  
  Couple(Male m, Female f) {    
    //float sx = m.speed.y / f.speed.y;
    //float sy = ... 
    
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

    float angle = speed.heading2D();
    float len = 15;

    rotate(angle);
    noStroke();
    fill(180, 0, 225);
    ellipse(0, 0, 20, 20);
    popMatrix();
  }
}
