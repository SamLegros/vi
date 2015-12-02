ArrayList<Male> males = new ArrayList();
ArrayList<Female> females = new ArrayList();
ArrayList<Couple> couples = new ArrayList();
int score;

void setup() {
  size(800, 800);
}

void draw() {
  score++;
  println(score);
  background(255);

  // =========================================================
  // couples formation 
  for (int i=0; i < males.size(); i++) {
    Male male = males.get(i); // grab the object 
    for (int j=0; j < females.size(); j++) {
      Female female = females.get(j);      
      if (male.position.dist(female.position) < 100) { // Males to move towards closest female
        male.followFemale(female);
        if (male.position.dist(female.position) < 5) { // If Male and Female collide, remove Male and Female, spawn a Couple at their coordinates
          println("COUPLE FORMED");
          couples.add(new Couple(male, female));   // Couple(male, female) 
          males.remove(male);
          females.remove(female);
        }
      }
    }
  }
  
  
  // =========================================================
  // birth 
  
  if (score % 50 == 0) {
    males.add(new Male());
  }

  if (score % 50 == 0) {
    females.add(new Female());
  }

  
  
  
  // =========================================================
  for (Male male : males ) {
    male.move();
    male.display();
  }  

  for (Female female : females) {
    female.move();
    female.display();
  }

  for (Couple couple : couples) {
    couple.move();
    couple.display();
  }
}
