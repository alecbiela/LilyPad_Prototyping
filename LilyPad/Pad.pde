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
  PShape padShape;
  PShape[] padLayers;
  PShape padGroup;
  
  //constructor takes position, size (pixels), and what "number" pad it is
  public Pad(PVector pos, float wah, int num)
  {
    position = pos;
    pressed = false;
    widthAndHeight = wah;
    padNumber = num;
    padColor = color(255,255,255);
    padShape = loadShape("images/pad.svg");
    
    //build pad
    padLayers = new PShape[6];
    padGroup = createShape(GROUP);
    buildPad();
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
      currentSound.amp(0.8f);
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
    //fill(padColor);
    //ellipseMode(CENTER);
    //ellipse(position.x, position.y, widthAndHeight, widthAndHeight);    
    
    //update color
    padGroup.getChild(1).setFill(padColor);
    padGroup.getChild(3).setFill(padColor);
    padGroup.getChild(5).setFill(padColor);
    
    //draw pad
    shapeMode(CORNERS);
    
      pushMatrix();
      translate(position.x, position.y);
      scale(widthAndHeight/padShape.width, widthAndHeight/padShape.height);
      shape(padGroup, 0, 0);
      popMatrix();

   
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
  

  public void setPressed(boolean value){
    pressed = value;
	}
	
  //builds the layers of shapes that create the illusion of the lilypad
  void buildPad()
  {
    //shapeMode(CENTER);
    
    for(int i=0; i<padLayers.length; i++)
    {
      padLayers[i] = loadShape("images/pad.svg");
    }
    
    padLayers[0].setFill(color(0));
    padLayers[0].translate(0-(padLayers[0].width/2),0-(padLayers[0].height/2));
    padGroup.addChild(padLayers[0]);

    padLayers[1].setFill(padColor);
        padLayers[1].translate(0-(padLayers[1].width/2),0-(padLayers[1].height/2));
    padLayers[1].scale(0.9);
    padGroup.addChild(padLayers[1]);
      

    padLayers[2].setFill(color(0));
        padLayers[2].translate(0-(padLayers[2].width/2),0-(padLayers[2].height/2));
    padLayers[2].scale(0.55);
    padGroup.addChild(padLayers[2]);
    
    padLayers[3].setFill(padColor);
        padLayers[3].translate(0-(padLayers[3].width/2),0-(padLayers[3].height/2));
    padLayers[3].scale(0.5);
    padGroup.addChild(padLayers[3]);
       
    padLayers[4].setFill(color(0));
    padLayers[4].translate(0-(padLayers[4].width/2),0-(padLayers[4].height/2));
    padLayers[4].scale(0.2);
    padGroup.addChild(padLayers[4]);
    
    padLayers[5].setFill(padColor);
    padLayers[5].translate(0-(padLayers[5].width/2),0-(padLayers[5].height/2));
    padLayers[5].scale(0.15);
    padGroup.addChild(padLayers[5]);
}