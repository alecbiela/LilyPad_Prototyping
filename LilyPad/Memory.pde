class Memory
{
  //attributes
  Pad[] pads = new Pad[6];
  float timer = 0.0;
  //Groups
  int reds = 0 ; //0
  int greens = 0 ; //1
  int blues = 0 ; //2
  int correct = 0;
  int selected = 0;
  String[] padColor = new String[6];
  String[] padStatus = new String[6];
  
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
          //get a random number
          int rand = int(random(pads.length/2));
          
          switch(rand){
            case 0:
              if(reds<2){
                padColor[i] = "red";
                reds ++;
              }else if(greens<2){
                padColor[i] = "green";
                greens ++;
              }else{
                padColor[i] = "blue";
                blues++;
              }
            break;
            case 1:
              if(greens<2){
                padColor[i] = "green";
                greens ++;
              }else if(blues<2){
                padColor[i] = "blue";
                blues ++;
              }else{
                padColor[i] = "red";
                reds ++;
              }
            break;
            case 2:
              if(blues<2){
                padColor[i] = "blue";
                blues ++;
              }else if(reds<2){
                padColor[i] = "red";
                reds ++;
              }else{
                padColor[i] = "green";
                greens ++;
              }
            break;
          }
            
          
          
        }
        
        
        //OK quick sanity check
        if(reds !=2 && greens !=2 && blues !=2){
          println("Sorting ERROR");
          break;
        }
        
        //println(reds);
        
        //Everything is fine so...
        gameState = 1;
         
        
        break;
      
      case 1:
        //println("Sorting Successful");
       
        
       if(timer < 4000){
          //show their colors;
          for(int i = 0; i < pads.length; i++){
            switch(padColor[i]){
              case "red":
              pads[i].setColor(255,0,0);
              break;
              case "green":
              pads[i].setColor(0,255,0);
              break;
              case "blue":
              pads[i].setColor(0,0,255);
              break;
            }
            timer += deltaTime;
          }
        }else{ 
          //set them back to grey
          for(int i = 0; i<pads.length; i++){
            pads[i].setColor(200,200,200);
          }
          timer = 0;
          gameState = 2;
        }
        
        break;
        
      case 2:
        //println("Color Showing Successful");
        
        
        
        correct = 0;
        selected = 0;
        // query for number of correctly picked, and currently selected.
        for(int i = 0; i < pads.length; i++){
          if(padStatus[i] == "correct"){
            correct++;
          }else if(padStatus[i] == "selected"){
            selected++;
          }
        }
        
        //Are there two selected pads? if so, do they match?
        if(selected == 2){
          IntList selectedIndices = new IntList();
          for(int i = 0; i < pads.length; i++){
            if(padStatus[i] == "selected"){
              selectedIndices.push(i);
            }
          }
          
          //Check for match
          if(padColor[selectedIndices.get(0)] == padColor[selectedIndices.get(1)]){
            //Mark both as correct
            padStatus[selectedIndices.get(0)] = "correct";
            padStatus[selectedIndices.get(1)] = "correct";
            pads[selectedIndices.get(0)].setPressed(false);
            pads[selectedIndices.get(1)].setPressed(false);
          }else{
            //incorrect match
            //wait 5 seconds 
            timer += deltaTime;
            if(timer>3000){
              padStatus[selectedIndices.get(0)] = "unassigned";
              padStatus[selectedIndices.get(1)] = "unassigned";
              pads[selectedIndices.get(0)].setPressed(false);
              pads[selectedIndices.get(1)].setPressed(false);
              timer = 0;
            }
          }
        }
        
        //draw correct and selected pads as their true color
        for(int i = 0; i < pads.length; i++){
          if(padStatus[i] == "correct" || padStatus[i] == "selected"){
          switch(padColor[i]){
            case "red":
              pads[i].setColor(255,0,0);
              break;
            case "green":
              pads[i].setColor(0,255,0);
              break;
            case "blue":
              pads[i].setColor(0,0,255);
              break;
            }
          }else{
            pads[i].setColor(200,200,200);
          }
        }
        //println(padStatus);
        
        
        if(correct == pads.length){
          gameState = 3;
        }
        
        //check for clicks
        for(int i = 0; i < pads.length; i++){
          if(pads[i].pressed && padStatus[i] == "unassigned" && selected < 2){
            padStatus[i] = "selected";
          }
        }

        break;
      
      case 3:
      
      //println("Got to stage 3 correctly");
      
      
      
      //GAME OVER AND RESET
      if(timer <4000){
        for(int i = 0; i < pads.length; i++){
          pads[i].setColor(100,100,0);
        }
        timer += deltaTime;
      }else{
        reset();
      }
      
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
    for(int i = 0; i < pads.length; i++){
      padColor[i] = "unassigned";
      padStatus[i] = "unassigned";
    }
    reds = 0;
    greens = 0;
    blues = 0;
    
    timer = 0;
    
    //set state 
    gameState = 0;
    
  }
  

  

  
}