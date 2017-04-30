import processing.sound.*;

//Represents an individual LilyPad in the kit
class Pad
{
  //attributes
  PVector position;
  boolean pressed;
  float widthAndHeight;
  color padColor;
  int padNumber;
  SoundFile currentSound;
  boolean imageFading;
  
  //constructor takes position, size (pixels), and what "number" pad it is
  public Pad(PVector pos, float wah, int num)
  {
    position = pos;
    pressed = false;
    widthAndHeight = wah;
    padNumber = num;
    padColor = color(200,200,200);
    imageFading=false;
  }
  
  //sets the color of the pad, takes rgb as arguments
  public void setColor(int r, int g, int b)
  {
    padColor = color(r,g,b);
  }
  
  //returns the state of the pressed flag
  public boolean isPressed()
  {
    return pressed;
  }
  
  //plays a sound, takes the name of the sound (ex. "ping1.mp3")
  //returns sound duration
  public float playSound(String soundName)
  {
    println("Played sound " + soundName + " from this pad");
    currentSound = new SoundFile(LilyPad.this,"sounds/" + soundName);
    if(currentSound != null)
    {
      currentSound.amp(0.1f);
      currentSound.play();
    }
    
    return currentSound.duration();
  }
  
  //"vibrates" the pad using the motor controllers (dummy for now)
  public void vibrate(float duration)
  {
    println("Pad " + padNumber + " is vibrating!");
  }
  
  //displays the pad on the screen
  public void display()
  {
    fill(padColor);
    ellipseMode(CENTER);
    ellipse(position.x, position.y, widthAndHeight, widthAndHeight);    
  }
  
  //the pad internally handles mouse pressing, and will set its own "pressed" flag accordingly
  //you can get this state by calling isPressed() from your activity class
  void mousePress()
  {
    if((mouseX > position.x - widthAndHeight/2) && (mouseX < position.x + widthAndHeight/2))
    {
      if((mouseY > position.y - widthAndHeight/2) && (mouseY < position.y + widthAndHeight/2))
      {
        println("Pad " + padNumber + " has been pressed.");
        pressed = !pressed;
      }
    }
  }
}