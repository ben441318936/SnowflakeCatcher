SnowFlake storm [];
void setup()
{
  //your code here
  size(500,500);
  background(0);
  
  storm = new SnowFlake [100];
  for (int i=0; i <100; i++)
  {
    storm[i] = new SnowFlake();
  }
}
void draw()
{
  //your code here
  for (int i=0; i <100; i++)
  {
    storm[i].show();
  }
}
void mouseDragged()
{
  //your code here
}

class SnowFlake
{
  //class member variable declarations
  int myX,myY,mySpeed;
  SnowFlake()
  {
    //class member variable initializations
    myX = (int)(Math.random()*501);
    myY = 0;
    mySpeed = 1;

  }
  void show()
  {
    //your code here
    ellipse(myX,myY,10,10);

  }
  void lookDown()
  {
    //your code here
  }
  void erase()
  {
    //your code here
  }
  void move()
  {
    //your code here
  }
  void wrap()
  {
    //your code here
  }
}


