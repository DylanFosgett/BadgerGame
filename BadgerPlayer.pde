

class Hero
{
  PVector loc, vel;
  boolean north, south, east, west, nothing, start;
  Flock flock;
  Hero()
  {
    loc = new PVector(400, 400);
    vel = new PVector(0, 0);
    start = true;
    north = false;
    south = false;
    east = false;
    west = false;
    nothing = true;
    generateFlock(50);
  }

  void run()
  {
    pop.display();
    pop.update();
    pop.checkEdges();
    flock.run();
    pop.eatMarker();
  }

  void generateFlock(int numBoids) {
    // Declare a flock     
    flock = new Flock();
    // Generate a flock  
    println("flock =" + numBoids);
    for (int i = 0; i < numBoids; i++) {
      flock.addBoid(new Boid(width/2, height/2));
    }
  }

  void display()
  {

    //fill(20,225);
    //ellipse(loc.x, loc.y, 100, 75); //Badger
    //image(player,loc.x,loc.y);
    if (start = true)
    {
      //      fill(255); 
      //      rect(400, 350, 428, 200);
      //      textSize(45);
      //      fill(0);
      //      text("Press space to start", 400,450);
    }
  }

  void update()
  {
    if (north == true) {
      vel.set(0, -10);
      loc.add(vel);
      image(playerN, loc.x, loc.y);
    }
    else if (south == true) {
      vel.set(0, 10);
      loc.add(vel);
      image(playerS, loc.x, loc.y);
    }
    else if (west == true) {
      vel.set(-10, 0);
      loc.add(vel);
      image(playerW, loc.x, loc.y);
    }
    else if (east == true) {
      vel.set(10, 0);
      loc.add(vel);
      image(playerE, loc.x, loc.y);
    }
    else if (nothing == true) {
      vel.set(0, 0);
      loc.add(vel);
      start = false;
      image(playerE, loc.x, loc.y);
    }
  }

  void checkEdges()
  {
    if (loc.x > 1000)
    {
      loc.x =0;
    }
    else if (loc.x < 0)
    {
      loc.x = 1000;
    }
    if (loc.y > height)
    {
      loc.y =0;
    }
    else if (loc.y < 0)
    {
      loc.y = height;
    }
  }

  void setDirection(int d)
  {
    north = false;
    south = false;
    east = false;
    west = false;
    nothing = false;

    switch(d) {
    case 1:
      north = true;
      break;
    case 2:
      south = true;
      break;
    case 3:
      west = true;
      break;
    case 4:
      east = true;
      break;
    case 0:
      nothing = true;
      break;
    }
  }
  void eatMarker() {
    for (int i = flock.boids.size()-1; i >= 0; i--) {
      if (flock.boids.get(i).loc.dist(this.loc) <= 50) {
        flock.boids.remove(i);
      }
    }
  }
} //end class

