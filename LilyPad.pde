//enumeration for different activites - only 1 can be active at a time
enum Prototypes
{
  MUSIC,
  MEMORY,
  SIMONSAYS,
  LANDSCAPE
};

//attributes
Prototypes currentPrototype;
float lastTime = 0;
float deltaTime = 0;

Music musicActivity;
Memory memoryActivity;
SimonSays simonActivity;
Landscape landscapeActivity;

//called once for initialization
void setup()
{
  size(800,600,P2D);
  background(150);
  
  //set first prototype to music (for now)
  currentPrototype = Prototypes.MUSIC;

  //instantiate activities
  musicActivity = new Music();
  memoryActivity = new Memory();
  simonActivity = new SimonSays();
  landscapeActivity = new Landscape();
}

//called once per frame
void draw()
{
  calculateDeltaTime();
  
  //decide what to do based on the current activity
  switch(currentPrototype)
  {
    case MUSIC:  //Music Activity
      musicActivity.update(deltaTime);
      break;

    case MEMORY:  //Memory Activity
      memoryActivity.update(deltaTime);
      break;

    case SIMONSAYS:  //Simon Says Activity
      simonActivity.update(deltaTime);
      break;

    case LANDSCAPE:  //Landscape Activity
      landscapeActivity.update(deltaTime);
      break;
  }
}

//calculates deltaTime at the beginning of every frame
void calculateDeltaTime()
{
  deltaTime = millis() - lastTime;
  lastTime = millis();
}


//handles switching of activities
void keyReleased()
{
  switch(key)
  {
    case 'u':  //music activity
    case 'U':
      currentPrototype = Prototypes.MUSIC;
      break;
    case 'i':  //memory activity
    case 'I':
      currentPrototype = Prototypes.MEMORY;
      break;
    case 'o':  //simon says activity
    case 'O':
      currentPrototype = Prototypes.SIMONSAYS;
      break;
    case 'p':  //landscape activity
    case 'P':
      currentPrototype = Prototypes.LANDSCAPE;
      break;
  }
  
  println("Switched Activity to: " + currentPrototype);
}

//vusually display pad press