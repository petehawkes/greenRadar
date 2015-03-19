/**
 * Multiple Particle Systems
 * by Daniel Shiffman.  
 * 
 */
 
// A simple Particle class

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;

  boolean reversed = false;

  // One constructor
  Particle(PVector a, PVector v, PVector l, float r_) {
    acc = a.get();
    vel = v.get();
    loc = l.get();
    r = r_;
    timer = 100.0;
  }

  // Another constructor (the one we are using here)
  Particle(PVector l, int deg) {
    acc = new PVector(0, 0, 0);



    float rad = map(deg, 0, 360, 0, 2*PI);


    float x = cos(rad)*5;    
    float y = sin(rad)*5;

    vel = new PVector(x, y, 0);
    loc = l.get();
    r = 6.0;
    timer = 150.0;
  }



  void run() {
    update();
    render();
  }

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 1.0;

    if (checkMap(loc.x, loc.y, myMap) && !reversed) {
      vel.mult(-1);
      changeFrequency(timer); 
      //timer *= .5;
      reversed = true;
      r = 1.0;
    }
  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    //stroke(255, timer);
    noStroke();
    fill(255, timer);

    ellipse(loc.x, loc.y, r, r);
    //point(loc.x, loc.y);
  }

  // Is the particle still useful?
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

