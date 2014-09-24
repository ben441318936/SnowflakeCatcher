SnowFlake storm [];
int SnowFlakeArrayLength = 100;
void setup()
{
  //your code here
  frameRate(10);
  size(500,500);
  background(0);
  storm = new SnowFlake [SnowFlakeArrayLength];
  for (int i=0; i < SnowFlakeArrayLength; i++)
  {
    storm[i] = new SnowFlake();
  }
}
void draw()
{
  //your code here
  for (int i=0; i < SnowFlakeArrayLength; i++)
  {
    storm[i].erase();
    storm[i].reset();
    storm[i].lookDown();
    storm[i].move();
    storm[i].show();
  }
}
void mouseDragged()
{
  //your code here
  fill(255,0,0);
  noStroke();
  ellipse(mouseX,mouseY,20,20);

}

class SnowFlake
{
  //class member variable declarations
  int myX,myY;
  boolean isMoving;
  SnowFlake()
  {
    //class member variable initializations
    myX = (int)(Math.random()*501);
    myY = (int)(Math.random()*501);
    isMoving = true;
  }
  void show()
  {
    //your code here
    //stroke(0);
    noStroke();
    fill(255);
    ellipse(myX,myY,10,10);

  }
  void lookDown()
  {
    //your code here
    if(get(myX,myY+11) != color(0))
    {
      isMoving = false;
    }
    else 
    {
      isMoving = true;
    }
  }
  void erase()
  {
    //your code here
    fill(0);
    stroke(0);
    ellipse(myX, myY, 11, 11);

  }
  void move()
  {
    //your code here
    if (isMoving == true)
    {
      myY++;
    }
    
  }
  void reset()
  {
    //your code here
    if(myY >= 500)
    {
      println(swag)
      myY = 0;
      myX = (int)(Math.random()*501);
    }
  }
}


