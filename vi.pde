// RTA 959 Final Project
// Title: Vi
// By: Sam Legros

// What came first, the single or the couple??

ArrayList<Male> males = new ArrayList();
ArrayList<Female> females = new ArrayList();
ArrayList<Couple> couples = new ArrayList();
ArrayList<Disease> diseases = new ArrayList();
int time;

int textx;
int texty;
int maleSpawnRate;
int maleSpawning;
int femaleSpawnRate;
int femaleSpawning;
int diseaseSpawnRate;
int diseaseSpawning;

void setup() {
  size(1010, 800);
  background(255);
}

void draw() {
  time++;
  maleSpawnRate = 50;
  femaleSpawnRate = 50;
  diseaseSpawnRate = 50;

  //println(time);
  background(255);

  // COUPLE FORMATION ============================================================================================================================
  for (int k=0; k < diseases.size(); k++) {
    Disease disease = diseases.get(k); // grab the object
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
          } else if (disease.position.dist(male.position) < 20) {
            males.remove(male);
            println("MALE REMOVED");
          } else if (disease.position.dist(female.position) < 20) {
            females.remove(female);
            println("FEMALE REMOVED");
          }
          //else if (disease.position.dist(couple.position) < 20) {
          //couples.remove(couple);
          //println("COUPLE REMOVED");
          //}
        }
      }
    }
  }
  // END COUPLE FORMATION ========================================================================================================================

  //// COUPLE FORMATION ============================================================================================================================
  //for (int i=0; i < males.size(); i++) {
  //  Male male = males.get(i); // grab the object
  //  for (int j=0; j < females.size(); j++) {
  //    Female female = females.get(j);      
  //    if (male.position.dist(female.position) < 100) { // Males to move towards closest female
  //      male.followFemale(female);
  //      if (male.position.dist(female.position) < 5) { // If Male and Female collide, remove Male and Female, spawn a Couple at their coordinates
  //        println("COUPLE FORMED");
  //        couples.add(new Couple(male, female));   // Couple(male, female) 
  //        males.remove(male);
  //        females.remove(female);
  //      }
  //    }
  //  }
  //}
  //// END COUPLE FORMATION ========================================================================================================================

  //// DISEASE ====================================================================================================================================
  //for (int i=0; i < males.size(); i++) {
  // Male male = males.get(i); // grab the object
  // for (int j=0; j < females.size(); j++) {
  //   Female female = females.get(j);
  //   for (int k=0; k < diseases.size(); k++) {
  //     Disease disease = diseases.get(k);
  //     if (disease.position.dist(female.position) < 10) { // Males to move towards closest female
  //       println("FEMALE REMOVED");
  //       females.remove(female);
  //       if (disease.position.dist(male.position) < 10) { // If Male and Female collide, remove Male and Female, spawn a Couple at their coordinates
  //         println("MALE REMOVED");
  //         males.remove(male);
  //       }
  //     }
  //   }
  // }
  //}
  //// END DISEASE (yay!) ==========================================================================================================================


  // SPAWN RATE ===================================================================================================================================
  if (time % maleSpawnRate == 0) {
    males.add(new Male());
  }

  if (time % femaleSpawnRate == 0) {
    females.add(new Female());
  }

  if (time % 50 == 0) {
    diseases.add(new Disease());
  }
  // END SPAWN RATE ===============================================================================================================================

  // DISPLAY CLASSES =============================================================================================================================
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

  for (Disease disease : diseases) {
    disease.move();
    disease.display();
  }
  // END DISPLAY CLASSES ==========================================================================================================================

  // DISPLAY BOX ===================================================================================================================================
  textx = 810;
  texty = 30;
  maleSpawning = time/maleSpawnRate;
  maleSpawnRate = 1000/maleSpawnRate;
  femaleSpawning = time/femaleSpawnRate;
  femaleSpawnRate = 1000/femaleSpawnRate;
  diseaseSpawning = time/diseaseSpawnRate;
  diseaseSpawnRate = 1000/diseaseSpawnRate;

  strokeWeight(5);
  stroke(200);
  fill(255);
  rect(width-210, 2, 207, 795);
  fill(0);
  text("Male Spawn Rate: " + maleSpawnRate + " / minute", textx, texty);
  text("Males Spawned: " + maleSpawning, textx, texty*2-10);
  text("Female Spawn Rate: " + femaleSpawnRate + " / minute", textx, texty*3);
  text("Females Spawned: " + femaleSpawning, textx, texty*4-10);
  text("Disease Spawn Rate: " + diseaseSpawnRate + " / minute", textx, texty*5);
  text("Diseases Spawned: " + diseaseSpawning, textx, texty*6-10);
  // END DISPLAY BOC ==============================================================================================================================
}
// END DRAW =====================================================================================================================================
