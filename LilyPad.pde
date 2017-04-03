
Pad[] pads = new Pad[5];
float lastTime = 0;
float deltaTime = 0;

void setup()
{
  size(800,600,P2D);
  background(150);
  
  pads[0] = new Pad(new PVector(200,150), 100,1);
  pads[1] = new Pad(new PVector(600,150), 100,2);
  pads[2] = new Pad(new PVector(400,300), 100,3);
  pads[3] = new Pad(new PVector(200,450), 100,4);
  pads[4] = new Pad(new PVector(600,450), 100,5);
}

void draw()
{
  calculateDeltaTime();
  update();
  
  for(Pad p : pads)
  {
     p.update(deltaTime);
     p.display();
  }
}

void update()
{
  
}

void calculateDeltaTime()
{
  deltaTime = millis() - lastTime;
  lastTime = millis();
}