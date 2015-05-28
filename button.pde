
class Button
{
  PVector loc;
  int myWidth;
  int myHeight;
  String myText;
  color c = color(255, 155, 0);
  Button(PVector location, int w, int h, String btnText)
  {
    loc = location;
    myWidth = w;
    myHeight = h;
    myText = btnText;
  }


  void run()
  {
    display();
  }

  void display()
  {
    fill(c);
    stroke(3);
    rect(loc.x, loc.y, myWidth, myHeight, 12);
    // ++++++++++ Text ++++++
    textSize(45);
    fill(0);
    text(myText, loc.x+30, loc.y+75);
  }


  boolean hitTest(PVector mouseLoc)
  {
    if (mouseLoc.x >= loc.x &&
      mouseLoc.x <= loc.x+myWidth &&
      mouseLoc.y >= loc.y &&
      mouseLoc.y <= loc.y+myHeight
      )
    {
      return true;
    }
    else 
      return false;
  }
  
  void gamePlay()
  {
    background(255,180,25); 
    fill(0);
    textSize(75);
    text("word", loc.x-100,loc.y-50);
  }
  
    void gameReset()
  {
    
  }
  
  void setColor(int c2)
  {
   c = c2;
  }
} // end class
