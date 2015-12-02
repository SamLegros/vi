class WalkerF {
  float x;
  float y;
  int delay;
  int fill;

  WalkerF() {
    x = random(width);
    y = random(height);
  }

  void display() {
    stroke(0);
    rect(x, y, 10, 10);
  }

  void step() {
    int choice = int(random(7));
    delay = 50;
    fill = #FF3BBE;

    if (choice == 0) {
      x = x+10; //step right
      fill(fill);
      delay(delay);
    } else if (choice == 1) {
      x = x-10; //step left
      fill(fill);
      delay(delay);
    } else if (choice == 2) {
      y = y+10; //step down
      fill(fill);
      delay(delay);
    } else if (choice == 3) {
      y = y-10; //step up
      fill(fill);
      delay(delay);
    } else if (choice == 4) {
      x = x+10; //step right
      y = y-10; //step up
      fill(fill);
      delay(delay);
    } else if (choice == 5) {
      x = x+10; //step right
      y = y+10; //step down
      fill(fill);
      delay(delay);
    } else if (choice == 6) {
      x = x-10; //step left
      y = y-10; //step up
      fill(fill);
      delay(delay);
    } else if (choice == 7) {
      x = x-10; //step left
      y = y+10; //step down
      fill(fill);
      delay(delay);
    }

    if (x > width) {
      x = width/2;
    } else if (x < 0) {
      x = height/2;
    }
    if (y > width) {
      y = width/2;
    } else if (y < 0) {
      y = height/2;
    }
  }
}
