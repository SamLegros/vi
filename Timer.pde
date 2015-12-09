class Timer {
  
  long timestamp;     
  float spawnRate; 
  
  Timer() {
     spawnRate = 60; 
     timestamp = millis(); 
  }
  
  void setSpawnRate(float newSpawnRate) {
    spawnRate = newSpawnRate;   
  }
  
  boolean check() {
     float delay = 1000 * 60 / spawnRate;      
     if (millis() - timestamp >= delay) {
         // trigger 
         timestamp = millis();
         return true;
     }
    return false; 
  }
  
}
