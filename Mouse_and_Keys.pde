public void mousePressed()
{
  //Throws food
  for(int i = 0; i < 5; i++)
    allFood.add(new Food(mouseX,mouseY));
}
