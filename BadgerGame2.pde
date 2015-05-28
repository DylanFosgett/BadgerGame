int d, timeLapse;
boolean gamePlay, playGame;
Button b;
Hero pop = new Hero();
PImage bg, wf, player, ft;
PImage playerN, playerE, playerS, playerW;
Hunter h = new Hunter(new PVector(450, 350));
InfoPanel ip;
PImage hImg, fImg, mImg;
PImage spider;
Vendor v = new Vendor();
Flock f = new Flock();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();void setup()
{
  loadImages();


  size(1200, 900);
  ip = new InfoPanel(new PVector(1050, 0));
  b = new Button(new PVector(200, 200), 300, 150, "Play Again?" );
  playGame = true;
  timeLapse = millis();
}

void draw()
{
  background(bg);
  pop.run();
  ip.run();
  h.run();
  v.run();
  line(pop.loc.x, pop.loc.y, h.loc.x, h.loc.y);

  gameOver();
}


void loadImages() {
  hImg = loadImage("hi2.png"); 
  fImg = loadImage("fi1.png");  
  mImg = loadImage("mi1.png");
  player = loadImage("Player.png");
  ft = loadImage("CK6.png");
  bg = loadImage("Grass.png");
  wf = loadImage("WF2.png");
  playerN = loadImage("PlayerN.png");
  playerW = loadImage("PlayerW.png");
  playerS = loadImage("PlayerS.png");
  playerE = loadImage("PlayerE.png");
  spider = loadImage("spider3.png");
  imageMode(CENTER);
}

void keyPressed()
{
  if (keyCode == 'W')
  {
    pop.setDirection(1);
  }
  else if (keyCode == 'S')
  {
    pop.setDirection(2);
  }
  else if (keyCode == 'A')
  {
    pop.setDirection(3);
  }
  else if (keyCode == 'D')
  {
    pop.setDirection(4);
  }
  else if (key == ' ') {
    pop.setDirection(0);
  }
}
void mousePressed() {
  if (ip.getHealth() >= 0.01) {
    ip.setHealth((0.69*ip.getHealth()));
  }
  if (ip.getMoney() <= 1) {  
    ip.setMoney((1.25*ip.getMoney()));
  }
}

void gameOver() {
  if (ip.getHealth() < 0.05) {
    textSize(45);
    fill(255);
    text("FREE GUCCI MANE", 400, 400);
  }
}

