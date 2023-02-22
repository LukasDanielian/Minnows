public class Ripple
{
  private float x,y,size,waveLength;
  
  public Ripple(float x, float y, float size)
  {
    this.x = x;
    this.y = y;
    this.size = size;
    waveLength = random(10,20);
  }
  
  //Renders one ripple
  public void render()
  {
    stroke(#BCDADE);
    strokeWeight(waveLength);
    noFill();
    circle(x,y,size);
    noStroke();
    
    size += 2;
    waveLength -= .25;
  }
  
  //Checks if wave is over
  public boolean isOver()
  {
    return waveLength <= 0;
  }
}
