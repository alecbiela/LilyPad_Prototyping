class LEDColor
{
  public int r;
  public int g;
  public int b;
  public int a;
  
  public LEDColor()
  {
    r = g = b = a = (byte)0;
  }
  
  public LEDColor(int r, int g, int b, int a)
  {
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
  }
}