class SimonSays
{
  //attributes
  int currentRound;
  Pad[] pads = new Pad[5];
  IntList padOrder = new IntList();
  PVector[] padColors = new PVector[5];
  float timer;
  float timer2;
  
  //called once at the beginning of the program
  public SimonSays()
  {
    currentRound = 1;
    
    //set up Pads with new position & size (probably could leave the 3rd argument (pad number) be)
    pads[0] = new Pad(new PVector(200,150), 100,1);
    //red
    padColors[0] = new PVector(255, 100, 100);
    pads[1] = new Pad(new PVector(600,150), 100,2);
    //yellow
    padColors[1] = new PVector(255, 213, 97);
    pads[2] = new Pad(new PVector(400,300), 100,3);
    //green
    padColors[2] = new PVector(100,255,100);
    pads[3] = new Pad(new PVector(200,450), 100,4);
    //blue
    padColors[3] = new PVector(100, 100, 255);
    pads[4] = new Pad(new PVector(600,450), 100,5);
    //orange
    padColors[4] = new PVector(255, 136, 97);    
    
    //set attributes
    timer = 0.0;
    timer2 = 0.0;
  }
  
  //update is called once per frame
  public void update(float deltaTime)
  {
    //called last after update logic
    this.display();
    
    switch(currentRound)
    {
     case 1:
        //pick a random pad to set as the first instance in simon says
        padOrder.append((int)random(5));
      
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(0)].isPressed() == false)
        {
          timer += deltaTime;
          //flash it momentarily
          if(timer >= 1000 && timer <= 3000)
          {
            pads[padOrder.get(0)].setColor((int)padColors[padOrder.get(0)].x, 
            (int)padColors[padOrder.get(0)].y, (int)padColors[padOrder.get(0)].z);
          }
          else
          {
            pads[padOrder.get(0)].setColor(200, 200, 200);
          }
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(0)].isPressed())
        {
          timer2 += deltaTime;
          pads[padOrder.get(0)].setColor((int)padColors[padOrder.get(0)].x, 
          (int)padColors[padOrder.get(0)].y, (int)padColors[padOrder.get(0)].z);
          
          if(timer2 >= 300)
          {
           pads[padOrder.get(0)].setColor(200, 200, 200);
          }
          
          println("Round 1 Complete");
          currentRound = 2;
        }
        break;
        
     case 2:
        //reset the timer
        timer = 0;
         
        //pick a random pad to set as the first instance in simon says
        padOrder.append((int)random(5));
      
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(0)].isPressed() == false)
        {
          timer += deltaTime;
          //flash it momentarily
          if(timer >= 1000 && timer <= 3000)
          {
            pads[padOrder.get(0)].setColor((int)padColors[padOrder.get(0)].x, 
            (int)padColors[padOrder.get(0)].y, (int)padColors[padOrder.get(0)].z);
          }
          else
          {
            pads[padOrder.get(0)].setColor(200, 200, 200);
          }
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(0)].isPressed())
        {
          timer2 += deltaTime;
          pads[padOrder.get(0)].setColor((int)padColors[padOrder.get(0)].x, 
          (int)padColors[padOrder.get(0)].y, (int)padColors[padOrder.get(0)].z);
          
          if(timer2 >= 300)
          {
           pads[padOrder.get(0)].setColor(200, 200, 200);
          }
        }
        break;
    }
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
  
  
  
}