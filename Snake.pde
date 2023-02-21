public class Snake
{
  private float x, y, size, speed;
  private PVector pointing;
  private ArrayList<PVector> tailSpots;

  public Snake()
  {
    int side = (int)random(0, 5);
    speed = 2;
    size = random(25,50);
    tailSpots = new ArrayList<PVector>();

    //Left
    if (side == 0)
    {
      x = 0;
      y = random(0, height);
    }

    //Top
    else if (side == 1)
    {
      x = random(0, width);
      y = 0;
    }

    //Right
    else if (side == 2)
    {
      x = width;
      y = random(0, height);
    }

    //Bottom
    else
    {
      x = random(0, width);
      y = height;
    }

    pointing = new PVector(width/2-x, height/2-y).normalize();
    tailSpots.add(new PVector(x, y, size));
  }

  //Renders snake movements
  public void render()
  {
    //Render tail
    for (int i = 0; i < tailSpots.size(); i++)
    {
      PVector temp = tailSpots.get(i);

      fill(#C1500E);
      circle(temp.x, temp.y, temp.z);
      temp.z-=.5;

      //Remove small tail
      if (temp.z <= 0)
      {
        tailSpots.remove(i);
        i--;
      }
    }

    //Render snake and moves around randomly
    fill(#C1500E);
    pushMatrix();
    translate(x, y);
    rotate(pointing.heading());
    circle(0, 0, size);

    //Eyes
    strokeWeight(size/5);
    stroke(255);
    fill(0);
    circle(size * .3, size/7.5, size/10);
    circle(size * .3, -size/7.5, size/10);
    noStroke();
    popMatrix();

    //Update movement
    if (x <= width && x >= 0 && y >= 0 && y <= height)
    {
      pointing.rotate(map(noise((x + size) * .01, (y + size) * .01), 0, 1, -PI/25, PI/25));
      x += pointing.x * speed;
      y += pointing.y * speed;
      
      //Adds tails
      if(frameCount % 2 == 0)
        tailSpots.add(new PVector(x, y, size));
    } 
    
    //Move Head out of bounds
    else
    {
      x = width * 2;
      y = height * 2;
    }
  }

  //Returns true if snake is fully off screen
  public boolean isOffScreen()
  {
    return tailSpots.size() == 0;
  }

  public float getX()
  {
    return x;
  }

  public float getY()
  {
    return y;
  }

  public float getSize()
  {
    return size;
  }
}