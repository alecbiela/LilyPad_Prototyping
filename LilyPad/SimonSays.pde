class SimonSays
{
  //attributes
  int currentRound;
  Pad[] pads = new Pad[5];
  IntList padOrder = new IntList();
  PVector[] padColors = new PVector[5];
  float flashTimer;
  float pressTimer;
  boolean padPressed;
  float flashTimer2;
  boolean padPressed2;
  boolean padPressed3;
  float flashTimer3;
  boolean padPressed4;
  boolean padPressed5;
  boolean padPressed6;
  float flashTimer4;
  boolean padPressed7;
  boolean padPressed8;
  boolean padPressed9;
  boolean padPressed10;
  float flashTimer5;
  boolean padPressed11;
  boolean padPressed12;
  boolean padPressed13;
  boolean padPressed14;
  boolean padPressed15;
  
  
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
    resetPressTimer();
    resetFlashTimer();
    
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
     
        resetPressTimer();
        
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(0)].isPressed() == false)
        {
          flashTimer += deltaTime;
          //flash it momentarily
          if(flashTimer >= 1000 && flashTimer <= 2000)
          {
            println("Flash! 1");
            pads[padOrder.get(0)].setColor((int)padColors[padOrder.get(0)].x, 
            (int)padColors[padOrder.get(0)].y, (int)padColors[padOrder.get(0)].z);
          }
          else
          {
            pads[padOrder.get(0)].setColor(255, 255, 255);
          }
        }
          
        if(padPressed)
        {
          pressTimer++;
          println("Round 1 Complete");
          println("Reset Pad");
          pads[padOrder.get(0)].setColor(255, 255, 255);
          currentRound++;
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(0)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(0)].setColor((int)padColors[padOrder.get(0)].x, 
          (int)padColors[padOrder.get(0)].y, (int)padColors[padOrder.get(0)].z);
          
          padPressed = true;
        }
        break;
        
     case 2:
     
        resetPressTimer();
     
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(1)].isPressed() == false)
        {
          flashTimer2 += deltaTime;
          //flash it momentarily
          if(flashTimer2 >= 1000 && flashTimer2 <= 2000)
          {
            pads[padOrder.get(1)].setColor((int)padColors[padOrder.get(1)].x, 
            (int)padColors[padOrder.get(1)].y, (int)padColors[padOrder.get(1)].z);
          }
          else
          {
            pads[padOrder.get(1)].setColor(255, 255, 255);
          }
        }
        
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(2)].isPressed() == false)
        {
          flashTimer2 += deltaTime;
          //flash it momentarily
          if(flashTimer2 >= 2500 && flashTimer2 <= 3500)
          {
            pads[padOrder.get(2)].setColor((int)padColors[padOrder.get(2)].x, 
            (int)padColors[padOrder.get(2)].y, (int)padColors[padOrder.get(2)].z);
          }
          else
          {
            pads[padOrder.get(2)].setColor(255, 255, 255);
          }
        }
        
        if(padPressed2)
        {
          if(padPressed3)
          {
           pressTimer++;
           println("Round 2 Complete");
           println("Reset Pads");
           pads[padOrder.get(1)].setColor(255, 255, 255);
           pads[padOrder.get(2)].setColor(255, 255, 255);
           currentRound++; 
          }
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(1)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(1)].setColor((int)padColors[padOrder.get(1)].x, 
          (int)padColors[padOrder.get(1)].y, (int)padColors[padOrder.get(1)].z);
    
          padPressed2 = true;
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(2)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(2)].setColor((int)padColors[padOrder.get(2)].x, 
          (int)padColors[padOrder.get(2)].y, (int)padColors[padOrder.get(2)].z);
          
          padPressed3 = true;
        }
        
        break;
        
     case 3:
     
        resetPressTimer();
     
        //color in the pad that is active after a few  nseconds
        if(pads[padOrder.get(3)].isPressed() == false)
        {
          flashTimer3 += deltaTime;
          //flash it momentarily
          if(flashTimer3 >= 1000 && flashTimer3 <= 2000)
          {
            pads[padOrder.get(3)].setColor((int)padColors[padOrder.get(3)].x, 
            (int)padColors[padOrder.get(3)].y, (int)padColors[padOrder.get(3)].z);
          }
          else
          {
            pads[padOrder.get(3)].setColor(255, 255, 255);
          }
        }
        
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(4)].isPressed() == false)
        {
          flashTimer3 += deltaTime;
          //flash it momentarily
          if(flashTimer3 >= 2500 && flashTimer3 <= 3500)
          {
            pads[padOrder.get(4)].setColor((int)padColors[padOrder.get(4)].x, 
            (int)padColors[padOrder.get(4)].y, (int)padColors[padOrder.get(4)].z);
          }
          else
          {
            pads[padOrder.get(4)].setColor(255, 255, 255);
          }
        }
        
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(5)].isPressed() == false)
        {
          flashTimer3 += deltaTime;
          //flash it momentarily
          if(flashTimer3 >= 4000 && flashTimer3 <= 5000)
          {
            pads[padOrder.get(5)].setColor((int)padColors[padOrder.get(4)].x, 
            (int)padColors[padOrder.get(5)].y, (int)padColors[padOrder.get(4)].z);
          }
          else
          {
            pads[padOrder.get(5)].setColor(255, 255, 255);
          }
        }
        
        if(padPressed4)
        {
          if(padPressed5)
          {
           if(padPressed6)
           {
             pressTimer++;
             println("Round 3 Complete");
             println("Reset Pads");
             pads[padOrder.get(3)].setColor(255, 255, 255);
             pads[padOrder.get(4)].setColor(255, 255, 255);
             pads[padOrder.get(5)].setColor(255, 255, 255);
             currentRound++; 
           }
          }
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(3)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(3)].setColor((int)padColors[padOrder.get(3)].x, 
          (int)padColors[padOrder.get(3)].y, (int)padColors[padOrder.get(3)].z);
    
          padPressed4 = true;
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(4)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(4)].setColor((int)padColors[padOrder.get(4)].x, 
          (int)padColors[padOrder.get(4)].y, (int)padColors[padOrder.get(4)].z);
          
          padPressed5 = true;
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(5)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(5)].setColor((int)padColors[padOrder.get(5)].x, 
          (int)padColors[padOrder.get(5)].y, (int)padColors[padOrder.get(5)].z);
          
          padPressed6 = true;
        }
        
        break;
        
      case 4:
     
        resetPressTimer();
     
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(6)].isPressed() == false)
        {
          flashTimer4 += deltaTime;
          //flash it momentarily
          if(flashTimer4 >= 1000 && flashTimer4 <= 2000)
          {
            pads[padOrder.get(6)].setColor((int)padColors[padOrder.get(6)].x, 
            (int)padColors[padOrder.get(6)].y, (int)padColors[padOrder.get(6)].z);
          }
          else
          {
            pads[padOrder.get(6)].setColor(255, 255, 255);
          }
        }
        
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(7)].isPressed() == false)
        {
          flashTimer4 += deltaTime;
          //flash it momentarily
          if(flashTimer4 >= 2500 && flashTimer4 <= 3500)
          {
            pads[padOrder.get(7)].setColor((int)padColors[padOrder.get(7)].x, 
            (int)padColors[padOrder.get(7)].y, (int)padColors[padOrder.get(7)].z);
          }
          else
          {
            pads[padOrder.get(7)].setColor(255, 255, 255);
          }
        }
        
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(8)].isPressed() == false)
        {
          flashTimer4 += deltaTime;
          //flash it momentarily
          if(flashTimer4 >= 4000 && flashTimer4 <= 5000)
          {
            pads[padOrder.get(8)].setColor((int)padColors[padOrder.get(8)].x, 
            (int)padColors[padOrder.get(8)].y, (int)padColors[padOrder.get(8)].z);
          }
          else
          {
            pads[padOrder.get(8)].setColor(255, 255, 255);
          }
        }
        
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(9)].isPressed() == false)
        {
          flashTimer4 += deltaTime;
          //flash it momentarily
          if(flashTimer4 >= 5500 && flashTimer4 <= 6500)
          {
            pads[padOrder.get(9)].setColor((int)padColors[padOrder.get(9)].x, 
            (int)padColors[padOrder.get(9)].y, (int)padColors[padOrder.get(9)].z);
          }
          else
          {
            pads[padOrder.get(9)].setColor(255, 255, 255);
          }
        }
        
        if(padPressed7)
        {
          if(padPressed8)
          {
           if(padPressed9)
           {
             if(padPressed10)
             {
               pressTimer++;
               println("Round 4 Complete");
               println("Reset Pads");
               pads[padOrder.get(6)].setColor(255, 255, 255);
               pads[padOrder.get(7)].setColor(255, 255, 255);
               pads[padOrder.get(8)].setColor(255, 255, 255);
               pads[padOrder.get(9)].setColor(255, 255, 255);
               currentRound++;
             }
           }
          }
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(6)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(6)].setColor((int)padColors[padOrder.get(6)].x, 
          (int)padColors[padOrder.get(6)].y, (int)padColors[padOrder.get(6)].z);
    
          padPressed7 = true;
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(7)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(7)].setColor((int)padColors[padOrder.get(7)].x, 
          (int)padColors[padOrder.get(7)].y, (int)padColors[padOrder.get(7)].z);
          
          padPressed8 = true;
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(8)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(8)].setColor((int)padColors[padOrder.get(8)].x, 
          (int)padColors[padOrder.get(8)].y, (int)padColors[padOrder.get(8)].z);
          
          padPressed9 = true;
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(9)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(9)].setColor((int)padColors[padOrder.get(9)].x, 
          (int)padColors[padOrder.get(9)].y, (int)padColors[padOrder.get(9)].z);
          
          padPressed10 = true;
        }
        
        break;  
        
       case 5:
     
        resetPressTimer();
     
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(10)].isPressed() == false)
        {
          flashTimer5 += deltaTime;
          //flash it momentarily
          if(flashTimer5 >= 1000 && flashTimer5 <= 2000)
          {
            pads[padOrder.get(10)].setColor((int)padColors[padOrder.get(10)].x, 
            (int)padColors[padOrder.get(10)].y, (int)padColors[padOrder.get(10)].z);
          }
          else
          {
            pads[padOrder.get(10)].setColor(255, 255, 255);
          }
        }
        
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(11)].isPressed() == false)
        {
          flashTimer5 += deltaTime;
          //flash it momentarily
          if(flashTimer5 >= 2500 && flashTimer5 <= 3500)
          {
            pads[padOrder.get(11)].setColor((int)padColors[padOrder.get(11)].x, 
            (int)padColors[padOrder.get(11)].y, (int)padColors[padOrder.get(11)].z);
          }
          else
          {
            pads[padOrder.get(11)].setColor(255, 255, 255);
          }
        }
        
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(12)].isPressed() == false)
        {
          flashTimer5 += deltaTime;
          //flash it momentarily
          if(flashTimer5 >= 4000 && flashTimer5 <= 5000)
          {
            pads[padOrder.get(12)].setColor((int)padColors[padOrder.get(12)].x, 
            (int)padColors[padOrder.get(12)].y, (int)padColors[padOrder.get(12)].z);
          }
          else
          {
            pads[padOrder.get(12)].setColor(255, 255, 255);
          }
        }
        
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(13)].isPressed() == false)
        {
          flashTimer5 += deltaTime;
          //flash it momentarily
          if(flashTimer5 >= 5500 && flashTimer5 <= 6500)
          {
            pads[padOrder.get(13)].setColor((int)padColors[padOrder.get(13)].x, 
            (int)padColors[padOrder.get(13)].y, (int)padColors[padOrder.get(13)].z);
          }
          else
          {
            pads[padOrder.get(13)].setColor(255, 255, 255);
          }
        }
        
        //color in the pad that is active after a few seconds
        if(pads[padOrder.get(14)].isPressed() == false)
        {
          flashTimer5 += deltaTime;
          //flash it momentarily
          if(flashTimer5 >= 7000 && flashTimer5 <= 8000)
          {
            pads[padOrder.get(14)].setColor((int)padColors[padOrder.get(14)].x, 
            (int)padColors[padOrder.get(14)].y, (int)padColors[padOrder.get(14)].z);
          }
          else
          {
            pads[padOrder.get(14)].setColor(255, 255, 255);
          }
        }
        
        if(padPressed11)
        {
          if(padPressed12)
          {
           if(padPressed13)
           {
             if(padPressed14)
             {
               if(padPressed15)
               {
                 pressTimer++;
                 println("Round 5 Complete");
                 println("Reset Pads");
                 pads[padOrder.get(10)].setColor(255, 255, 255);
                 pads[padOrder.get(11)].setColor(255, 255, 255);
                 pads[padOrder.get(12)].setColor(255, 255, 255);
                 pads[padOrder.get(13)].setColor(255, 255, 255);
                 pads[padOrder.get(14)].setColor(255, 255, 255);
                 println("Game Over");
               }
             }
           }
          }
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(10)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(10)].setColor((int)padColors[padOrder.get(10)].x, 
          (int)padColors[padOrder.get(10)].y, (int)padColors[padOrder.get(10)].z);
    
          padPressed11 = true;
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(11)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(11)].setColor((int)padColors[padOrder.get(11)].x, 
          (int)padColors[padOrder.get(11)].y, (int)padColors[padOrder.get(11)].z);
          
          padPressed12 = true;
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(12)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(12)].setColor((int)padColors[padOrder.get(12)].x, 
          (int)padColors[padOrder.get(12)].y, (int)padColors[padOrder.get(12)].z);
          
          padPressed13 = true;
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(13)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(13)].setColor((int)padColors[padOrder.get(13)].x, 
          (int)padColors[padOrder.get(13)].y, (int)padColors[padOrder.get(13)].z);
          
          padPressed14 = true;
        }
        
        //if the correct pad is selected, flash it momentarily
        if(pads[padOrder.get(14)].isPressed() && pressTimer == 0)
        {
          pads[padOrder.get(14)].setColor((int)padColors[padOrder.get(14)].x, 
          (int)padColors[padOrder.get(14)].y, (int)padColors[padOrder.get(14)].z);
          
          padPressed15 = true;
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
  
  private void resetFlashTimer()
  {
    flashTimer = 0.0;
    pressTimer = 0.0;
    flashTimer2 = 0.0;
    flashTimer3 = 0.0;
    flashTimer4 = 0.0;
    flashTimer5 = 0.0;
  }
  
   private void resetPressTimer()
  {
    pressTimer = 0.0;
    //pressTimer2 = 0.0;
    //pressTimer3 = 0.0;
    //pressTimer4 = 0.0;
    //pressTimer5 = 0.0;
  }
 
  
}