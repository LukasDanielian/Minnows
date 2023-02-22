public class Food
{
  private float x, y, endX, endY, xMover, yMover;
  private boolean inWater;

  public Food(float x, float y)
  {
    this.x = width/2;
    this.y = height;
    endX = x + random(-width/20, width/20);
    endY = y + random(-height/20, height/20);
    xMover = (endX - this.x) / 50;
    yMover = (endY - this.y) / 50;
  }

  //Renders food on screen
  public void render()
  {
    pushMatrix();
    fill(#896666);
    translate(x, y);
    rotate(frameCount * .1);
    square(0, 0, 15);
    popMatrix();

    x += xMover;
    y += yMover;

    //Stop throw
    if (!inWater && dist(x, y, endX, endY) < 100)
    {
      x = endX;
      y = endY;
      xMover = 0;
      yMover = 0;
      ripples.add(new Ripple(x, y, 15));
      inWater = true;

      //Move fish over
      for (int i = 0; i < minnows.size(); i++)
      {
        Minnow temp = minnows.get(i);

        if (dist(x, y, temp.getX(), temp.getY()) < width/3)
          temp.changeDir(x, y);
      }
    }
  }
  
  public boolean isEaten(float x, float y)
  {
    return dist(x,y,this.x,this.y) < 25 && inWater;
  }
  
  public float getX()
  {
    return x;
  }
  
  public float getY()
  {
    return y;
  }
}
