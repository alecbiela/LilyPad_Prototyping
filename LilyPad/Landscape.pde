class Landscape
{
  //attributes
  Pad[] pads = new Pad[5];

    Pad currentPad;
  boolean padLastPressed = false;
  boolean soundPlaying = false;
  int currentIndex=0;
  
   PImage images[];
   float imageDirations[]=new float[5];
   int timer= 7;
   
   PVector imagePos[] = new PVector[5];
   
   int alphas[]= new int[5];

  
  //called once at the beginning of the program
  public Landscape()
  {
    //set up Pads with new position & size (probably could leave the 3rd argument (pad number) be)

    pads[0] = new Pad(new PVector(80,520), 100,1);
    pads[1] = new Pad(new PVector(240,520), 100,2);
    pads[2] = new Pad(new PVector(400,520), 100,3);
    pads[3] = new Pad(new PVector(560,520), 100,4);
    pads[4] = new Pad(new PVector(720,520), 100,5);   
    //setting positions for all the images
    imagePos[0]= new PVector(0,0);
    imagePos[1]= new PVector(160,0);
    imagePos[2]= new PVector(320,0);
    imagePos[3]= new PVector(480,0);
    imagePos[4]= new PVector(640,0);
    
    //loading in all the images
    images =  new PImage[5];
    for(int i =0; i< 5; i++)
    {
      images[i]=loadImage("images/test"+(i+1)+".png");
      images[i].resize(160, 450);
      imageDirations[i]=500;
      alphas[i]=0;
    }
  }
  
  //update is called once per frame
  public void update(float deltaTime)
  {

    for(int i =0; i < pads.length;i++)
    {
      
     if(pads[i].isPressed()) //<>//
      {
        alphas[i]+=(255/imageDirations[i])*(deltaTime);
        
        pads[i].setColor(255,178,102);
        //pressDuration += deltaTime;
         //padLastPressed = true;
         
      }
      else
      {
        pads[i].setColor(200,200,200);
        alphas[i]-=(255/imageDirations[i])*(deltaTime);     
      }
      
     if(alphas[i] >= 255)
    {
     alphas[i]=255;     
    }
    else if(alphas[i] <=0)
    {
          alphas[i]=0;
          
    }
     
      DrawImages(i,alphas[i]);
      
    }
    
    //called last after update logic
    this.display();
  }
  
  //draw logic goes here, called at the end of every update frame
  private void display()
  {

      //draw diving line between ground and screen
      fill(0);
      rect(0,450,800,5);
      
      fill(color(102,51,0,150));
      rect(0,455,800,145);

      //display the pads on screen
      for(Pad p : pads)
      {
         p.display();
      }
  }
 
  
  private void DrawImages(int index, int alpha)
  {
    //changing the alpha of the image based on how long it was held.
    if(alpha >= 255)
    {
          tint(255,255);
    }
    else if(alpha <=0)
    {
          tint(255,0);
          
    }
    else{
         tint(255,alpha); 
      
    }
        image(images[index], imagePos[index].x, imagePos[index].y);
    
  }

}