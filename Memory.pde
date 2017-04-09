class Memory
{
  //attributes
  Pad[] pads = new Pad[5];
  
  //called once at the beginning of the program
  public Memory()
  {
    //set up Pads with new position & size (probably could leave the 3rd argument (pad number) be)
    pads[0] = new Pad(new PVector(200,150), 100,1);
    pads[1] = new Pad(new PVector(600,150), 100,2);
    pads[2] = new Pad(new PVector(400,300), 100,3);
    pads[3] = new Pad(new PVector(200,450), 100,4);
    pads[4] = new Pad(new PVector(600,450), 100,5);    
  }
  
  //update is called once per frame
  public void update(float deltaTime)
  {
    
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
  
}