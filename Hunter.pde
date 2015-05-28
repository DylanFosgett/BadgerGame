

class Hunter {

  PVector start;
  PVector end;
  PVector loc, vel, target;
  int bulletCoolDown;
  float theta, dx, dy;
  
  Hunter(PVector location) {
    loc = location;
    vel = new PVector(random(-5, 5), random(-5, 5));
    target = new PVector(500, 500);
    start = new PVector(0.0, 0.0);
    end = new PVector(100.0, 100.0);
    bulletCoolDown = millis();
  }
  
  void run() {
    display();
    update();
    checkEdges();
    makeBullet();
    shoot();
    hitMarker();
  }
  
  void update() {
    loc.add(vel);
  }
  
  void display() {
    dx = start.x - target.x;
    dy = start.y - target.y;
    theta = atan2(dx, dy) + radians(-90);
    image(ft, loc.x, loc.y);
  }
  
  void checkEdges() {
    if (loc.x < 0) loc.x =  1050;
    if (loc.x > 1050) loc.x = 0;
    if (loc.y < 0) loc.y = height;
    if (loc.y > height) loc.y = 0;
  }
  
  void makeBullet() {
    if(loc.dist(pop.loc) < 500) {
      float dx = pop.loc.x - loc.x;
      float dy = pop.loc.y - loc.y;
      float angle = atan2(dy, dx);
      if (millis() - bulletCoolDown > 300) {
        bullets.add(new Bullet(loc, angle));
        bulletCoolDown = millis();
      }
    }
  }
  
  void shoot() {
    for(int i = 0; i < bullets.size(); i++) {
      bullets.get(i).run();
    }
  }
  
  void hitMarker() {
    for(int i = 0; i < bullets.size(); i++) {
      if (bullets.get(i).loc.dist(pop.loc) < 25) {
        ip.setHealth((0.96*ip.getHealth()));
      }
    }
  }
}
