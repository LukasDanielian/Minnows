ArrayList<Minnow> minnows = new ArrayList<Minnow>();
ArrayList<Ripple> ripples = new ArrayList<Ripple>();
ArrayList<Food> allFood = new ArrayList<Food>();

public void setup()
{
  //Settings
  fullScreen();
  rectMode(CENTER);
  frameRate(60);
  noStroke();

  //Adds snakes
  for (int i = 0; i < 25; i++)
    minnows.add(new Minnow());
}

public void draw()
{
  background(#1E2A4D);

  //Render all fish
  for (int i = 0; i < minnows.size(); i++)
  {
    Minnow temp = minnows.get(i);
    temp.render();

    //Reset fish
    if (temp.isOffScreen())
    {
      minnows.remove(i);
      i--;
      minnows.add(new Minnow());
    }
    
    //Check if food is eaten
    for(int j = 0; j < allFood.size(); j++)
    {
      Food foodTemp = allFood.get(j);
      
      if(foodTemp.isEaten(temp.getX(),temp.getY()))
      {
        ripples.add(new Ripple(foodTemp.getX(),foodTemp.getY(),10));
        allFood.remove(j);
        j--;
      }
    }
  }

  //Render all food
  for (int i = 0; i < allFood.size(); i++)
    allFood.get(i).render();

  //Render all ripples
  for (int i = 0; i < ripples.size(); i++)
  {
    Ripple temp = ripples.get(i);
    temp.render();

    //Remove if too small
    if (temp.isOver())
    {
      ripples.remove(i);
      i--;
    }
  }

  //Add ripples
  if (frameCount % 10 == 0)
  {
    Minnow temp = minnows.get((int)random(0, minnows.size()));
    ripples.add(new Ripple(temp.getX(), temp.getY(), temp.getSize()));
  }
}
