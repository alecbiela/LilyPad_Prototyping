class SimonSays
{
  //attributes
  int currentRound;
  Pad[] pads = new Pad[5];
  IntList padOrder = new IntList();
  PVector[] padColors = new PVector[5];
  float flashTimer;
  float pressTimer;
  float flashTimer2;
  float pressTimer2;
  boolean padPressed2;
  boolean padPressed3;
  float flashTimer3;
  float pressTimer3;
  float flashTimer4;
  float pressTimer4;
  float flashTimer5;
  float pressTimer5;
  
  
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
    flashTimer = 0.0;
    pressTimer = 0.0;
    flashTimer2 = 0.0;
    pressTimer2 = 0.0;
    flashTimer3 = 0.0;
    pressTimer3 = 0.0;
    flashTimer4 = 0.0;
    pressTimer4 = 0.0;
    flashTimer5 = 0.0;
    pressTimer5 = 0.0;
    
    for(int i = 0; i < 15; i++)
    {
      padOrder.append((int)random(5));
    }
    
  }
  
  //update is called once per frame
  public void update(float deltaTime)
  {
    //called last after update logic
    this.display();
    
    switch(currentRound)
    {
     case 1:
        //color in the pad that is active after a few seconds
        /*if(pads[padOrder.get(0)].isPressed() == false)
        {
          flashTimer += deltaTime;
          //flash it momentarily
          if(flashTimer >= 1000 && flashTimer <= 3000)
          {
            pads[padOrder.get(0)].setColor((int)padColors[padOrder.get(0)].x, 
            (int)padColors[padOrder.get(0)].y, (int)padColors[padOrder.get(0)].z);
          }
          else
          {
            pads[padOrder.get(0)].setColor(200, 200, 200);
          }
        }*/
        
        this.padNotPressed(0, flashTimer, deltaTime);
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(0)].isPressed())
        {
          pressTimer += deltaTime;
          pads[padOrder.get(0)].setColor((int)padColors[padOrder.get(0)].x, 
          (int)padColors[padOrder.get(0)].y, (int)padColors[padOrder.get(0)].z);
          
          println("Round 1 Complete");
          currentRound = 2;
        }
          
        if(pressTimer >= 20)
        {
         pads[padOrder.get(0)].setColor(200, 200, 200);
        }
        
        break;
        
     case 2:
     
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(1)].isPressed() == false)
        {
          flashTimer2 += deltaTime;
          //flash it momentarily
          if(flashTimer2 >= 1000 && flashTimer2 <= 3000)
          {
            pads[padOrder.get(1)].setColor((int)padColors[padOrder.get(1)].x, 
            (int)padColors[padOrder.get(1)].y, (int)padColors[padOrder.get(1)].z);
          }
          else
          {
            pads[padOrder.get(1)].setColor(200, 200, 200);
          }
          
          if(pressTimer >= 300)
          {
           pads[padOrder.get(1)].setColor(200, 200, 200);
          }
          
        }
        
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(2)].isPressed() == false)
        {
          flashTimer2 += deltaTime;
          //flash it momentarily
          if(flashTimer2 >= 3500 && flashTimer2 <= 5500)
          {
            pads[padOrder.get(2)].setColor((int)padColors[padOrder.get(2)].x, 
            (int)padColors[padOrder.get(2)].y, (int)padColors[padOrder.get(2)].z);
          }
          else
          {
            pads[padOrder.get(2)].setColor(200, 200, 200);
          }
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(1)].isPressed())
        {
          pressTimer2 += deltaTime;
          pads[padOrder.get(1)].setColor((int)padColors[padOrder.get(1)].x, 
          (int)padColors[padOrder.get(1)].y, (int)padColors[padOrder.get(1)].z);
          
          padPressed2 = true;
          
          if(pressTimer2 >= 300)
          {
           pads[padOrder.get(1)].setColor(200, 200, 200);
          }
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(2)].isPressed())
        {
          pressTimer2 += deltaTime;
          pads[padOrder.get(2)].setColor((int)padColors[padOrder.get(2)].x, 
          (int)padColors[padOrder.get(2)].y, (int)padColors[padOrder.get(2)].z);
          
          padPressed3 = true;
          
          if(pressTimer2 >= 1000)
          {
           pads[padOrder.get(2)].setColor(200, 200, 200);
          }
        }
        
        if(padPressed2)
        {
          if(padPressed3)
          {
           println("Round 2 Complete");
           currentRound++; 
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
  
  private void padNotPressed(int index, float fTimer, float dTime)
  {
    //color in the pad that is active after a few seconds
        if(pads[padOrder.get(index)].isPressed() == false)
        {
          fTimer += dTime;
          //flash it momentarily
          if(fTimer >= 1000 && fTimer <= 3000)
          {
            pads[padOrder.get(index)].setColor((int)padColors[padOrder.get(index)].x, 
            (int)padColors[padOrder.get(index)].y, (int)padColors[padOrder.get(index)].z);
          }
          else
          {
            pads[padOrder.get(index)].setColor(200, 200, 200);
          }
        }
  }
  
}