
class Bullet {
  
  PVector loc, vel, target;
  float speed;
  float theta;
  int r = 2;
  
  Bullet(PVector location, float angle) {
    loc = location.get();
    theta = angle;
    
    vel = new PVector(cos(theta), sin(theta));
    speed = 15;
    vel.mult(speed);
  }
  
  void run() {
    display();
    update();
    checkEdges();
  }
  
  void display() {
    fill(250);
    pushMatrix();
      translate(loc.x , loc.y);
      ellipse(0, 0, 50, 50);
    popMatrix();
  }
  
  void update() {
    loc.add(vel);
  }
  
  void checkEdges() {
    if(bullets.size() >= 1){ 
      for(int i = 0; i < bullets.size(); i++) {
        if (loc.x + 25 < 0) bullets.remove(i);
        if (loc.x + 25 > 1050) bullets.remove(i);
        if (loc.y + 25 < 0) bullets.remove(i);
        if (loc.y + 25 > height) bullets.remove(i);
      }
    }
  }
}
  
