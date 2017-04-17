class Memory
{
  //attributes
  Pad[] pads = new Pad[6];
  float timer = 0.0;
  //Groups
  IntList reds; //0
  IntList greens; //1
  IntList blues; //2
  
  IntList chosen;
  IntList correct;
  //Game State "Enumerator"
  int gameState; //0 is pre game shuffle, 1 is displaying chosen color for one second, 2 is playing, 3 is complete
  
  
  //CONST
  int HALFWIDTH = 400;
  int HALFHEIGHT = 300;
  
  
  
  
  //called once at the beginning of the program
  public Memory()
  {
    //set up Pads with new position & size (probably could leave the 3rd argument (pad number) be)
    pads[0] = new Pad(new PVector(HALFWIDTH-140,HALFHEIGHT+200), 100,0);
    pads[1] = new Pad(new PVector(HALFWIDTH-140,HALFHEIGHT-200), 100,1);
    pads[2] = new Pad(new PVector(HALFWIDTH+140,HALFHEIGHT+200), 100,2);
    pads[3] = new Pad(new PVector(HALFWIDTH+140,HALFHEIGHT-200), 100,3);
    pads[4] = new Pad(new PVector(HALFWIDTH-275,HALFHEIGHT), 100,4);    
    pads[5] = new Pad(new PVector(HALFWIDTH+275,HALFHEIGHT), 100,5);
    
    
    
    //Set the ball rolling.
    this.reset();
  }
  
  //update is called once per frame
  public void update(float deltaTime)
  {
    //Switch statement for behaviors
    switch(gameState){
      
      case 0:
        //Assign all pads to be one of three groups. Red, Green or Blue. 
        //Only two in each group, of course.
        
        for(int i = 0; i < pads.length; i++){
          int r = (int)random(3);
          Pad curPad = pads[i];
          
          if(r == 0){
            //Is red full? if not
            if(reds.size() != 2){
              reds.append(curPad.padNumber);
            }else
            //Is green full? if not
            if(greens.size() !=2){
              greens.append(curPad.padNumber);  
            }else
            //Have to put it in blue then.
            {
              blues.append(curPad.padNumber); 
            }
            
          }else if(r == 1){
             //Is green full? if not
             if(greens.size() !=2){
               greens.append(curPad.padNumber);
             }else
             //Is blue full? if not
             if(blues.size() !=2){
               blues.append(curPad.padNumber);
             }else
             //Have to put it in red then.
             {
               reds.append(curPad.padNumber);
             }
          }else if(r == 2){
            //Is blue full? if not
            if(blues.size() !=2){
              blues.append(curPad.padNumber);
            }else
            //Is red full? if not
            if(reds.size() !=2){
              reds.append(curPad.padNumber);
            }else
            //Have to put it in green then.
            {
              greens.append(curPad.padNumber);
            }
          }
        }
        
        //OK quick sanity check
        if(reds.size() !=2 || greens.size() !=2 || blues.size() !=2){
          println("MEMORY SORTING ERROR");
          break;
        }
        
        println(reds);
        
        //Everything is fine so...
        gameState = 1;
         
        
        break;
      
      case 1:
        //println("Sorting Successful");
        
        
        
        //show their colors;
        if(timer<3000.0){
          timer+=deltaTime;
          pads[reds.get(0)].setColor(255,0,0);
          pads[reds.get(1)].setColor(255,0,0);
          
          pads[greens.get(0)].setColor(0,255,0);
          pads[greens.get(1)].setColor(0,255,0);
          
          pads[blues.get(0)].setColor(0,0,255);
          pads[blues.get(1)].setColor(0,0,255);
        }else{
           //set them back to default.
          for(int i = 0; i < pads.length; i++){
            pads[i].setColor(200,200,200);
          }
          timer = 0.0;
          gameState = 2;
        }
        
       
        
        break;
        
      case 2:
        //println("Color Showing Successful");
        
        // They haven't yet picked two pads.
        if(chosen.size() !=2){
          for(int i = 0; i < pads.length; i++){
            //Don't let them pick the same pad twice.
            if(pads[i].pressed && pads[i].padNumber != chosen.get(0) && pads[i].padNumber != chosen.get(1)){
              // Add it to the chosen list.
              chosen.append(pads[i].padNumber);
           }
          } 
         }else{
           //2 have been selected
           
           //2 are the same
           if(matches(chosen,reds) || matches(chosen,greens) || matches(chosen,blues)){
             
             if(matches(chosen,reds)){
               pads[reds.get(0)].setColor(255,0,0);
               pads[reds.get(1)].setColor(255,0,0);
               correct.append(reds.get(0));
               correct.append(reds.get(1));
             }else if(matches(chosen,greens)){
               pads[greens.get(0)].setColor(0,255,0);
               pads[greens.get(1)].setColor(0,255,0);
               correct.append(greens.get(0));
               correct.append(greens.get(1));
             }else if(matches(chosen,blues)){
               pads[blues.get(0)].setColor(0,0,255);
               pads[blues.get(1)].setColor(0,0,255);
               correct.append(blues.get(0));
               correct.append(blues.get(1));
             }
             chosen = new IntList();
           }else{
             //2 are different i.e. incorrect selection
             
             //Wait for 3 seconds then turn the incorrect pads grey.
             if(timer<3000.0){
               timer+= deltaTime;
             }else{
               pads[chosen.get(0)].setColor(200,200,200);
               pads[chosen.get(1)].setColor(200,200,200);
               chosen = new IntList();
             }
           }
         }
         
         //Light up the pads that are pressed or are correct.
         if(chosen.size() >0){
           ///RESUME HERE
         }
         
         
         
        
        break;
      
      case 3:
        break;
      
    }
    
    
    
    //called last after update logic
    this.display();
  }
  
  //draw logic goes here, called at the end of every update frame
  private void display()
  {
    //clear screen
    background(145);
      //display the pads on screen
      for(Pad p : pads)
      {
         p.display();
      }
  }
  
  //Set the game to it's beginning state. Call when the game is over, or at the start.
  private void reset(){
    //Clear groups
    reds = new IntList();
    blues = new IntList();
    greens = new IntList();
    
    //set state 
    gameState = 0;
    
  }
  
  boolean matches(IntList list1, IntList list2){
    if(list1.get(0) == list2.get(0) || list1.get(0) == list2.get(1)){
      if(list1.get(1) == list2.get(0) || list1.get(1) == list2.get(1)){
        return true;
      }
    }
    return false;
  }
  
  boolean contains(IntList list1, int number){
    if(list1.get(0) == number || list1.get(1) == number){
      return true;
    }
    return false;
  }
  
}