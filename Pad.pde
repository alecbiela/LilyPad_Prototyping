class Pad
{
  PVector position;
  boolean pressed;
  float widthAndHeight;
  float startingTime;
  float pressDuration;
  color padColor;
  int padNumber;
  
  LED[] leds = new LED[8];
  
  public Pad(PVector pos, float wah, int num)
  {
    LEDColor startingColor = new LEDColor(255,0,0,1);
    position = pos;
    pressed = false;
    widthAndHeight = wah;
    padNumber = num;
    pressDuration = 0;
    padColor = color(200,200,200);
   
    for(int i=0; i<8; i++)
    {
      leds[i] = new LED(startingColor, position.x + (float)(70 * Math.cos(i * Math.PI / 4)), position.y + (float)(70 * Math.sin(i * Math.PI / 4)));
    }
  }
  
  public void setColor(int r, int g, int b)
  {
    padColor = color(r,g,b);
  }
  
  public boolean isPressed()
  {
    return pressed;
  }
  
  public void playSound(String soundName)
  {
    println("Played sound " + soundName + " from this pad");
  }
  
  public void display()
  {
    fill(padColor);
    ellipseMode(CENTER);
    ellipse(position.x, position.y, widthAndHeight, widthAndHeight);
    
  }
  
  public void update(float deltaTime)
  {
    if(pressed) pressDuration += deltaTime;
  }
  
  void mousePressed()
  {
    if((mouseX > position.x - widthAndHeight/2) && (mouseX < position.x + widthAndHeight/2))
    {
      if((mouseY > position.y - widthAndHeight/2) && (mouseY < position.y + widthAndHeight/2))
      {
        pressed = !pressed;
      }
    }
  }
  
  public void releasePressed()
  {
    pressed = false;
  }
  
}