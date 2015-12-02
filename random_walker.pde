ArrayList<Walker> walkers = new ArrayList();
int time;

void setup() {
  size(500, 500);
  background(255);

  //for (int i = 0; i < walkers.length; i++) {
  //  walkers[i] = new Walker();
  //}
}

void draw() {
  background(255);
  time++;

  for (Walker walker : walkers) {
    walker.display(); 
    walker.step();
  }
  delay(100);
  
    if (time % 10 == 0) {
    walkers.add(new Walker());
  }
  println(time);
}
