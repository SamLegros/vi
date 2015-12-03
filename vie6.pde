// RTA 959 Final Project
// Title: Vi
// By: Sam Legros

// What came first, the single or the couple??

ArrayList<Male> males = new ArrayList();
ArrayList<Female> females = new ArrayList();
ArrayList<Couple> couples = new ArrayList();
ArrayList<Disease> diseases = new ArrayList();
//ArrayList<Resource> resources = new ArrayList();
int time;

int textx;

Timer maleSpawnRate;
int maleSpawning;
int maleOnScreen;
int maleKillCount;

Timer femaleSpawnRate;
int femaleSpawning;
int femaleOnScreen;
int femaleKillCount;

Timer resourceSpawnRate;
int resourceSpawning;
int resourceKillCount;

Timer diseaseSpawnRate;
int diseaseSpawning;

int coupleFormCount;
int coupleKillCount;

void setup() {
  size(1010, 800);
  frameRate(60);

  //test = new Timer(); 
  //test.spawnRate = 60; 

  maleSpawnRate = new Timer();
  maleSpawnRate.spawnRate = 60;

  femaleSpawnRate = new Timer();
  femaleSpawnRate.spawnRate = 60;

  resourceSpawnRate = new Timer();
  resourceSpawnRate.spawnRate = 60;

  diseaseSpawnRate = new Timer();
  diseaseSpawnRate.spawnRate = 60;
}

void draw() {


  if (maleSpawnRate.check() == true) {
    males.add(new Male());
  }
  if (femaleSpawnRate.check() == true) {
    females.add(new Female());
  }
  //if (resourceSpawnRate.check() == true) {
  //  resources.add(new Male());
  //}
  if (diseaseSpawnRate.check() == true) {
    diseases.add(new Disease());
  }


  //fill(0, 3);
  //rect(0, 0, width, height);
  time++;

  // spawn per second 
  //maleSpawnRate = 60;
  //femaleSpawnRate = 60;
  //resourceSpawnRate = 60;
  //diseaseSpawnRate = 60;
  background(255);

  // MAIN INTERACTIONS ============================================================================================================================

  // COUPLE FORMATION ================================================================================================================================
  for (int i=0; i < males.size(); i++) {
    Male male = males.get(i); // grab the object
    for (int j=0; j < females.size(); j++) {
      Female female = females.get(j);
      if (male.position.dist(female.position) < 100) { // Males to move towards closest female
        male.followFemale(female);
        if (male.position.dist(female.position) < 5) { // If Male and Female collide, remove Male and Female, spawn a Couple at their coordinates
          couples.add(new Couple(male, female));   // Couple(male, female) 
          males.remove(male);
          females.remove(female);
          coupleFormCount = coupleFormCount + 1;
          println("COUPLE FORMED");
        }
      }
    }
  }
  // END COUPLE FORMATION ================================================================================================================================

  // DISEASE CHECKS ================================================================================================================================
  for (int k=0; k < diseases.size(); k++) {
    Disease disease = diseases.get(k); // grab the object

    for (int i=0; i < males.size(); i++) {
      Male male = males.get(i); // grab the object
      if (disease.position.dist(male.position) < 20) {
        males.remove(male);
        maleKillCount = maleKillCount + 1;
        println("MALE REMOVED");
      }
    }

    for (int j=0; j < females.size(); j++) {
      Female female = females.get(j);
      if (disease.position.dist(female.position) < 20) {
        females.remove(female);
        femaleKillCount = femaleKillCount + 1;
        println("FEMALE REMOVED");
      }
    }

    for (int j=0; j < couples.size(); j++) {
      Couple couple = couples.get(j);
      if (disease.position.dist(couple.position) < 20) {
        couples.remove(couple);
        coupleKillCount = coupleKillCount + 1;
        println("COUPLE REMOVED");
      }
    }
  }
  // END DISEASE CHECKS ================================================================================================================================

  // END MAIN INTERACTIONS ========================================================================================================================

  // SPAWN RATE ===================================================================================================================================  
  //if (time % int(1.0/maleSpawnRate) == 0) {
  //  males.add(new Male());
  //}
  //if (time % int(1.0/femaleSpawnRate) == 0) {
  //  females.add(new Female());
  // }
  //if (time % resourceSpawnRate == 0) {
  // resources.add(new Resource()); 
  //}
  //if (time % int(1.0/diseaseSpawnRate) == 0) {
  //  diseases.add(new Disease());
  //}
  // END SPAWN RATE ===============================================================================================================================

  // DISPLAY CLASSES =============================================================================================================================
  for (Male male : males ) {
    male.move();
    male.display();
    male.checkEdges();
  }  

  for (Female female : females) {
    female.move();
    female.display();
    female.checkEdges();
  }

  for (Disease disease : diseases) {
    disease.display();
  }

  for (Couple couple : couples) {
    couple.move();
    couple.display();
    couple.checkEdges();
  }

  for (Disease disease : diseases) {
    disease.move();
    disease.display();
    disease.checkEdges();
  }
  // END DISPLAY CLASSES ==========================================================================================================================

  // DISPLAY BOX ===================================================================================================================================
  textx = 810;

  strokeWeight(5);
  stroke(200);
  fill(255);
  rect(width-210, 2, 207, 795);
  fill(0);
  text("Male Spawn Rate: " + " / minute", textx, 30);
  text("Males Spawned: ", textx, 50);
  fill(0, 255, 0);
  text("Single Men: ", textx, 70);
  fill(255, 0, 0);
  text("Male Deaths: ", textx, 90);

  fill(0);
  text("Female Spawn Rate: " + " / minute", textx, 120);
  text("Females Spawned: ", textx, 140);
  fill(0, 255, 0);
  text("Single Ladies: ", textx, 160);
  fill(255, 0, 0);
  text("Female Deaths: ", textx, 180);

  fill(0, 255, 0);
  text("Couples Alive: ", textx, 210);
  fill(255, 0, 0);
  text("Couple Deaths: ", textx, 230);

  fill(0);
  text("Disease Spawn Rate: " + " / minute", textx, 260);
  text("Diseases Spawned: ", textx, 280);

  //fill(0);
  //text("Total Alive: " +)

  //text("Time: " + time, textx, 270);
  // END DISPLAY BOC ==============================================================================================================================
}
// END DRAW =====================================================================================================================================
