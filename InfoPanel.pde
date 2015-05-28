

class InfoPanel{
  //  +++++++++++++++++++++++++++++++  Properties
  PVector loc;
  float health, fuel, money, maxMoney;

  //  +++++++++++++++++++++++++++++++  Constructors
  InfoPanel(PVector location){
    loc = location;
    health = 1;
    fuel = 1;
    money = 0.01;
    maxMoney = 1;
  }
  
    //  +++++++++++++++++++++++++++++++  Behavior
    
  void run(){
    display();
   // println("health = " + health);
   // println("money = " + money);
    //update();
    //checkEdges();
  }
  
  
  void display(){
    fill(222, 222, 200);
    pushMatrix();
      translate(loc.x, loc.y);
      rect( 0,  0, 150, 900);
      //  HealthBAr
      infoBar(hImg, 20, 50, health);
      //infoBar(fImg, 50, 50, fuel);
      infoBar(mImg, 80, 50, money);
    popMatrix();
  }
  
  
  void infoBar(PImage icon, int x, int y, float v){
    int barY = y + 3;
    image(icon, x+10, y+100);
    //+++++++++++++++++++++++++++++++  shadow
    
    //fill(66,66,66, 200);
    //noStroke();
    //rect(x+7, barY, 15, barY);    
    
    //+++++++++++++++++++++++++++++++  bottom
    fill(55,222, 11);
    stroke(2);
    strokeWeight(3);
    rect(x, y, 15, barY);
    
    //+++++++++++++++++++++++++++++++  top
    //noStroke();
    fill(222,0, 0);
    rect(x, y, 15, barY - barY*v);
    
    //+++++++++++++++++++++++++++++++ keep bar full
    noStroke();
    fill(222, 222, 200);
    rect(x-1,y-100,20,99);
  }
  
  void setHealth(float v){
    health = v;
  } 
  void setMoney(float v){
    money = v;
  }
  void setFuel(float v){
    fuel = v;
  }
  
  
  float getHealth(){
    return health;
  } 
  float getMoney(){
    return money;
  }
  float getFuel(){
    return fuel;
  }
}
