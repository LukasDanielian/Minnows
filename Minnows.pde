ArrayList<Snake> snakes = new ArrayList<Snake>();

public void setup()
{
  //Settings
  fullScreen();
  rectMode(CENTER);
  frameRate(60);
  noStroke();

  //Adds snakes
  for (int i = 0; i < 50; i++)
    snakes.add(new Snake());
}

public void draw()
{
  background(#8CE0DF);
  
  //Render all snakes
  for (int i = 0; i < snakes.size(); i++)
  {
    Snake temp = snakes.get(i);
    temp.render();

    //Reset snake
    if (temp.isOffScreen())
    {
      snakes.remove(i);
      i--;
      snakes.add(new Snake());
    }
  }
}
