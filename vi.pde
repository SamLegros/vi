ArrayList<Male> males = new ArrayList();
ArrayList<Female> females = new ArrayList();
int score;

void setup() {
  size(800, 800);
}

void draw() {
  int time = millis();
  score++;
  println(score);
  background(255);

  for (Male male : males) {
    male.move();
    male.display();
    for (Female female : females) {
      if (male.position.dist(female.position) < 100) {
        male.followFemale(female);
        if (male.position.dist(female.position) < 5) {
        // create a couple, destroy the male and female 
        }
      }
    }
  }

  for (Female female : females) {
    female.move();
    female.display();
  }

  if (score % 50 == 0) {
    males.add(new Male());
  }

  if (score % 50 == 0) {
    females.add(new Female());
  }
}
