class Music
{
  //attributes
  Pad[] pads = new Pad[5];
  Pad currentPad;
  boolean padLastPressed = false;
  float pressDuration;
  boolean soundPlaying = false;
  boolean end = false;
  float soundRemaining = 0;
  
  boolean colorIncreasing = true;  //the animation color
  
  //array of sounds
  String[] song1 = {"loop1.wav", "loop2.wav", "loop3.wav", "loop4.wav", "loop5.wav"};
  
  //current sound index
  int currentSongIndex = 0;
  
  
  //called once at the beginning of the program
  public Music()
  {
    //set up Pads with new position & size (probably could leave the 3rd argument (pad number) be)
    pads[0] = new Pad(new PVector(200,150), 100,1);
    pads[1] = new Pad(new PVector(600,150), 100,2);
    pads[2] = new Pad(new PVector(400,300), 100,3);
    pads[3] = new Pad(new PVector(200,450), 100,4);
    pads[4] = new Pad(new PVector(600,450), 100,5);    
    
    pressDuration = 0;
    currentPad = getRandomPad();
    println(currentPad.padNumber);
    changePad(currentPad);
  }
  
  //update is called once per frame
  public void update(float deltaTime)
  {
    if(soundPlaying)
    {
      if(end) animateAll();
      else animateBlue();
      soundRemaining -= deltaTime;
      if(soundRemaining <= 0)
      {
        soundPlaying = false;
        if(end) end = false;
        
        //update pad
        currentPad = getRandomPad();      
        changePad(currentPad);
      }
    }
    else
    {
      if(currentPad.isPressed())
      {
         currentPad.setColor(0,255,0);
         pressDuration += deltaTime;
         padLastPressed = true;
      }
      else if(!currentPad.isPressed() && padLastPressed)  //"on pad up"
      {
        println("pad up");
        currentPad.setColor(0,0,255);
        
        //play sound
        soundRemaining = currentPad.playSound(song1[currentSongIndex]) * 1000;
        soundPlaying = true;
        currentSongIndex++;
        if(currentSongIndex == song1.length)
        {
          end = true;
          currentSongIndex = 0;
        }
   
        //vibrate
        currentPad.vibrate(0);
        
        //print pad info
        println("pad pressed for " + pressDuration);
        pressDuration = 0;
        padLastPressed = false;
      }
      else
      {
        animateRed();
      }
    }
    
    //called last after update logic
    this.display();
  }
  
  //draw logic goes here, called at the end of every update frame
  private void display()
  {
      //display the pads on screen
      for(Pad p : pads)
      {
         p.display();
      }
  }
  
  //gets random pad
  private Pad getRandomPad()
  {  
    int rgen = (int)random(pads.length);
    if(pads[rgen] == currentPad) return getRandomPad();
    else return pads[rgen];
  }
  
  //changes pad to new current pad
  private void changePad(Pad target)
  {
   for(Pad p : pads)
   {
     if(p == target) p.setColor(255,0,0);
     else p.setColor(100,100,100);
   }
  }
  
  //animateReds color of current pad
  private void animateRed()
  {
    //bit shifting to find color, can also use .red(), .green(), or .blue()
    int currentRed = (currentPad.padColor >> 16) & 0xFF;
    
    if(currentRed >= 255 || currentRed <= 100) colorIncreasing = !colorIncreasing;
    
    currentPad.setColor(
      colorIncreasing ? currentRed + 2 : currentRed - 2,
      100,
      100);
  }
  
  //animateReds color of current pad
  private void animateBlue()
  {    
    //bit shifting to find color, can also use .red(), .green(), or .blue()
    int currentBlue = currentPad.padColor & 0xFF;
    
    if(currentBlue >= 255 || currentBlue <= 100) colorIncreasing = !colorIncreasing;
    
    currentPad.setColor(
      100,
      100,
      colorIncreasing ? currentBlue + 2 : currentBlue - 2);
  }
  
  //animates all pads at end of sequence
  private void animateAll()
  {
       //bit shifting to find color, can also use .red(), .green(), or .blue()
      int currentBlue = currentPad.padColor & 0xFF;
      
      if(currentBlue >= 255 || currentBlue <= 100) colorIncreasing = !colorIncreasing;
      
      for(Pad p : pads)
       p.setColor(
        100,
        100,
        colorIncreasing ? currentBlue + 2 : currentBlue - 2);
  }
  
}