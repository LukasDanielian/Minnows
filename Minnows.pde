ArrayList<Minnow> minnows = new ArrayList<Minnow>();

public void setup()
{
  //Settings
  fullScreen();
  rectMode(CENTER);
  frameRate(60);
  noStroke();

  //Adds snakes
  for (int i = 0; i < 50; i++)
    minnows.add(new Minnow());
}

public void draw()
{
  background(#8CE0DF);
  
  //Render all snakes
  for (int i = 0; i < minnows.size(); i++)
  {
    Minnow temp = minnows.get(i);
    temp.render();

    //Reset snake
    if (temp.isOffScreen())
    {
      minnows.remove(i);
      i--;
      minnows.add(new Minnow());
    }
  }
}
