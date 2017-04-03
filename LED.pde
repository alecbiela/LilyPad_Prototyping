class LED
{
  LEDColor thisColor;
  boolean pulsating;
  float xPos;
  float yPos;
  
  
  public LED()
  {
    thisColor = new LEDColor();
    pulsating = false;
    xPos = 400;
    yPos = 300;
  }
  
  public LED(LEDColor startingColor, float x, float y)
  {
    thisColor = startingColor;
    pulsating = false;
    xPos = x;
    yPos = y;
  }
  
  public void setColor(LEDColor newColor)
  {
    thisColor = newColor;
  }
  
  public void update()
  {
  }
  
  public void display()
  {
    ellipseMode(CENTER);
    fill(thisColor.r, thisColor.g, thisColor.b);
    ellipse(xPos, yPos, 20, 20);
  }
}